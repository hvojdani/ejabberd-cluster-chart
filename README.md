# Description
this project is a workgound for deploying ejabberd cluster helm chart to kubernetes.   

first build a docker image from ejabberd/ecs base image
because we need to change image entrypoint to our 'start.sh' script

# Building image
    cd docker
    docker build . --tag myregistery/ejabberd-custom:0.1.2
    docker push myregistery/ejabberd-custom:0.1.2

# Installing helm chart
    cd helm   
    helm install ejabberd . --set image.tag=0.1.2


# Accessing to ejabberd
both admin panel and xmpp can be accessed by node ports 

     kubectl apply -f ejabberd-nodeports.yaml     

   xmpp: NodeIP:30031  
   adminPanelhttps:  https://NODE_IP:30030/admin

 ## note:
 change service label to one of your pods labels if release name is 
 different from 'ejabberd' 

