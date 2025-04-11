# The Identifiers.org Ontology Terms

Below you will find an overview of the terms created for the identifiers.org ontology. Formal definitions of these can be found at the [idorg-ontology.ttl](./idorg-ontology.ttl) file.
Aside from these terms, these files also uses terms from 
[RDF Schema](https://www.w3.org/TR/rdf-schema/), 
[VoID](https://www.w3.org/TR/void/), 
[DCAT](https://www.w3.org/TR/vocab-dcat-3/), and 
[Dublin Core](https://www.dublincore.org/specifications/dublin-core/dcmi-terms/).


> [!TIP]
> The namespace for the identifiers.org ontology terms is <http://identifiers.org/idot/>.
>
> The suggested prefix is `idot`.



## Classes

### idot:Registry
This class is destined to the registry itself.

### idot:Namespace
Class for namespace entries in the identifiers.org registry. Namespaces are identified by curie prefixes.
Each namespace references a set of identifiers that can be a full or part of a online database.

### idot:Resource
Class for resource entries in the identifiers.org registry.
These are web resources that serve data for objects under the associated namespace.
A namespace can have multiple resources for the same objects, but a resource only serves one namespace.


## Properties

### idot:prefix
CURIE prefix associated with namespace. Is unique among all namespaces.
See <https://docs.identifiers.org/pages/identification_scheme.html>.

### idot:providerCode
String that identifies the provider of a resource among the resources of the same namespace.
See <https://docs.identifiers.org/pages/identification_scheme.html>.

### idot:luiPattern
Regex pattern that describes the format of IDs under the namespace.

### idot:mirid
Legacy MIR ID for identifiers.org entries.

### idot:sampleID
A sample identifier for an entry.

### idot:urlPattern
URL pattern used to resolve provider URLs for curies. 
These alwasy include the substring `{$id}`.
On resolution, this substring is replaced with the local identifier part of the CURIE.

### idot:countryCode
ISO 3166 Alpha-2 country code where the associated resource is hosted.

### idot:isNamespaceOf
Namespace that a resource serves data for.

### idot:isOfficial
Indicates whether a resource is an Official/primary provider for its namespace.

### idot:homepage
Homepage of associate resource.

### idot:isResourceOf
Indicates the namespace that a resource serves data for.

### idot:isDeprecated
Flag that indicates whether an entry is deprecated or not.

### idot:deprecationDate
Date where the regitry marked the entry as deprecated.

### idot:deprecationOfflineDate
Approximated date where the resource or namespace become became offline.

### idot:deprecationStatement
Short explanation on what cause the resource to become deprecated.

### idot:successor
Other namespace that took over data from deprecated namespace.

### idot:hasProtectedUrls
Flag that indicates that URLs for entry require authentication.

### idot:authHelpDescription
Brief description on how to acquire credentials and authorization to access protected URLs.

### idot:authHelpUrl
URL where to find more information on how to acquire credentials and authorization to access protected URLs.