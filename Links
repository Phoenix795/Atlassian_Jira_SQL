--using links
select i2.linkname, p.pname, cu.email_address, date(max(j.updated)), count(j.id) from issuelink i
join jiraissue j on i."source" = j.id or i.destination = j.id 
join issuelinktype i2 on i.linktype = i2.id 
join project p on p.id = j.project 
left join app_user au on au.user_key = p."lead" 
left join cwd_user cu on au.lower_user_name = cu.lower_user_name
group by i2.linkname, p.pname, cu.email_address
order by i2.linkname;
