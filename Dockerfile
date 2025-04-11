# Seems like the ontop image does not ship with the postgres jdbc driver
#  This docker file is mostly to create a image for adding that
#  cURL is also installed to enable interaction with the GitHub API for daily updates

FROM ontop/ontop:5.1.2
USER "root"

RUN apt-get -qq update && apt-get -qq install -y curl raptor2-utils && rm -rf /var/lib/apt/lists/*

RUN wget -q --no-check-certificate https://jdbc.postgresql.org/download/postgresql-42.7.4.jar -O /opt/ontop/lib/postgres-jdbc-driver.jar
