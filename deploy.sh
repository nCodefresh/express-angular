#!/usr/bin/env bash
cat /codefresh/volume/env_vars_to_export

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

const EXPORTED_ENVIRONMENT_VARIABLES_FILE_NAME         = `/codefresh/volume/env_vars_to_export`;
const EXPORTED_ENVIRONMENT_VARIABLES_FILE_CONTENTS     =
          `# This file was automatically generated by Codefresh
# This file can contain environment variables to be exported from the container on step completion.
# Example: VAR="VALUE OF VARIABLE"
`;
const EXPORTED_ENVIRONMENT_VARIABLES_FILE_SH_COMMAND   =
          `cat /dev/null > ${EXPORTED_ENVIRONMENT_VARIABLES_FILE_NAME} &&
chmod 664 ${EXPORTED_ENVIRONMENT_VARIABLES_FILE_NAME} &&
cat <<EOF > ${EXPORTED_ENVIRONMENT_VARIABLES_FILE_NAME}
${EXPORTED_ENVIRONMENT_VARIABLES_FILE_CONTENTS}
EOF`;