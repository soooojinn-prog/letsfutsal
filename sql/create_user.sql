-- Drop user and schema
drop database if exists letsfutsal;
drop user if exists letsfutsal@localhost;
flush privileges;

-- Create new user 'letsfutsal' and database 'letsfutsal'
-- Do this only once per development DBMS
create database letsfutsal;
create user if not exists letsfutsal@localhost identified by 'letsfutsal';
grant all privileges on letsfutsal.* to letsfutsal@localhost;
grant system_variables_admin, super on *.* to letsfutsal@localhost;
flush privileges;
-- To allow letsfutsal user to create trigger, this must be set to 1 :(
set persist log_bin_trust_function_creators = 1;
