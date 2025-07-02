#!/bin/bash

cd compose/
docker build -t rovaly-web-app:0.0.1 .
cd ..

# if this fails, you may need to run the following
#docker build --ssh default=$SSH_AUTH_SOCK -t rovaly-web-app:0.0.1
# this is becuase the id_rsa and id_rsa.pub is differnt from the ssh-agent pid running
# evaluate the following:

# eval "$(eval ssh-agent -s)"
# ssh-add ~/.ssh/id_rsa
# ssh-add -l

# this will update and add the new ssh agent pid to your id_rsa file
echo "NEW IMAGE BUILT SUCCESSFULLY"
echo "run 5-deploy-services.sh to start service suite"
