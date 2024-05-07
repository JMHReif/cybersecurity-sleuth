MATCH (one)-[rel]->(two)
WITH collect(DISTINCT one) as ones, collect(DISTINCT two) as twos, collect(rel) as cyberRels
CALL apoc.export.csv.data([], cyberRels, null, {stream: true, quotes: 'ifNeeded'})
YIELD data
RETURN data;