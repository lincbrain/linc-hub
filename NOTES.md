## Errors encountered:

Upon first run, resolved after retrying

```
│ Warning: Helm release "nvidia-gpu-operator" was created but has a failed status. Use the `helm` command to investigate the error, correct it, then run Terraform again.
│ 
│   with module.eks_data_addons.helm_release.nvidia_gpu_operator[0],
│   on .terraform/modules/eks_data_addons/nvidia-gpu-operator.tf line 1, in resource "helm_release" "nvidia_gpu_operator":
│    1: resource "helm_release" "nvidia_gpu_operator" {
│ 
╵
╷
│ Error: values don't meet the specifications of the schema(s) in the following chart(s):
│ jupyterhub:
│ - proxy.service.annotations.service.beta.kubernetes.io/aws-load-balancer-ssl-cert: Invalid type. Expected: string, given: null
│ 
│ 
│   with module.eks_data_addons.helm_release.jupyterhub[0],
│   on .terraform/modules/eks_data_addons/jupyterhub.tf line 5, in resource "helm_release" "jupyterhub":
│    5: resource "helm_release" "jupyterhub" {
│ 
╵
╷
│ Error: 1 error occurred:
│ 	* Internal error occurred: failed calling webhook "mservice.elbv2.k8s.aws": failed to call webhook: Post "https://aws-load-balancer-webhook-service.kube-system.svc:443/mutate-v1-service?timeout=10s": no endpoints available for service "aws-load-balancer-webhook-service"
│ 
│ 
│ 
│   with module.eks_data_addons.helm_release.nvidia_gpu_operator[0],
│   on .terraform/modules/eks_data_addons/nvidia-gpu-operator.tf line 1, in resource "helm_release" "nvidia_gpu_operator":
│    1: resource "helm_release" "nvidia_gpu_operator" {
│ 
╵
FAILED: Terraform apply of all modules failed
```

After cleanup and then re-install:

```
╷
│ Warning: Value for undeclared variable
│ 
│ The root module does not declare a variable named "ssl_cert_arn" but a
│ value was found in file "sandbox-lincbrain.tfvars". If you meant to use
│ this value, add a "variable" block to the configuration.
│ 
│ To silence these warnings, use TF_VAR_... environment variables to provide
│ certain "global" settings to all configurations in your organization. To
│ reduce the verbosity of these warnings, use the -compact-warnings option.
╵
╷
│ Warning: Value for undeclared variable
│ 
│ The root module does not declare a variable named "jupyterhub_name" but a
│ value was found in file "sandbox-lincbrain.tfvars". If you meant to use
│ this value, add a "variable" block to the configuration.
│ 
│ To silence these warnings, use TF_VAR_... environment variables to provide
│ certain "global" settings to all configurations in your organization. To
│ reduce the verbosity of these warnings, use the -compact-warnings option.
╵
╷
│ Warning: Helm release "jupyterhub" was created but has a failed status. Use the `helm` command to investigate the error, correct it, then run Terraform again.
│ 
│   with module.eks_data_addons.helm_release.jupyterhub[0],
│   on .terraform/modules/eks_data_addons/jupyterhub.tf line 5, in resource "helm_release" "jupyterhub":
│    5: resource "helm_release" "jupyterhub" {
│ 
╵
╷
│ Warning: Helm release "nvidia-gpu-operator" was created but has a failed status. Use the `helm` command to investigate the error, correct it, then run Terraform again.
│ 
│   with module.eks_data_addons.helm_release.nvidia_gpu_operator[0],
│   on .terraform/modules/eks_data_addons/nvidia-gpu-operator.tf line 1, in resource "helm_release" "nvidia_gpu_operator":
│    1: resource "helm_release" "nvidia_gpu_operator" {
│ 
╵
╷
│ Error: 3 errors occurred:
│ 	* Internal error occurred: failed calling webhook "mservice.elbv2.k8s.aws": failed to call webhook: Post "https://aws-load-balancer-webhook-service.kube-system.svc:443/mutate-v1-service?timeout=10s": no endpoints available for service "aws-load-balancer-webhook-service"
│ 	* Internal error occurred: failed calling webhook "mservice.elbv2.k8s.aws": failed to call webhook: Post "https://aws-load-balancer-webhook-service.kube-system.svc:443/mutate-v1-service?timeout=10s": no endpoints available for service "aws-load-balancer-webhook-service"
│ 	* Internal error occurred: failed calling webhook "mservice.elbv2.k8s.aws": failed to call webhook: Post "https://aws-load-balancer-webhook-service.kube-system.svc:443/mutate-v1-service?timeout=10s": no endpoints available for service "aws-load-balancer-webhook-service"
│ 
│ 
│ 
│   with module.eks_data_addons.helm_release.jupyterhub[0],
│   on .terraform/modules/eks_data_addons/jupyterhub.tf line 5, in resource "helm_release" "jupyterhub":
│    5: resource "helm_release" "jupyterhub" {
│ 
╵
╷
│ Error: 1 error occurred:
│ 	* Internal error occurred: failed calling webhook "mservice.elbv2.k8s.aws": failed to call webhook: Post "https://aws-load-balancer-webhook-service.kube-system.svc:443/mutate-v1-service?timeout=10s": no endpoints available for service "aws-load-balancer-webhook-service"
│ 
│ 
│ 
│   with module.eks_data_addons.helm_release.nvidia_gpu_operator[0],
│   on .terraform/modules/eks_data_addons/nvidia-gpu-operator.tf line 1, in resource "helm_release" "nvidia_gpu_operator":
│    1: resource "helm_release" "nvidia_gpu_operator" {
```

