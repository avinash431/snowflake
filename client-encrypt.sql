-- create encrypted stage
create stage encrypted_customer_stage
url='s3://customer-bucket/data/'
credentials=(aws _key_id='ABCDEFGH' aws_secret_key='12345678')
encryption=(master_key='eSxX0jzYfIamtnBKOEOxq80Au6NbSgPH5r4BDDwOaO8=');

-- create table and ingest data from stage
create table users (id bigint, name varchar(500), purchases int);
copy into users from @encrypted_customer_stage/users;

-- find top 10 users by purchases, unload into stage
create table most_purchases as select * from users order by purchases desc limit 10;
copy into @encrypted_customer_stage/most_purchases from most_purchases;
