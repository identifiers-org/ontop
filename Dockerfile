# Seems like the ontop image does not ship with the postgres connector
#  This docker file is simply to create a image for adding that

FROM ontop/ontop:5.1.2

COPY ./bins/postgresql-42.7.3.jar /opt/ontop/lib/
