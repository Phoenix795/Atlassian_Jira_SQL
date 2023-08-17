--find fields with screens

select distinct  cf.id, cf.customfieldtypekey, cf.cfname, F.NAME as "Screen Name", i.pname ,p.pname 
from project p 
join nodeassociation na on na.SOURCE_NODE_ID = p.ID and na.SOURCE_NODE_ENTITY = 'Project'
join issuetypescreenscheme itss on itss.ID = na.SINK_NODE_ID and na.SINK_NODE_ENTITY = 'IssueTypeScreenScheme'
join issuetypescreenschemeentity itsse on itsse.SCHEME = itss.ID
join issuetype i on i.id = itsse.issuetype 
join fieldscreenscheme fss on fss.ID = itsse.FIELDSCREENSCHEME
join fieldscreenschemeitem fsi on fsi.FIELDSCREENSCHEME = fss.ID
join fieldscreen F on f.ID = fsi.FIELDSCREEN
join fieldscreentab T on F.ID = T.FIELDSCREEN
join fieldscreenlayoutitem fsli on T.ID = fsli.FIELDSCREENTAB
join customfield cf on fsli.fieldidentifier ='customfield_' || cf.id
where cf.customfieldtypekey ilike '%________%';
