-- table stage

put file://C:\Users\Avinsh\Downloads\Avinash_Job_Level.csv @%job_level_test/staged;

list @%job_level_test;

copy into job_level_test from @%job_level_test/staged file_format = (TYPE = 'CSV' FIELD_DELIMITER = ',' SKIP_HEADER = 1 FIELD_OPTIONAL
                                     LY_ENCLOSED_BY='"' encoding = 'iso-8859-1');
remove @%job_level_test/staged;

-- account stage

put file://C:\Users\warneradmin\Documents\Snowflake\csvfiles\users.csv @~/staged;

list @~;

list @~/staged;

copy into users from @~/staged file_format = (TYPE = 'CSV' FIELD_DELIMITER = ',' SKIP_HEADER = 1 FIELD_OPTIONALLY_ENCLOSED_BY='"') purge=true;

-- shared stage

CREATE OR REPLACE STAGE shared_stage
  file_format = (TYPE = 'CSV' FIELD_DELIMITER = ',' SKIP_HEADER = 1 FIELD_OPTIONALLY_ENCLOSED_BY='"');

show stages;

put file://C:\Users\warneradmin\Documents\Snowflake\csvfiles\users.csv @shared_stage/staged;

list @shared_stage;

copy into users from @shared_stage/staged purge=true;

// Database to manage stage objects, fileformats etc.

-- aws stage

CREATE OR REPLACE DATABASE MANAGE_DB;

CREATE OR REPLACE SCHEMA external_stages;


// Creating external stage

CREATE OR REPLACE STAGE MANAGE_DB.external_stages.aws_stage
    url='s3://bucketsnowflakes3'
    credentials=(aws_key_id='ABCD_DUMMY_ID' aws_secret_key='1234abcd_key');


// Description of external stage

DESC STAGE MANAGE_DB.external_stages.aws_stage; 
    
    
// Alter external stage   

ALTER STAGE aws_stage
    SET credentials=(aws_key_id='XYZ_DUMMY_ID' aws_secret_key='987xyz');
    
