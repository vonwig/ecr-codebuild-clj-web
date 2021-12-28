## authenticate to aws with a profile

```
aws-creds xxxxx sts-us-west-1
```

## install kustomize

```
brew install kustomize
```

## create kubectl context

```
aws eks update-kubeconfig --region us-west-1 --name atmtest
kubectl config use-context arn:aws:eks:us-west-1:111664719423:cluster/atmtest
```


