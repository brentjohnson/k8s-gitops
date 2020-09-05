By default, the source-controller watches for sources only in the gitops-system namespace, this way cluster admins can prevent untrusted sources from being registered by users.

```bash
export GITHUB_TOKEN="<PAT>"
```

```bash
gotk bootstrap github \
  --components=source-controller,kustomize-controller,helm-controller,notification-controller \
  --path=namespaces \
  --version=latest \
  --owner=raspbernetes \
  --repository=k8s-gitops \
  --arch=arm64
```
