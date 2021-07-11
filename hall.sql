drop database if exists hall;

create database hall default character set utf8mb4 collate utf8mb4_unicode_ci;
use hall;

CREATE TABLE user
(
    id int not null auto_increment,
    name varchar(20),
    age int,
    primary key (id)
);

insert into user values (1,'ads', 18);
insert into user values (2,'xuan', 21);

-- 丁璇 社区管理
create table comm_manager
(
    comm_id int not null auto_increment,
    comm_name varchar(255) not null comment '社区名称',
    primary key (comm_id)
);


insert into comm_manager values(1, '北固湾社区');


-- lucy & huang 小区管理
create table house_manager
(
    house_id int not null auto_increment,
    house_name varchar(255) not null comment '小区名称',
    comm_id int not null,
    comm_name varchar(255) not null comment '社区名称',
    primary key (house_id)
);


-- steven 收费类型
create table charge_type
(
    charge_id int not null auto_increment,
    charge_name varchar(255) not null comment '收费类型名称',
    charge_unit varchar(255) not null comment '计价单位',
    primary key (charge_id)
);


create table utility_type
(
    utility_id int not null auto_increment,
    charge_name varchar(255) not null comment '收费类型名称',
    hall_name varchar(128) not null comment '所属喜宴厅',
    hall_detail_floor varchar(32) not null comment '楼层',
    utility_table_name varchar(128) not null comment '表名称',
    utility_standard float not null comment '收费标准',
    charge_unit varchar(255) not null comment '计价单位',
    utility_rate int not null comment '倍率',
    primary key(utility_id)
);

-- yang
CREATE TABLE hall_manager
(
    hall_id int not null auto_increment,
    hall_name varchar(128) not null,
    hall_community varchar(128) not null,
    hall_house varchar(128) not null,
    hall_address varchar(128) not null,
    hall_area int,
    hall_table_num int,
    hall_deposit int not null,
    primary key (hall_id, hall_name)
);

create table hall_manager_detail
(
    hall_detail_id int not null auto_increment,
    hall_id int not null,
    hall_detail_floor varchar(32),
    hall_detail_unit varchar(32),
    hall_detail_table_num int,
    hall_detail_rent int,
    hall_detail_area int,
    foreign key (hall_id) references hall_manager(hall_id),
    primary key (hall_detail_id)
);





