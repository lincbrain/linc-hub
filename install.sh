#!/bin/bash

source ensure_vars.sh

echo "Initializing ..."
terraform init || echo "\"terraform init\" failed"

lifecycle="dev"
# lifecycle="test"
# lifecycle="prod"

# List of Terraform modules to apply in sequence
targets=(
  "module.vpc"
  "module.eks"
)

# Apply modules in sequence
for target in "${targets[@]}"
do
  echo "Applying module $target..."
  apply_output=$(terraform apply -target="$target" -auto-approve -var-file="dev.tfvars" 2>&1 | tee /dev/tty)
  if [[ ${PIPESTATUS[0]} -eq 0 && $apply_output == *"Apply complete"* ]]; then
    echo "SUCCESS: Terraform apply of $target completed successfully"
  else
    echo "FAILED: Terraform apply of $target failed"
    exit 1
  fi
done

# Final apply to catch any remaining resources
echo "Applying remaining resources..."
apply_output=$(terraform apply -auto-approve -var-file="dev.tfvars" 2>&1 | tee /dev/tty)
if [[ ${PIPESTATUS[0]} -eq 0 && $apply_output == *"Apply complete"* ]]; then
  echo "SUCCESS: Terraform apply of all modules completed successfully"
else
  echo "FAILED: Terraform apply of all modules failed"
  exit 1
fi

echo "If you need to hook this up to DNS (Route 53) use this value:" kubectl get svc/proxy-public -n jupyterhub --output jsonpath='{.status.loadBalancer.ingress[].hostname}'
