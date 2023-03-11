FROM ejabberd/ecs:23.01
RUN echo $HOME

USER root
COPY start.sh .
RUN chmod 755 start.sh

USER ejabberd
COPY ejabberd.yml ./conf
RUN ls -alh

ENTRYPOINT ["/home/ejabberd/start.sh"]
