create database kishore;
use kishore;
create table if not exists vehicle(
v_id int primary key,
v_type varchar(20),
v_name varchar(20),
v_number varchar(20));
create table if not exists dealer(
d_id int primary key,
d_name varchar(20),
state varchar(20),
city varchar(20),
pincode int,
street varchar(15),
d_no int,
ph_int int);
create table if not exists edu_bus(
e_id int primary key,
e_name varchar(20),
ph_no int,
state varchar(20),
city varchar(20),
pincode int,
street varchar(20),
d_no int);
create table if not exists customer(
c_id int primary key,
c_name varchar(20),
photo_identity char(1),
ph_no int,
dob date,
state varchar(20),
city varchar(20),
pincode int,
c_id v_id d_id date
41 3 55 04-04-2014
42 2 54 02-09-2016
43 4 55 03-12-2015
44 5 52 29-09-2016
45 7 55 18-11-2013
46 1 51 10-06-2014
47 6 52 11-07-2011
48 8 52 12-06-2015
49 10 53 02-03-2014
50 9 53 11-10-2015
street varchar(20),
d_no int,
v_id int,
constraint cfk_key foreign key(v_id) references vehicle(v_id));
create table if not exists branch(
b_id int primary key,
b_name varchar(20),
state varchar(20),
city varchar(20),
pincode int,
street varchar(20),
d_no int,
phno1 int,
phno2 int,
c_id int,
v_id int,
e_id int,
constraint bvfk_key foreign key(v_id) references vehicle(v_id),
constraint bcfk_key foreign key(c_id) references customer(c_id),
constraint befk_key foreign key(e_id) references e_bus(e_id));
create table if not exists renewal(
b_id int,
c_id int,
check_license_period int,
constraint rbfk_key foreign key(b_id) references branch(b_id),
constraint rcfk_key foreign key(c_id) references customer(c_id));
create table if not exists registration(
c_id int,
v_id int,
d_id int,
date date,
primary key(c_id,v_id,d_id),
constraint vfk_key foreign key(v_id) references vehicle(v_id),
constraint cefk_key foreign key(c_id) references customer(c_id),
constraint dfk_key foreign key(d_id) references dealer(d_id));
create table if not exists contract_permission(
v_id int,
b_id int,
no_of_days int,
amount_per_seat int,
constraint fk foreign key(v_id) references vehicle(v_id),
constraint ffk foreign key(b_id) references branch(b_id));