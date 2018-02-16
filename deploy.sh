#!/bin/bash

SSH_USER=$1
SSH_HOST=$2
PLUGIN_PATH=$3

echo "Transferring files to temp directory on server..."
ssh -o StrictHostKeyChecking=no $SSH_USER@$SSH_HOST 'exit'
rsync -az --force --delete --progress --exclude 'node_modules' --exclude '.git/' ./ $SSH_USER@$SSH_HOST:$PLUGIN_PATH-temp

echo "Transfer complete. Deploying files to production..."
ssh $SSH_USER@$SSH_HOST "mv -f $PLUGIN_PATH-temp $PLUGIN_PATH"

echo "Deploy complete!"