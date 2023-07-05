--Find dashbords using some customfields
select distinct portalpage.id, portalpage.pagename, portalpage.username
from portalpage 
inner join portletconfiguration ON portalpage.id = portletconfiguration.portalpage 
inner join gadgetuserpreference ON portletconfiguration.id = gadgetuserpreference.portletconfiguration 
where userprefvalue like any (array[
'%customfield_id%', 
....
]);

--Find dashbords using some filters
SELECT pp.id, pp.username, pp.pagename, gup.USERPREFVALUE FROM portalpage pp
JOIN portletconfiguration pc on pp.id = pc.portalpage
JOIN gadgetuserpreference gup on pc.ID = gup.portletconfiguration
WHERE gup.USERPREFVALUE like any (array[
'%filter-id%'
 ....
])
order by pp.ID;
