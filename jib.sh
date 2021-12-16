clj -T:jib build :main atomist.web.handler :repository 111664719423.dkr.ecr.us-west-1.amazonaws.com/ecr-codebuild-clj-web:$1 :target-creds creds.edn :target-authorizer leiningen.aws-ecr-auth
