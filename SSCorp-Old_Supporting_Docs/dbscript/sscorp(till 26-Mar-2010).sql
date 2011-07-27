create table sscorp_customerDetails_t(
customer_id int auto_increment primary key,
first_name varchar(50) not null,
last_name varchar(50),
gender varchar(5) not null,
email_id varchar(100) not null,
company_name varchar(50),
company_website varchar(50),
phone_no varchar(20),
mobile_no varchar(20)
)engine=innodb

go

create table sscorp_companyProfile_m(
company_id int auto_increment primary key,
company_name varchar(50) not null,
founder_name varchar(200) not null,
co_founders_name varchar(200),
present_CEO varchar(50) not null,
company_phone varchar(20),
email_id varchar(50) not null,
company_logoAttachName varchar(50),
company_punchLine varchar(100),
address varchar(100), 
about_us varchar(10000) not null,
fax_number varchar(20),
infrastructure varchar(10000),
achievments_desc text(10000),
projects_desc text(10000)
)engine = innodb

go

create table sscorp_queryDetails_t(
query_id int auto_increment primary key,
query varchar(3000) not null,
query_subject varchar(100),
query_date datetime not null,
hear_about_us varchar(1000),
company_id int,
customer_id int,
constraint customerDetails_fk foreign key(customer_id)
references sscorp_customerDetails_t (customer_id)
on delete set null,
constraint queryDetails_company_fk foreign key (company_id)
references sscorp_companyProfile_m (company_id)
on delete set null
)engine=innodb

go

create table sscorp_menu_m
(menu_id int auto_increment primary key,
menu_name varchar(50) not null,
menu_position int(5) not null,
menu_url varchar(100),
company_id int, 
constraint menu_m_fk1 foreign key (company_id) 
references sscorp_companyProfile_m (company_id) 
on delete cascade on update cascade
)engine=innodb;

go

create table sscorp_products_category_m(
product_cat_id int auto_increment primary key,
product_cat_name varchar(200) not null,
prod_cat_photo_attachName varchar(100),
company_id int,
constraint products_cat_companyProfile_fk foreign Key (company_id)
references sscorp_companyProfile_m (company_id)
on delete set null on update cascade
)engine=innodb

go

create table sscorp_products_m(
product_id int auto_increment primary key,
product_name varchar(100) not null
)engine=innodb

go

create table sscorp_products_m(
product_id int auto_increment primary key,
product_name varchar(100) not null,
product_size varchar(50) not null,
product_material varchar(100) not null,
product_finish varchar(100) not null,
product_photo_attachName varchar(100),
product_cat_id int,
constraint productCatId_product_category_fk foreign key (product_cat_id)
references sscorp_products_category_m (product_cat_id)
on delete set null on update cascade
)engine = innodb

go

create table sscorp_product_desc_m(
prod_desc_id int auto_increment primary key,
prod_desc_name varchar(200) not null
)engine=innodb

go

create table sscorp_product_material_m(
prod_mat_id int auto_increment primary key,
prod_material_name varchar(200) not null
)engine=innodb

go

create table sscorp_product_size_m(
prod_size_id int auto_increment primary key,
prod_size varchar(200) not null
)engine=innodb

go

create table sscorp_product_detail_t(
prod_det_id int auto_increment primary key,
prod_photo_attachName varchar(100),
product_cat_id int,
product_id int,
prod_desc_id int,
prod_mat_id int,
prod_size_id int,

constraint productCatId_prod_detail_fk foreign key (product_cat_id)
references sscorp_products_category_m (product_cat_id)
on delete set null on update cascade,

constraint productId_prod_fk foreign key (product_id)
references sscorp_products_m (product_id)
on delete set null on update cascade,

constraint productDescId_prod_desc_fk foreign key (prod_desc_id)
references sscorp_product_desc_m (prod_desc_id)
on delete set null on update cascade,

constraint productMatId_prod_material_fk foreign key (prod_mat_id)
references sscorp_product_material_m (prod_mat_id)
on delete set null on update cascade,

constraint productSizeId_prod_size_fk foreign key (prod_size_id)
references sscorp_product_size_m (prod_size_id)
on delete set null on update cascade
)engine=innodb

go

drop table sscorp_products_m
alter table sscorp_products_m drop foreign key products_companyProfile_fk

alter table sscorp_products_m drop column company_id

alter table sscorp_products_m add column product_cat_id int

alter table sscorp_products_m add constraint productCatId_product_category_fk 
foreign key (product_cat_id)
references sscorp_products_category_m (product_cat_id)
on delete set null on update cascade



create table sscorp_achievments_m(
achievment_id int auto_increment primary key,
achievement_name varchar(100) not null,
super_desc varchar(10000),
achievment_desc varchar(10000) not null,
company_id int,
constraint achievments_fk foreign key (company_id)
references sscorp_companyProfile_m (company_id)
on delete cascade on update cascade
)engine=innodb

go 

create table sscorp_address_m(
address_id int auto_increment primary key,
address varchar(200) not null,
city varchar(50),
province varchar(50),
country varchar(50),
zipcode varchar(20),
company_id int,
constraint address_m_fk foreign key (company_id)
references sscorp_companyProfile_m (company_id)
on delete cascade on update cascade
)engine=innodb

go 

alter table sscorp_companyProfile_m drop column address

go 

create table sscorp_phone_numbers_m(
phone_id int auto_increment primary key,
phone_owner varchar(100) not null,
country_code varchar(10),
std_code varchar(10),
phone_number varchar(20) not null,
company_id int,
constraint phone_number_fk foreign key (company_id)
references sscorp_companyProfile_m (company_id)
on delete cascade on update cascade
)engine=innodb

go

alter table sscorp_companyProfile_m add column fax_number varchar(20)

go

alter table sscorp_companyProfile_m add column infrastructure varchar(10000)

go

alter table sscorp_companyProfile_m add column achievments_desc text(10000)

go

alter  table sscorp_companyProfile_m add column projects_desc text(10000)

go

create table sscorp_project_category_m(
project_cat_id int auto_increment primary key,
project_category varchar(200) not null,
company_id int,
constraint project_cat_fk foreign key (company_id)
references sscorp_companyProfile_m (company_id)
on delete cascade on update cascade
)engine=innodb

go

create table sscorp_projects_m(
project_id int auto_increment primary key,
project_name varchar(200) not null,
project_desc varchar(10000),
project_cat_id int,
constraint project_fk foreign key (project_cat_id)
references sscorp_project_category_m (project_cat_id)
on delete cascade on update cascade
)engine=innodb

go

