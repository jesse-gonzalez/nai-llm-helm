# nai-llm-helm
Monorepo for all NAI Helm Charts

## Usage

```bash
helm repo add nai-llm-helm https://jesse-gonzalez.github.io/nai-llm-helm/
helm repo update

helm install --name llm --namespace llm --create-namespace nai-llm-helm/nai-helm
```
