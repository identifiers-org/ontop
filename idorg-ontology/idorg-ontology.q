[QueryItem="Get all institutions IRIs"]
PREFIX : <http://identifiers.org/>

SELECT ?institution { 
	?institution a :Institution . 
}
[QueryItem="Get all institution names"]
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX : <http://identifiers.org/>

SELECT ?name { 
	?i a :Institution . 
	?i rdfs:label ?name .
}
[QueryItem="Get all namespaces IRIs and prefixes"]
PREFIX : <http://identifiers.org/>

SELECT ?namespace ?prefix { 
	?namespace a :Namespace ; :prefix ?prefix .
}
[QueryItem="Get all resource IRIs"]
PREFIX : <http://identifiers.org/>

SELECT ?resource { 
	?resource a :Resource . 
}
[QueryItem="Match all classes"]
PREFIX : <http://identifiers.org/>

SELECT DISTINCT ?x
WHERE {

{ ?x a :Institution } UNION { ?x a :Namespace } UNION { ?x a :Resource }

}
[QueryItem="Match all things"]
PREFIX dcat: <http://www.w3.org/ns/dcat#>

PREFIX owl: <http://www.w3.org/2002/07/owl#>

PREFIX : <http://identifiers.org/>

SELECT DISTINCT ?x
WHERE {
	?x a owl:Thing
}
[QueryItem="Num resources per institution"]
PREFIX : <http://identifiers.org/>

SELECT ?institution (COUNT(?resource) as ?num_resources) { 
	?institution a :Institution; :responsibleFor ?resource .
}
GROUP BY ?institution
[QueryItem="Resource's responsible institutions"]
PREFIX : <http://identifiers.org/>

SELECT ?resource ?institution { 
	?resource a :Resource; :responsibleInstitution ?institution.
}