# nai-llm-helm

This repository contains helm charts for various Nutanix AI LLM projects

* [NAI Helm](charts/nai-helm/)
* [GPT NVD Reference Apps](charts/gptnvd-reference-app/)

## Installing Charts from this Repository

Add the Repository to Helm:

```bash
helm repo add nai-llm-helm https://jesse-gonzalez.github.io/nai-llm-helm/
helm repo update
```

Install NAI Helm:

`helm install --name llm --namespace llm --create-namespace nai-llm-helm/nai-helm`

Install GPT NVD Reference App:

`helm install --name gptnvd-referenceapp --namespace gptnvd-referenceapp --create-namespace nai-llm-helm/gptnvd-referenceapp`
