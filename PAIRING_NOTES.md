Run #1

``````
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
│ 
╵
```

aaronkanzer@Aarons-MacBook-Pro linc-hub % kubectl get pods -A
NAMESPACE      NAME                                                              READY   STATUS             RESTARTS      AGE
gpu-operator   gpu-operator-77b5674dcf-6nlwb                                     1/1     Running            0             6m24s
gpu-operator   nvidia-gpu-operator-node-feature-discovery-gc-64bc8485cd-hj9fl    1/1     Running            0             6m24s
gpu-operator   nvidia-gpu-operator-node-feature-discovery-master-7fb4d5494xz7k   1/1     Running            0             6m24s
gpu-operator   nvidia-gpu-operator-node-feature-discovery-worker-454tj           1/1     Running            0             6m24s
gpu-operator   nvidia-gpu-operator-node-feature-discovery-worker-dn8mw           1/1     Running            0             6m24s
gpu-operator   nvidia-gpu-operator-node-feature-discovery-worker-j5jds           1/1     Running            0             6m24s
gpu-operator   nvidia-gpu-operator-node-feature-discovery-worker-jl5zj           1/1     Running            0             6m24s
jupyterhub     hub-66d7cdcb76-l9tg4                                              0/1     CrashLoopBackOff   5 (56s ago)   6m16s
jupyterhub     proxy-57c7955477-k4wvd                                            1/1     Running            0             6m16s
jupyterhub     user-scheduler-5d8b9567-48ctm                                     1/1     Running            0             6m16s
jupyterhub     user-scheduler-5d8b9567-jsj94                                     1/1     Running            0             6m16s
karpenter      karpenter-b66bcf98f-6jvvz                                         1/1     Running            0             9m7s
karpenter      karpenter-b66bcf98f-cd9cw                                         1/1     Running            0             9m7s
kube-system    aws-for-fluent-bit-5nh7f                                          1/1     Running            0             6m27s
kube-system    aws-for-fluent-bit-8qbkx                                          1/1     Running            0             6m27s
kube-system    aws-for-fluent-bit-bqtz2                                          1/1     Running            0             6m27s
kube-system    aws-for-fluent-bit-dgk9v                                          1/1     Running            0             6m27s
kube-system    aws-load-balancer-controller-6f7565fb85-cw46s                     1/1     Running            0             6m26s
kube-system    aws-load-balancer-controller-6f7565fb85-sgqmc                     1/1     Running            0             6m26s
kube-system    aws-node-5sgjb                                                    2/2     Running            0             5m51s
kube-system    aws-node-8pxxn                                                    2/2     Running            0             6m36s
kube-system    aws-node-l8f9w                                                    2/2     Running            0             6m4s
kube-system    aws-node-phfqb                                                    2/2     Running            0             6m22s
kube-system    cluster-autoscaler-aws-cluster-autoscaler-bb68d74f7-zx9mq         1/1     Running            0             6m27s
kube-system    cluster-proportional-autoscaler-kube-dns-autoscaler-5d8dcc69xjr   1/1     Running            0             6m28s
kube-system    coredns-688c955fbc-jrhjz                                          1/1     Running            0             6m37s
kube-system    coredns-688c955fbc-p5l89                                          1/1     Running            0             6m37s
kube-system    ebs-csi-controller-6b46955c89-4f4jg                               6/6     Running            0             6m23s
kube-system    ebs-csi-controller-6b46955c89-s2ztn                               6/6     Running            0             6m23s
kube-system    ebs-csi-node-b2lzq                                                3/3     Running            0             6m24s
kube-system    ebs-csi-node-bg7gh                                                3/3     Running            0             6m24s
kube-system    ebs-csi-node-jkccv                                                3/3     Running            0             6m24s
kube-system    ebs-csi-node-mrmxh                                                3/3     Running            0             6m24s
kube-system    kube-proxy-4d9hl                                                  1/1     Running            0             6m5s
kube-system    kube-proxy-bjf7r                                                  1/1     Running            0             6m31s
kube-system    kube-proxy-k5mlg                                                  1/1     Running            0             6m14s
kube-system    kube-proxy-xrdtz                                                  1/1     Running            0             6m25s
aaronkanzer@Aarons-MacBook-Pro linc-hub % kubectl logs -f hub-66d7cdcb76-l9tg4   -n jupyterhub


aaronkanzer@Aarons-MacBook-Pro linc-hub % kubectl logs -f hub-66d7cdcb76-l9tg4   -n jupyterhub
Defaulting to user installation because normal site-packages is not writeable
Collecting boto3
  Downloading boto3-1.34.84-py3-none-any.whl.metadata (6.6 kB)
Collecting botocore<1.35.0,>=1.34.84 (from boto3)
  Downloading botocore-1.34.84-py3-none-any.whl.metadata (5.7 kB)
Collecting jmespath<2.0.0,>=0.7.1 (from boto3)
  Downloading jmespath-1.0.1-py3-none-any.whl.metadata (7.6 kB)
Collecting s3transfer<0.11.0,>=0.10.0 (from boto3)
  Downloading s3transfer-0.10.1-py3-none-any.whl.metadata (1.7 kB)
Requirement already satisfied: python-dateutil<3.0.0,>=2.1 in /usr/local/lib/python3.11/site-packages (from botocore<1.35.0,>=1.34.84->boto3) (2.9.0.post0)
Requirement already satisfied: urllib3!=2.2.0,<3,>=1.25.4 in /usr/local/lib/python3.11/site-packages (from botocore<1.35.0,>=1.34.84->boto3) (2.2.1)
Requirement already satisfied: six>=1.5 in /usr/local/lib/python3.11/site-packages (from python-dateutil<3.0.0,>=2.1->botocore<1.35.0,>=1.34.84->boto3) (1.16.0)
Downloading boto3-1.34.84-py3-none-any.whl (139 kB)
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 139.3/139.3 kB 3.7 MB/s eta 0:00:00
Downloading botocore-1.34.84-py3-none-any.whl (12.1 MB)
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 12.1/12.1 MB 58.2 MB/s eta 0:00:00
Downloading jmespath-1.0.1-py3-none-any.whl (20 kB)
Downloading s3transfer-0.10.1-py3-none-any.whl (82 kB)
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 82.2/82.2 kB 11.6 MB/s eta 0:00:00
Installing collected packages: jmespath, botocore, s3transfer, boto3
Successfully installed boto3-1.34.84 botocore-1.34.84 jmespath-1.0.1 s3transfer-0.10.1
[E 2024-04-16 14:09:35.885 JupyterHub app:3408]
    Traceback (most recent call last):
      File "/usr/local/lib/python3.11/site-packages/jupyterhub/app.py", line 3405, in launch_instance_async
        await self.initialize(argv)
      File "/usr/local/lib/python3.11/site-packages/jupyterhub/app.py", line 2883, in initialize
        self.load_config_file(self.config_file)
      File "/usr/local/lib/python3.11/site-packages/traitlets/config/application.py", line 118, in inner
        return method(app, *args, **kwargs)
               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^
      File "/usr/local/lib/python3.11/site-packages/traitlets/config/application.py", line 958, in load_config_file
        for config, fname in self._load_config_files(
      File "/usr/local/lib/python3.11/site-packages/traitlets/config/application.py", line 915, in _load_config_files
        config = loader.load_config()
                 ^^^^^^^^^^^^^^^^^^^^
      File "/usr/local/lib/python3.11/site-packages/traitlets/config/loader.py", line 622, in load_config
        self._read_file_as_dict()
      File "/usr/local/lib/python3.11/site-packages/traitlets/config/loader.py", line 655, in _read_file_as_dict
        exec(compile(f.read(), conf_filename, "exec"), namespace, namespace)  # noqa: S102
        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
      File "/usr/local/etc/jupyterhub/jupyterhub_config.py", line 46, in <module>
        f'http://{get_name("proxy-api")}:{get_name_env("proxy-api", "_SERVICE_PORT")}'
                                          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
      File "/usr/local/etc/jupyterhub/z2jh.py", line 73, in get_name_env
        return os.environ[env_key]
               ~~~~~~~~~~^^^^^^^^^
      File "<frozen os>", line 679, in __getitem__
    KeyError: 'PROXY_API_SERVICE_PORT'


```

RUN #2 

Apply complete! Resources: 2 added, 1 changed, 2 destroyed.

Outputs:

configure_kubectl = "aws eks --region us-east-2 update-kubeconfig --name jupyterhub-on-eks"
SUCCESS: Terraform apply of all modules completed successfully
If you need to hook this up to DNS (Route 53) use this value: kubectl get svc/proxy-public -n jupyterhub --output jsonpath={.status.loadBalancer.ingress[].hostname}


