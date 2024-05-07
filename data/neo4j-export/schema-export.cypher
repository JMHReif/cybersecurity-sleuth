CALL apoc.export.cypher.schema(null,{stream:true})
YIELD cypherStatements
RETURN cypherStatements;