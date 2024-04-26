--finding project roles by groups
select p.pkey as project_name, ,pr.name as role_name, cg.group_name as group_name
from projectroleactor pra
join project p on p.id = pra.pid
join projectrole pr on pr.id = pra.projectroleid
join cwd_group cg on cg.group_name = pra.roletypeparameter
join project p on p.id = pra.pid;

--finding project roles by users
select p.pname as project_name, pr.name as role_name, cu.display_name 
from projectroleactor pra
join projectrole pr on pr.id = pra.projectroleid
join app_user au on au.user_key = pra.roletypeparameter
join cwd_user cu on cu.lower_user_name = au.lower_user_name
join project p on p.id = pra.pid;

--getting user properties
select
  *
from app_user au
join propertyentry pe
  on au.id = pe.entity_id
  and pe.entity_name = 'ApplicationUser'
join propertystring ps
  on pe.id = ps.id;