After re-running after cleanup, then install:

```
│ Error: failed to copy: httpReadSeeker: failed open: failed to do request:
Get "https://d2glxqk2uabbnd.cloudfront.net/9ebdca-071440425669-f2c05e17-0e20-a997-dcf2-eb0520a718eb/930fc8bb-9c85-4cb5-bae2-f82b51ac5864?CallerAccountId=151312473579&Expires=1712869471
&Signature=WmUqcUbDHPXZV34UIRyLbNSrqRbO--AK0PmDmaavgN1VxiQuCJ6VAk0IVT7llG-CHk~3mEf5Tjh0WPFKoTSIBUtN4O1KuBj4y1U9KfQI1IlIoF2kEtanYvlzK3vaEdHZeUW2PWWqCl~2OMJofTW0sGH8QByYQ5HLT6ZIMiVlgj4UjralCaJT3-sltyuOLlDq4wYQ4QHX9~tuqv0EhHA1j9kmHFNWiTJVZCy5YOFbi5RW2InOSAowFZWBE3nM37FBxeRxnpRbscYelqiTSU41-W00~WEMciM5uvFEQPh~WrfHE3nlg2Vq6l2moAqm~35ohvohmPw2RHfVBybSKKYBfA__&Key-Pair-Id=KSPLJWGOARK62": read tcp [2601:182:cc02:7f0:9009:bba6:a1a0:fd3f]:49987->[2600:9000:2512:4600:1d:242c:6e40:21]:443: read: connection reset by peer
```

## Additions I did to make things work:

• Added jupyterhub_name to tfvars

• Updated ensure_vars.sh script

• Made cert in us-west-1, added ARN tfvars

• Added cert to loadbalancer in dandihub.yaml

• Ran `aws eks update-kubeconfig --name jupyterhub-on-eks --region us-west-1` -- in order to inspect/alter the cluster locally

Upon successful initial launch, a pod still wasn't able to be assigned due to issues with the security groups that karpenter was working with -- e.g. mismatch in some form, somewhat of a silent error

`cleanup.sh` did bring down the nodes and EKS cluster (VPC, networking objects still remained) which was effective from a cost perspecrtive