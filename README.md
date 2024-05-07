This is an initial setup of ontop for the identifiers.org registry

# Setup

You should use Protege with the ontop extension to edit the ontology and mappings. You can also test SPARQL queries through it.

To test the ontop endpoint service, use the docker compose file. For this, you will need to use the Dockerfile to create a ontop image with the postgres jar in its libraries. You will likely need to update the COPY command on the Dockerfile depending on the location and version of the jar.

**This assumes the existence of sql files to initialize the Postgres DB. Request the files if you want to run ontop. I will setup a minimum db in the future.**

# Useful links
- Protege ontology editor: https://protege.stanford.edu/
- ontop microservice: https://ontop-vkg.org/
- Ontop plugin for protege: https://sourceforge.net/projects/ontop4obda/
- Postgres jdbc jar: https://jdbc.postgresql.org/download/
- https://github.com/ontop/ontop-patterns-tutorial
