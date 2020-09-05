By default, the source-controller watches for sources only in the gitops-system namespace, this way cluster admins can prevent untrusted sources from being registered by users.

```bash
export GITHUB_TOKEN="<PAT>"
```

```bash
gotk bootstrap github \
  --components=source-controller,kustomize-controller,helm-controller,notification-controller \
  --path=cluster \
  --version=latest \
  --owner=raspbernetes \
  --repository=k8s-gitops \
  --arch=arm64
```

```bash
gotk create source git k8s-gitops \
  --url=https://github.com/raspbernetes/k8s-gitops \
  --branch=fluxv2-init \
  --interval=30s \
  --export > ./k8s-gitop.yaml
```

```bash
gotk install \
  --components=source-controller,kustomize-controller,helm-controller,notification-controller \
  --namespace=gitops-system \
  --arch=arm64
```


{"level":"error","ts":"2020-09-05T03:06:27.032Z","logger":"controller","msg":"Reconciler error","reconcilerGroup":"kustomize.toolkit.fluxcd.io","reconcilerKind":"Kustomization","controller":"kustomization","name":"k8s-gitops","namespace":"gitops-system","error":"apply failed:

namespace/actions-runner-system unchanged\n
namespace/backups unchanged\n
namespace/flux unchanged\n
namespace/gitops-system unchanged\n
namespace/istio-operator unchanged\n
namespace/istio-system unchanged\n
namespace/kube-system unchanged\n
namespace/network unchanged\n
namespace/observability unchanged\n
namespace/openfaas unchanged\n
namespace/openfaas-fn unchanged\n
namespace/security unchanged\n
namespace/storage unchanged\n

Warning: apiextensions.k8s.io/v1beta1 CustomResourceDefinition is deprecated in v1.16+, unavailable in v1.22+; use apiextensions.k8s.io/v1 CustomResourceDefinition\n

customresourcedefinition.apiextensions.k8s.io/configs.config.gatekeeper.sh configured\n
customresourcedefinition.apiextensions.k8s.io/constrainttemplates.templates.gatekeeper.sh configured\n
customresourcedefinition.apiextensions.k8s.io/horizontalrunnerautoscalers.actions.summerwind.dev configured\n
customresourcedefinition.apiextensions.k8s.io/istiooperators.install.istio.io unchanged\n
customresourcedefinition.apiextensions.k8s.io/runnerdeployments.actions.summerwind.dev configured\n
customresourcedefinition.apiextensions.k8s.io/runnerreplicasets.actions.summerwind.dev configured\n
customresourcedefinition.apiextensions.k8s.io/runners.actions.summerwind.dev configured\n
serviceaccount/istio-operator unchanged\n
role.rbac.authorization.k8s.io/leader-election-role unchanged\n
clusterrole.rbac.authorization.k8s.io/istio-operator configured\n
clusterrole.rbac.authorization.k8s.io/manager-role configured\n
clusterrole.rbac.authorization.k8s.io/proxy-role unchanged\n
rolebinding.rbac.authorization.k8s.io/leader-election-rolebinding unchanged\n
clusterrolebinding.rbac.authorization.k8s.io/istio-operator unchanged\n
clusterrolebinding.rbac.authorization.k8s.io/manager-rolebinding unchanged\n
clusterrolebinding.rbac.authorization.k8s.io/proxy-rolebinding unchanged\n
service/controller-manager-metrics-service unchanged\n
service/webhook-service unchanged\n
service/istio-operator unchanged\n
deployment.apps/controller-manager unchanged\n
deployment.apps/istio-operator unchanged\n
deployment.apps/cloudflare-ddns unchanged\n
runner.actions.summerwind.dev/runner unchanged\n
sealedsecret.bitnami.com/controller-manager unchanged\n
sealedsecret.bitnami.com/cloud-credentials unchanged\n
sealedsecret.bitnami.com/cloudflare-cert-manager-token unchanged\n
sealedsecret.bitnami.com/cloudflare-ddns unchanged\n
sealedsecret.bitnami.com/cloudflare-external-dns unchanged\n
sealedsecret.bitnami.com/oauth2-proxy-dex unchanged\n
sealedsecret.bitnami.com/auth-generic-oauth-secret unchanged\n
sealedsecret.bitnami.com/auth-github-oauth-secret unchanged\n
sealedsecret.bitnami.com/grafana-admin-creds unchanged\n
helmrelease.helm.toolkit.fluxcd.io/velero unchanged\n

unable to recognize \"f2e4eb49-6a7d-4dfc-9109-caa91acf6be7.yaml\": no matches for kind \"Certificate\" in version \"cert-manager.io/v1alpha2\"\n

unable to recognize \"f2e4eb49-6a7d-4dfc-9109-caa91acf6be7.yaml\": no matches for kind \"Certificate\" in version \"cert-manager.io/v1alpha2\"\n

unable to recognize \"f2e4eb49-6a7d-4dfc-9109-caa91acf6be7.yaml\": no matches for kind \"ClusterIssuer\" in version \"cert-manager.io/v1alpha2\"\n

unable to recognize \"f2e4eb49-6a7d-4dfc-9109-caa91acf6be7.yaml\": no matches for kind \"ClusterIssuer\" in version \"cert-manager.io/v1alpha2\"\n

unable to recognize \"f2e4eb49-6a7d-4dfc-9109-caa91acf6be7.yaml\": no matches for kind \"Issuer\" in version \"cert-manager.io/v1alpha2\"\n

error validating \"f2e4eb49-6a7d-4dfc-9109-caa91acf6be7.yaml\": error validating data: [ValidationError(HelmRelease.spec.chart): unknown field \"name\" in io.fluxcd.toolkit.helm.v2alpha1.HelmRelease.spec.chart, ValidationError(HelmRelease.spec.chart): unknown field \"repository\" in io.fluxcd.toolkit.helm.v2alpha1.HelmRelease.spec.chart, ValidationError(HelmRelease.spec.chart): unknown field \"version\" in io.fluxcd.toolkit.helm.v2alpha1.HelmRelease.spec.chart, ValidationError(HelmRelease.spec.chart): missing required field \"spec\" in io.fluxcd.toolkit.helm.v2alpha1.HelmRelease.spec.chart, ValidationError(HelmRelease.spec): unknown field \"helmVersion\" in io.fluxcd.toolkit.helm.v2alpha1.HelmRelease.spec, ValidationError(HelmRelease.spec): missing required field \"interval\" in io.fluxcd.toolkit.helm.v2alpha1.HelmRelease.spec]; if you choose to ignore these errors, turn validation off with --validate=false\n","stacktrace":"github.com/go-logr/zapr.(*zapLogger).Error\n\t/go/pkg/mod/github.com/go-logr/zapr@v0.1.0/zapr.go:128\nsigs.k8s.io/controller-runtime/pkg/internal/controller.(*Controller).reconcileHandler\n\t/go/pkg/mod/sigs.k8s.io/controller-runtime@v0.6.2/pkg/internal/controller/controller.go:237\nsigs.k8s.io/controller-runtime/pkg/internal/controller.(*Controller).processNextWorkItem\n\t/go/pkg/mod/sigs.k8s.io/controller-runtime@v0.6.2/pkg/internal/controller/controller.go:209\nsigs.k8s.io/controller-runtime/pkg/internal/controller.(*Controller).worker\n\t/go/pkg/mod/sigs.k8s.io/controller-runtime@v0.6.2/pkg/internal/controller/controller.go:188\nk8s.io/apimachinery/pkg/util/wait.BackoffUntil.func1\n\t/go/pkg/mod/k8s.io/apimachinery@v0.18.8/pkg/util/wait/wait.go:155\nk8s.io/apimachinery/pkg/util/wait.BackoffUntil\n\t/go/pkg/mod/k8s.io/apimachinery@v0.18.8/pkg/util/wait/wait.go:156\nk8s.io/apimachinery/pkg/util/wait.JitterUntil\n\t/go/pkg/mod/k8s.io/apimachinery@v0.18.8/pkg/util/wait/wait.go:133\nk8s.io/apimachinery/pkg/util/wait.Until\n\t/go/pkg/mod/k8s.io/apimachinery@v0.18.8/pkg/util/wait/wait.go:90"}
