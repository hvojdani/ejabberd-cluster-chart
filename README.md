# Goal
this project is a workgound for deploying ejabberd cluster helm chart to kubernetes.   

first build a docker image from ejabberd/ecs base image
because we need to change image entrypoint to our 'start.sh' script

# Docker Image
  use latest image and tags 
    https://hub.docker.com/r/hv86/ejabberd-cluster
## Building your image
    cd docker
    docker build . --tag myregistery/ejabberd-custom:0.1.2
    docker push myregistery/ejabberd-custom:0.1.2

# Installing helm chart
    cd helm   
    helm install ejabberd . --set image.repository=myregistery/ejabberd-custom --set image.tag=0.1.2

# Chart values and defaults

    replicaCount: 3    
    adminPassword: admin
    cookieName: ejabberdcookie
    
    storage:
      className: null
      dataSize: 1Gi
      logSize: 500Mi
      uploadSize: 250Mi
    
    image:
      repository: hv86/ejabberd-cluster:1.0.0
      tag: 1.0.0
      pullPolicy: IfNotPresent
      pullSecret: null
    

# Accessing to ejabberd
both admin panel and xmpp can be accessed by node ports 

     kubectl apply -f ejabberd-nodeports.yaml     

   xmpp: NodeIP:30031  
   adminPanelhttps:  https://NODE_IP:30030/admin

 ## note:
 change service label to one of your pods labels if release name is 
 different from 'ejabberd' 

# Add and edit users 
 for adding and modifying users by rest api using Ejabberd.postman_collection.json postman collection can help
