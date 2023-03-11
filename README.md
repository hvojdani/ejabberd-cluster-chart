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
    helm install ejabberd . --set image.repository=myregistery/ejabberd-custom --set image.tag=0.1.2

# Chart Parameters and defaults

    replicaCount: 3    
    adminPassword: asd
    cookieName: dummycookie123
    
    storage:
      className: null
      dataSize: 1Gi
      logSize: 500Mi
      uploadSize: 250Mi
    
    image:
      repository: myregistry/ejabberd-custom
      tag: 0.0.1
      pullPolicy: IfNotPresent
      pullSecret: regcred
    

# Accessing to ejabberd
both admin panel and xmpp can be accessed by node ports 

     kubectl apply -f ejabberd-nodeports.yaml     

   xmpp: NodeIP:30031  
   adminPanelhttps:  https://NODE_IP:30030/admin

 ## note:
 change service label to one of your pods labels if release name is 
 different from 'ejabberd' 

