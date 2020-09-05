#!/usr/bin/env bash

set -eou pipefail

if [[ ! $(gotk) ]]; then
    echo "gotk needs to be installed - https://toolkit.fluxcd.io/get-started/#install-the-toolkit-cli"
    exit 1
fi

# Untaint master nodes
# TODO: Enable Ansible to allow configuring the taints to be added/removed.
[[ ! $(kubectl taint nodes --all node-role.kubernetes.io/master-) ]] && echo "Masters untainted"

gotk install \
  --components=source-controller,kustomize-controller,helm-controller,notification-controller \
  --namespace=gitops-system \
  --arch=arm64

if [[ -f .secrets/k8s-secret-fluxcd-ssh.yaml ]]; then
    echo "Applying existing SSH key pair"
    kubectl apply -f .secrets/k8s-secret-fluxcd-ssh.yaml
fi

if [[ -f bootstrap/repo.yaml ]]; then
    echo "Applying Repo Sync"
    kubectl apply -f bootstrap/repo.yaml
fi
