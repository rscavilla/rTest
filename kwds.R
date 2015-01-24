require(RODBC)
db <- odbcConnect("RSWA - Remote")

kwds <- sqlQuery(db, "select k.*
from Keywords as k
where domainId in
(select id from Domains where accountId = 0 and active = true)
and k.active = true
")


domains <- sqlQuery(db, "select id, name from Domains where accountId = 0 and active = true")
