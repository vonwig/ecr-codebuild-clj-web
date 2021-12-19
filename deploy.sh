###########################
# increment version.txt
# package into an OCI image
# deploy to ECR
# update k8s cluster
###########################

set -e

if [ -n "$(git status --porcelain)" ]; then
  echo "dirty jib. stop."
  exit -1
fi

# increment version
bb -e '(spit "version.txt" (format "v%s" (inc (Integer. (str (second (re-find #"v(\d+)" (str/trim (slurp "version.txt")))))))))'
# build OCI image to docker
clj -Tjib build 

# Update K8 cluster
pushd resources/k8s/deployment
kustomize edit set image "111664719423.dkr.ecr.us-west-1.amazonaws.com/ecr-codebuild-clj-web:$(cat ../../../version.txt)"
kustomize build . | kubectl apply -f -
popd

