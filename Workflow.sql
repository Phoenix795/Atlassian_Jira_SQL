--Finding an occurrence of a phrase in a xml workflow descriptor
select * from jiraworkflows 
where "descriptor" like '%customfield_id%' 
order by workflowname;

--Finding an occurrence of a regex with lowercase phrase in a xml workflow descriptor
select * from jiraworkflows
where "descriptor" ~* '.*phrase.*'
order by workflowname;

--Find workflows and issue types associated with existing issues
select distinct it.pname as type, ow."name" as workflow from jiraissue as ji
join os_wfentry as ow on ji.workflow_id = ow.id
join issuetype as it on ji.issuetype = it.id
order by ow."name";

--Find project,  issue types and workflows through the association schemes
select p.pname as project, it.pname as type, wfse.workflow as workflow from workflowschemeentity wfse
left join issuetype as it on wfse.issuetype = it.id
join jiraworkflows as wf on wf.workflowname = wfse.workflow
join nodeassociation as na on na.sink_node_id=wfse.scheme
join project as p on p.id = na.source_node_id
where na.sink_node_entity like 'WorkflowScheme'
order by wfse.workflow;


--Find dashbords using some customfields
select distinct portalpage.id, portalpage.pagename, portalpage.username
from portalpage 
inner join portletconfiguration ON portalpage.id = portletconfiguration.portalpage 
inner join gadgetuserpreference ON portletconfiguration.id = gadgetuserpreference.portletconfiguration 
where userprefvalue like any (array[
'%customfield_id%', 
....]);

--Find filters with columns using some customfields
SELECT distinct SR.id, SR.filtername 
FROM columnlayoutitem    CLI
INNER JOIN columnlayout  CL  ON CLI.columnlayout = CL.id
INNER JOIN searchrequest SR  ON CL.searchrequest = SR.id
WHERE CLI.fieldidentifier IN ('customfield_id')
