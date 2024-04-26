--using resolution 
select r.pname, p.pname, cu.email_address, date(max(j.updated)), count(j.id) from jiraissue j 
join resolution r on j.resolution = r.id
join project p on p.id = j.project 
left join app_user au on au.user_key = p."lead" 
left join cwd_user cu on au.lower_user_name = cu.lower_user_name
group by r.pname, p.pname, cu.email_address
order by r.pname;
