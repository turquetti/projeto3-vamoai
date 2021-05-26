-- criação tabelas
create table characters_got (
characters_name varchar(255),
actor_name varchar(255) not null,
episodes_appeared int not null,
first_appearance int not null,
last_appearance int not null
);

create table episodes_got (
season int not null,
episode int not null,
title varchar(255) not null,
release_date date not null,
rating numeric not null,
votes int not null,
summary varchar not null, 
writer_1 varchar(255) not null,
writer_2 varchar(255) not null,
star_1 varchar(255) not null,
star_2 varchar(255) not null,
star_3 varchar(255) not null,
users_reviews int not null,
critics_reviews int not null,
us_viewers numeric not null,
duration int not null,
director varchar(255) not null,
budget numeric
);

create table houses_got (
house_name varchar(255) not null,
region varchar(255) not null
);

-- create table caracters2_got (
-- characters_name varchar(255),
-- actor_name varchar(255),
-- house_name varchar(255),
-- killed_by varchar(255),
-- killed varchar(255)
-- );

-- carga de dados no banco via bash
-- carga: personagens
\copy characters_got from '/home/characters_v4.csv' with delimiter ',' csv header;

-- carga: episodios
\copy episodes_got from '/home/GOT_episodes_v4.csv' with delimiter ',' csv header;

-- carga: casas
\copy houses_got from '/home/houses_v1.csv' with delimiter ',' csv header;


-- alterando tabelas
alter table budget from episodes_got

