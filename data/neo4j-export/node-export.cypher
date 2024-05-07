MATCH (cyber:!_Bloom_Perspective_&!_Bloom_Scene_)
WITH collect(cyber) as cyberNodes
CALL apoc.export.csv.data(cyberNodes, [], null, {stream: true, quotes: 'ifNeeded'})
YIELD data
RETURN data;