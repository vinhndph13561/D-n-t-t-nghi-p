use DATN
go
create table users
(
	id bigint identity(1,1) not null,
	first_name nvarchar(50) not null,
	last_name nvarchar(50) not null,
	username nvarchar(255) not null,
	password nvarchar(250) not null,
	email nvarchar(255) not null,
	avartar nvarchar(255),
	gender bit not null,
	phone_number nvarchar(12) not null,
	status bit,
	primary key(id)
)
go
create table suppliers
(
	id bigint identity(1,1) not null,
	supplier_name nvarchar(255) not null,
	address nvarchar(255) not null,
	phone_number nvarchar(12) not null,
	 primary key(id)
)
go
create table roles
(
	id bigint identity(1,1) not null,
	role_name nvarchar(11) not null,
	primary key (id)
)
go 
create table discounts
(
	id bigint identity(1,1) not null,
	condition int,
	decrease_percent int not null,
	discount_name nvarchar(255) not null,
	start_day date,
	end_day date,
	primary key (id)
)
go
create table categories
(
	id bigint identity(1,1) not null,
	category_name nvarchar(255) not null,
	note nvarchar(255) not null,
	primary key (id)
)
go
create table messages
(
	id int identity(1,1),
	sender_id bigint not null,
	receiver_id bigint not null,
	message nvarchar(255) not null,
	create_time datetime,
	primary key (id),
	foreign key (sender_id) references users(id),
	foreign key (receiver_id) references users(id)
)
create table user_details
(
	id bigint identity(1,1) not null,
	provine_city nvarchar(255) not null,
	district nvarchar(255) not null,
	ward nvarchar(255) not null,
	address nvarchar(255) not null,
	total_spending float,
	tb_coin float,
	payment_account nvarchar(255) not null,
	primary key (id),
	foreign key (id) references users(id)
)
go
create table user_roles
(
	id bigint identity(1,1) not null,
	user_id bigint not null,
	role_id bigint not null,
	primary key (id),
	foreign key (user_id) references users(id),
	foreign key (role_id) references roles(id)
)
go
create table products
(
	id bigint identity(1,1) not null,
	category_id bigint not null,
	product_name nvarchar(255) not null,
	thumnail nvarchar(255) not null,
	unit_price float not null,
	quantity int not null,
	description nvarchar(255) not null,
	primary key(id),
	foreign key (category_id) references categories(id)
)
go
create table bills
(
	id bigint identity(1,1) not null,
	customer_id bigint not null,
	staff_id bigint,
	create_day datetime,
	total float,
	note nvarchar(255) not null,
	primary key(id),
	foreign key(customer_id) references users(id),
	foreign key(staff_id) references users(id)
)
go
create table deliveries
(
	id bigint identity(1,1) not null,
	bill_id bigint not null,
	shipper_name nvarchar(255) not null,
	company nvarchar(255),
	ship_fee float not null,
	create_time datetime,
	status int,
	end_time datetime,
	primary key(id),
	foreign key (bill_id) references bills(id)

)
go
create table bill_details
(
	id bigint identity(1,1) not null,
	bill_id bigint not null,
	product_id bigint not null,
	quantity int not null,
	unit_price float not null,
	total float not null,
	primary key (id),
	foreign key (bill_id) references bills(id),
	foreign key (product_id) references products(id)
)
go
create table comments
(
	id bigint identity(1,1) not null,
	product_id bigint not null,
	user_id bigint not null,
	content nvarchar(255) not null,
	create_time datetime,
	primary key (id),
	foreign key (product_id) references products(id),
	foreign key(user_id) references users(id)
)
go
create table importations
(
	id bigint identity(1,1) not null,
	supplier_id bigint not null,
	staff_id bigint not null,
	create_day datetime,
	total float,
	primary key(id),
	foreign key (supplier_id) references suppliers(id),
	foreign key (staff_id) references users(id)
)
go
create table importation_details
(
	id bigint identity(1,1) not null,
	importation_id bigint not null,
	product_id bigint not null,
	quantity int not null,
	unit_price float not null,
	total float not null,
	primary key (id),
	foreign key(importation_id) references importations(id)
)
go