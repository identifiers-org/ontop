# Seems like the ontop image does not ship with the postgres jdbc driver
#  This docker file is simply to create a image for adding that

FROM ontop/ontop:5.1.2
USER "root"
RUN ["wget", "-q", "--no-check-certificate", "https://jdbc.postgresql.org/download/postgresql-42.7.4.jar", "-O", "/tmp/postgres-jdbc-driver.jar"]
RUN ["cp", "/tmp/postgres-jdbc-driver.jar", "/opt/ontop/lib/"]
