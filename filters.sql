--Find filters with columns using some customfields
SELECT distinct SR.id, SR.filtername 
FROM columnlayoutitem    CLI
INNER JOIN columnlayout  CL  ON CLI.columnlayout = CL.id
INNER JOIN searchrequest SR  ON CL.searchrequest = SR.id
WHERE CLI.fieldidentifier IN ('customfield_id');

--find filters shared with project by content
select sr.id, sr.filtername, sr.reqcontent
from searchrequest as sr
join sharepermissions as sp on sr.id = sp.entityid
where sp.param1 = 'projectID' and sr.reqcontent like '%String%';
