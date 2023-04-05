# Goal
This project is a workgound for deploying ejabberd cluster helm chart to kubernetes.   

At first building a docker image from ejabberd/ecs base image
because we need to change image entrypoint to our custom 'start.sh' script

# Docker Image
  Use latest image and tags 
    https://hub.docker.com/r/hv86/ejabberd-cluster
## Building your custom image
You can modify start.sh and ejabberd.yml files and build your custom image

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
Both admin panel and xmpp can be accessed by node ports 

     kubectl apply -f ejabberd-nodeports.yaml     

   xmpp: NodeIP:30031  
   adminPanelhttps:  https://NODE_IP:30030/admin

 ## note:
 Change service label to one of your pods labels if release name is 
 different from 'ejabberd' 

# Add and edit users 
 For adding and modifying users by rest api Ejabberd.postman_collection.json postman collection can help
