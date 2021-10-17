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

//  Create virtual warehouse for data scientist & DBA

// Data Scientists
CREATE WAREHOUSE DS_WH 
WITH WAREHOUSE_SIZE = 'SMALL'
WAREHOUSE_TYPE = 'STANDARD' 
AUTO_SUSPEND = 300 
AUTO_RESUME = TRUE 
MIN_CLUSTER_COUNT = 1 
MAX_CLUSTER_COUNT = 1 
SCALING_POLICY = 'STANDARD';

// DBA
CREATE WAREHOUSE DBA_WH 
WITH WAREHOUSE_SIZE = 'XSMALL'
WAREHOUSE_TYPE = 'STANDARD' 
AUTO_SUSPEND = 300 
AUTO_RESUME = TRUE 
MIN_CLUSTER_COUNT = 1 
MAX_CLUSTER_COUNT = 1 
SCALING_POLICY = 'STANDARD';




// Create role for Data Scientists & DBAs

CREATE ROLE DATA_SCIENTIST;
GRANT USAGE ON WAREHOUSE DS_WH TO ROLE DATA_SCIENTIST;

CREATE ROLE DBA;
GRANT USAGE ON WAREHOUSE DBA_WH TO ROLE DBA;


// Setting up users with roles

// Data Scientists
CREATE USER DS1 PASSWORD = 'DS1' LOGIN_NAME = 'DS1' DEFAULT_ROLE='DATA_SCIENTIST' DEFAULT_WAREHOUSE = 'DS_WH'  MUST_CHANGE_PASSWORD = FALSE;
CREATE USER DS2 PASSWORD = 'DS2' LOGIN_NAME = 'DS2' DEFAULT_ROLE='DATA_SCIENTIST' DEFAULT_WAREHOUSE = 'DS_WH'  MUST_CHANGE_PASSWORD = FALSE;
CREATE USER DS3 PASSWORD = 'DS3' LOGIN_NAME = 'DS3' DEFAULT_ROLE='DATA_SCIENTIST' DEFAULT_WAREHOUSE = 'DS_WH'  MUST_CHANGE_PASSWORD = FALSE;

GRANT ROLE DATA_SCIENTIST TO USER DS1;
GRANT ROLE DATA_SCIENTIST TO USER DS2;
GRANT ROLE DATA_SCIENTIST TO USER DS3;

// DBAs
CREATE USER DBA1 PASSWORD = 'DBA1' LOGIN_NAME = 'DBA1' DEFAULT_ROLE='DBA' DEFAULT_WAREHOUSE = 'DBA_WH'  MUST_CHANGE_PASSWORD = FALSE;
CREATE USER DBA2 PASSWORD = 'DBA2' LOGIN_NAME = 'DBA2' DEFAULT_ROLE='DBA' DEFAULT_WAREHOUSE = 'DBA_WH'  MUST_CHANGE_PASSWORD = FALSE;
CREATE USER DBA3 PASSWORD = 'DBA3' LOGIN_NAME = 'DBA3'  MUST_CHANGE_PASSWORD = FALSE;

GRANT ROLE DBA TO USER DBA1;
GRANT ROLE DBA TO USER DBA2;
GRANT ROLE DBA TO USER DBA3;

// Drop objects again

DROP USER DBA1;
DROP USER DBA2;

DROP USER DS1;
DROP USER DS2;
DROP USER DS3;

DROP ROLE DATA_SCIENTIST;
DROP ROLE DBA;

DROP WAREHOUSE DS_WH;
DROP WAREHOUSE DBA_WH;









