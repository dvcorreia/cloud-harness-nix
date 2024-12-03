## Usage

The easier way to use this is to enable the nix flakes experimental feature and use direnv to create the development environment:

```console
echo 'use flake "github:dvcorreia/cloud-harness-nix"' > .envrc
```

> [!NOTE]  
> For a reproducible shell, specify the commit revision as shown below:
> ```console
> use flake "github:dvcorreia/cloud-harness-nix?rev=<commit-hash>"
> ```

Allowing it by running:

```console
direnv allow
```

This creates a shell with everything you need to develop [Cloud Harness (CH)](https://github.com/MetaCell/cloud-harness) applications, so you should have available in your path:

1. The CLI tools shipped with CH

```console
> type harness-deployment harness-generate harness-application
harness-deployment is /nix/store/yxmb2vv3na11n3j689p1898l740fc8n8-harness-deployment-2.3.0/bin/harness-deployment
harness-generate is /nix/store/yxmb2vv3na11n3j689p1898l740fc8n8-harness-deployment-2.3.0/bin/harness-generate
harness-application is /nix/store/yxmb2vv3na11n3j689p1898l740fc8n8-harness-deployment-2.3.0/bin/harness-application
```

2. Python libraries and dependencies required by CH

```console
> pip list | grep cloudharness
cloudharness-cli-tools 2.3.0
cloudharness_model     2.4.0
cloudharness_utils     2.4.0
```

3. And other development tools frequently used with CH:

```console
> type python node yarn gcloud docker kubectl helm skaffold   
python is /nix/store/s103chv5j8nzvi8dsdwgiqmvxzcwhcxj-python3-3.12.7-env/bin/python
node is /nix/store/ssmjpkwn410icgma2z9r71k7j35kq5aj-nodejs-slim-20.18.0/bin/node
yarn is /nix/store/0hmmpszg5wfrr43kvlk2cxjqpll0dh2z-yarn-1.22.22/bin/yarn
gcloud is /nix/store/g78r5nhaq7lfv3vz0585imws84bqqggs-google-cloud-sdk-501.0.0/bin/gcloud
docker is /nix/store/v69vm56w9v74ncyz5lccvmb8cvpsmq6p-docker-27.3.1/bin/docker
kubectl is /nix/store/4y0isz580qj1gprqihb39jzvq1h3ys8d-kubectl-1.31.2/bin/kubectl
helm is /nix/store/v0b54sqamjz5hkbbhbbn62rmhy1ynk5a-kubernetes-helm-3.16.3/bin/helm
skaffold is /nix/store/n4w8wqhfvfns2cfrn7sxhaiynvpqxcc8-skaffold-2.13.2/bin/skaffold
```
