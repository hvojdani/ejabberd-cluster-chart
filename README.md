# first build and push an image from ejabberd/ecs base image
# because we need o change image entrypoint to our 'start.sh' script

cd docker
docker build . --tag myregistery/ejabberd-custom:0.1.2
docker push myregistery/ejabberd-custom:0.1.2

# to install helm chart
cd helm
helm install ejabberd . --set image.tag=0.1.2


# both admin panel and xmpp could be accessed by node ports 
#     xmpp: 30031 for example NodeIP:30031 
#     adminPanelhttps: 30030 like https://NODE_IP:30030/admin
#
# note: change service label to one of your pods labels if release name is 
# different from 'ejabberd' 

kubectl apply -f ejabberd-nodeports.yaml
