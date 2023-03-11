FROM ejabberd/ecs:22.10
RUN echo $HOME

USER root
COPY start.sh .
RUN chmod 755 start.sh

USER ejabberd
COPY ejabberd.yml ./conf
RUN ls -alh

ENTRYPOINT ["/home/ejabberd/start.sh"]
