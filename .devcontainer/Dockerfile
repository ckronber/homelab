FROM mcr.microsoft.com/devcontainers/base:debian

ARG KUBECTL_VERSION=v1.37.2
RUN curl -fsSL "https://dl.k8s.io/release/${KUBECTL_VERSION}/bin/linux/$(dpkg --print-architecture)/kubectl" \
    -o /usr/local/bin/kubectl \
    && chmod 0755 /usr/local/bin/kubectl
