ARG ARCHITECTURE
#######################################################################################################################
# Build static binary
#######################################################################################################################
FROM multiarch/alpine:${ARCHITECTURE}-v3.12 as builder

# Add unprivileged user
RUN echo nfs-client-provisioner:x:1000:1000:nfs-client-provisioner:/: > /etc_passwd

# eudev: needed for udevadm binary
RUN apk --no-cache add \
  git \
  build-base \
  go \
  upx

# Add nfs-client-provisioner
COPY nfs-client /nfs-client

WORKDIR /nfs-client

# Build like the makefile: https://github.com/kubernetes-incubator/external-storage/blob/master/nfs-client/Makefile#L30
RUN go build -a -ldflags '-extldflags -static' provisioner.go

# Minify binaries
# no upx: 50.5M
# --best: 31.6M
# --brute: does not work
RUN upx --best provisioner && \
    upx -t provisioner

#######################################################################################################################
# Final scratch image
#######################################################################################################################
FROM scratch

# Add description
LABEL org.label-schema.description="NFS Client Provisioner for Kubernetes"

# Copy the unprivileged user
COPY --from=builder /etc_passwd /etc/passwd

# Add provisioner
COPY --from=builder /nfs-client/provisioner /provisioner

USER nfs-client-provisioner
ENTRYPOINT ["/provisioner"]
