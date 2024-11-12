This repository contains the ontology files for identifiers.org and the required code for updating the SPARQL server with the latest information from the registry. [It was the result of ELIXIR BioHackathon 2024 project 13](https://github.com/elixir-europe/biohackathon-projects-2024/blob/main/13.md).

# How it works

identifiers.org is currently hosted in the Google cloud platform using kubernetes. The sparql server and SQL containing the registry are hosted there.

This repository contains the turtle file (idorg-ontology/idorg-ontology.ttl) containing the definitions of the OWL properties and classes employed. It also contains the R2RDF mappings used to convert the relational data on the registry database into the RDF triples served by the SPARQL server. With these mappings and OWL definitions, [Ontop](https://ontop-vkg.org/) is used to materialize the registry triples.

Every morning and every update to this repository, a GitHub action takes care of updating the materialized triples file and restarting the server to make sure it is up-to-date. It runs a k8s job that generates a new materialized file with the current contents of the database, pushes that file to this repository if it is different from the current version, and triggers a restart of the SPARQL server.

# How to contribute

If you wish to contribute to this ontology and database, feel free to fork this repository, make the necessary changes, and create a pull request from the fork to this repository. We will review it and merge depending on contents. The GitHub action will immediately publish changes when PRs are merged into the main branch.

We recommend using the Protege with the ontop plugin for editing the ontology file and R2RDF mappings.

# How it is modeled

Please see our [documentation page](https://docs.identifiers.org/pages/sparql.html) for details on the data model employed.

# Useful links
- Protege ontology editor: https://protege.stanford.edu/
- ontop microservice: https://ontop-vkg.org/
- Ontop plugin for protege: https://sourceforge.net/projects/ontop4obda/
- Postgres jdbc jar: https://jdbc.postgresql.org/download/
- https://github.com/ontop/ontop-patterns-tutorial
