create table users (
    id                      bigserial primary key,
    username                varchar(30) not null unique,
    password                varchar(80) not null,
    email                   varchar(50) unique,
    created_at              timestamp default current_timestamp,
    updated_at              timestamp default current_timestamp
);

create table roles (
    id                      bigserial primary key,
    name                    varchar(50) not null unique,
    created_at              timestamp default current_timestamp,
    updated_at              timestamp default current_timestamp
);

CREATE TABLE users_roles (
    user_id                 bigint not null references users (id),
    role_id                 bigint not null references roles (id),
    primary key (user_id, role_id)
);

insert into roles (name)
values
('ROLE_USER'),
('ROLE_ADMIN');

insert into users (username, password, email)
values
('bob', '$2a$04$Fx/SX9.BAvtPlMyIIqqFx.hLY2Xp8nnhpzvEEVINvVpwIPbA3v/.i', 'bob_johnson@gmail.com'),
('john', '$2a$04$Fx/SX9.BAvtPlMyIIqqFx.hLY2Xp8nnhpzvEEVINvVpwIPbA3v/.i', 'john_johnson@gmail.com');

insert into users_roles (user_id, role_id)
values
(1, 1),
(2, 2);

create table products (
    id                      bigserial primary key,
    title                   varchar(255),
    price                   int,
    created_at              timestamp default current_timestamp,
    updated_at              timestamp default current_timestamp
);

insert into products (title, price)
values
('american bobtail cat', 10000),
('bengal cat', 20000),
('sphynx cat', 15000),
('norwegian forest cat', 50000),
('pixie-bob cat', 30000),
('maine coon cat', 30000),
('snowshoe cat', 30000),
('persian cat', 30000),
('donskoy cat', 30000),
('savannah cat', 500000),
('bombay cat', 14300),
('european shorthair cat', 29000),
('york chocolate cat', 44000),
('korat cat', 50000),
('pixie-bob cat', 55000),
('napoleon cat', 30500),
('nebelung cat', 30001),
('sokoke cat', 30003),
('chartreux cat', 40004),
('birman cat', 50000);

create table orders (
    id                      bigserial primary key,
    owner_id                bigint references users (id),
    price                   int,
    address                 varchar(255),
    created_at              timestamp default current_timestamp,
    updated_at              timestamp default current_timestamp
);

create table order_items (
    id                      bigserial primary key,
    order_id                bigint references orders (id),
    product_id              bigint references products (id),
    title                   varchar(255),
    quantity                int,
    price_per_product       int,
    price                   int,
    created_at              timestamp default current_timestamp,
    updated_at              timestamp default current_timestamp
);

create table carts (
    id                      UUID primary key,
    owner_id                bigint references users (id),
    price                   int
);

create table cart_items (
    id                bigserial primary key,
    cart_id           UUID references carts (id),
    product_id        bigint references products (id),
    title             varchar(255),
    quantity          int,
    price_per_product int,
    price             int,
    created_at        timestamp default current_timestamp,
    updated_at        timestamp default current_timestamp
);