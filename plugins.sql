--find plugins tables

SELECT  pluginkey, 
  pluginname, 
  c.oid::REGCLASS::text 
FROM 
  pg_class c        
RIGHT JOIN 
  pluginversion pv 
  ON c.oid::REGCLASS::TEXT ~ upper( right( md5( pluginkey ), 6 ) )   
    AND c.relkind IN ( 'r', 'p', 'v', 'm' )   
    AND c.relnamespace::REGNAMESPACE::TEXT IN ( 'public' );
