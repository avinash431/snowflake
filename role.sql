use role accountadmin;

create role analyst;

show grants to role analyst;

grant role analyst to user anusha1234;

use role analyst;

use role accountadmin;

grant usage on warehouse my_wh to role analyst;

use role accountadmin;
grant usage on database CITIBIKE to role analyst;
grant usage on schema CITIBIKE.public to role analyst;
grant select on all tables in schema CITIBIKE.public to role analyst;

use role accountadmin;
create role developer;

show grants to role developer;

grant role analyst to role developer;
grant role developer to user anusha1234;
use role developer;

use role accountadmin;
grant usage on database WEATHER to role developer;
grant usage on schema WEATHER.public to role developer;
grant select on all tables in schema WEATHER.public to role developer;

use role accountadmin;
create role ci;

grant role developer to role ci;
grant role ci to user anusha1234;

use role ci;


grant usage on database WEATHER to role developer;
grant usage on schema WEATHER.public to role developer;
grant select on all tables in schema WEATHER.public to role developer;

grant insert on all tables in schema WEATHER.public to role developer;
grant update on all tables in schema WEATHER.public to role developer;











