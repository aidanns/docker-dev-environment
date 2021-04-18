FROM guacamole/guacamole:1.3.0 as guacamole
RUN /opt/guacamole/bin/initdb.sh --postgres > /initdb.sql

FROM postgres:13 as postgres
LABEL maintainer="Aidan Nagorcka-Smith <aidanns@gmail.com>" 
COPY --from=guacamole /initdb.sql /docker-entrypoint-initdb.d/create-guacamole-db.sql
