create database bamazon_db;

use bamazon_db;

create table products(
	item_id integer auto_increment not null,
    product_name varchar(100) not null,
    department_name integer(11),
    price integer(11) not null,
    stock_quantity integer(11),
    primary key (item_id)
);

SELECT * FROM products;

insert into products (product_name, department_name, price, stock_quantity)
	values
		('DOBOT Magician', 1, 100, 30),
        ('Ozobot: 99', 1, 150, 65),
        ('Wonder Workshop: 149', 1, 250, 200),
        ('BB-9E: 99 ', 2, 50, 100),
        ('Marty the Robot', 2, 100, 150),
		('Sphero R2-D2: 179', 2, 80, 45),
        ('Wowee MiP: 99', 2, 50, 100),
		('Buddy by Blue Frog', 3, 700, 40),
        ('Alpha 2', 3, 1300, 30),
        ('The Aeolus Robot', 3, 5000, 5);
        
create table departments(
	department_id integer auto_increment not null,
    department_name varchar(100) not null,
    over_head_costs integer(11) not null,
    product_sales integer(11) default 0,
    primary key (department_id)
);

insert into departments (department_name, over_head_costs)
	values
		('Education', 50000),
        ('Toy', 20000),
		('Smarthome', 25000);
        
alter table products add product_sales integer(11) default 0;

alter table products add foreign key (department_name) references departments (department_id);
        
select * from departments;

select departments.department_id, departments.department_name, departments.over_head_costs, 
sum(products.product_sales) as total_sales
from products 
left join departments on products.department_name = departments.department_id
group by products.department_name;


select products.item_id, products.product_name, departments.department_name, products.price, products.stock_quantity
from products
inner join departments on products.department_name = departments.department_id;