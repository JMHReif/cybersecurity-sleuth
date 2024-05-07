//Note: This is an alternative load for the .dump file

//Setup:

//Load statements:
LOAD CSV WITH HEADERS FROM "cyber-nodes.csv" as row
WITH row
CALL {
    WITH row
    CALL apoc.merge.node([substring(row._labels,1,size(row._labels))], {_id: row._id, name: row.name}, {blocksInheritance: row.blocksInheritance, displayname: row.displayname, domain: row.domain, domainAdmin: row.domainAdmin, enabled: row.enabled, hasspn: row.hasspn, highvalue: row.highvalue, lastlogon: row.lastlogon, louvainCommunityId: row.lastlogon, objectid: row.objectid, operatingsystem: row.operatingsystem, owned: row.owned, pageRank: row.pageRank, pwdlastset: row.pwdlastset}, {}) YIELD node
    RETURN node
} in transactions of 1000 rows
WITH node as n
RETURN count(n);

LOAD CSV WITH HEADERS FROM "cyber-rels.csv" as row
WITH row
CALL {
    WITH row
    MATCH (n1 {_id: row._start})
    MATCH (n2 {_id: row._end})
    CALL apoc.merge.relationship(n1, row._type, {}, {score: row.score}) YIELD rel
    RETURN rel
} in transactions of 1000 rows
WITH rel as r
RETURN count(r);