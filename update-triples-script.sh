#!/bin/bash

wget --no-check-certificate -q https://raw.githubusercontent.com/identifiers-org/ontop/refs/heads/main/idorg-ontology/idorg-ontology-materialized.rdf
wget --no-check-certificate -q https://raw.githubusercontent.com/identifiers-org/ontop/refs/heads/main/idorg-ontology/idorg-ontology.ttl
wget --no-check-certificate -q https://raw.githubusercontent.com/identifiers-org/ontop/refs/heads/main/idorg-ontology/idorg-ontology.obda
ontop materialize --db-user "$ONTOP_DB_USER" --db-password "$ONTOP_DB_PASSWORD" --db-url "$ONTOP_DB_URL" -m ./idorg-ontology.obda -t ./idorg-ontology.ttl -o ./new-idorg-ontology-materialized.rdf -p /dev/null
# if diff -q new-idorg-ontology-materialized.rdf idorg-ontology-materialized.rdf > /dev/null; then
echo Updating materialized file
old_sha=$(wget --no-check-certificate -O - -q https://api.github.com/repos/identifiers-org/ontop/contents/idorg-ontology/idorg-ontology-materialized.rdf | grep sha | cut -d\" -f4)
echo -n "{\"message\":\"Sync materialized registry tuples with database\", \"committer\":{\"name\":\"Ontop bot\", \"email\":\"identifiers-org@ebi.ac.uk\"}, \"content\":\"" > datafile
cat new-idorg-ontology-materialized.rdf|base64 >> datafile
echo "\", \"sha\": \"$old_sha\"}" >> datafile
wget --method=PUT --no-check-certificate \
     -H "Accept: application/vnd.github+json"\
     -H "Authorization: Bearer $ONTOP_GH_TOKEN"\
     -H "X-GitHub-Api-Version: 2022-11-28"\
     --body-file=datafile \
     https://api.github.com/repos/identifiers-org/ontop/contents/idorg-ontology/idorg-ontology-materialized.rdf
# else
#   echo No need to update materialized file
# fi