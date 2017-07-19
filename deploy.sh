#!/usr/bin/env bash

if [ "$CF_BRANCH" == "staging" ]
    then
	bundle exec bin/f2y-aws-tool deploy --target=file:./deploy/hurricane-api-staging.yml & bundle exec bin/f2y-aws-tool deploy --target=file:./deploy/hurricane-staging.yml
elif [ "$CF_BRANCH" == "master" ]
    then
    bundle exec bin/f2y-aws-tool deploy --target=file:./deploy/hurricane-api-production.yml & bundle exec bin/f2y-aws-tool deploy --target=file:./deploy/hurricane-production.yml
else
    echo "Deployment disabled for branch $CF_BRANCH"
    exit 0
fi