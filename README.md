# blogis
my first blog

![Build](https://github.com/case0sh/blogis/actions/workflows/docker-build.yml/badge.svg)

```bash
gcloud container clusters get-credentials cluster   --location=europe-north1-c

 export KUBECONFIG=~case/.kube/admin.conf
 kubectl apply -f https://openebs.github.io/charts/openebs-operator-lite.yaml
 kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.12.1/manifests/namespace.yaml\nkubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.12.1/manifests/metallb.yaml
 kubectl apply -f metallb-configmap.yaml
 kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml
 kubectl patch deployment metrics-server -n kube-system --type='json' -p='[{"op": "add", "path": "/spec/template/spec/containers/0/args/-", "value": "--kubelet-insecure-tls"}]'


kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.8.0/deploy/static/provider/cloud/deploy.yaml
kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.12.4/cert-manager.yaml


kubectl create secret generic pgpassword  --from-literal=password='Root4disk'

helm install prom prometheus-community/kube-prometheus-stackkubectl config view
kubectl config view
kubectl get all
kubectl config use-context qakube --kubeconfig=imo-qa.yml
kubectl get nodes --kubeconfig=imo-qa.yml
kubectl config get-contexts
kubectl config set-context qakube
kubectl config use-context qakube
kubectl config view   --kubeconfig=imo-qa.yml --merge --flatten > config
chmod o-r ~/.kube/config


kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d

kubectl create namespace argo
kubectl apply -n argo -f https://github.com/argoproj/argo-workflows/releases/download/v3.4.10/install.yaml


DOCKER_USERNAME=AI_
DOCKER_PASSWORD=glpat-P9


kubectl create namespace airoom

bash
