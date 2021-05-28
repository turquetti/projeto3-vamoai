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

create table duration_character (
temp_1 int,
temp_2 int,
temp_3 int,
temp_4 int,
temp_5 int,
temp_6 int,
temp_7 int,
temp_8 int,
);

create table characters3 (
character_name varchar(255),
character_link varchar(255),
actor_name varchar(255),
actor_link varchar(255),
house_name varchar(255),
royal boolean,
parents0 varchar(255),
parents1 varchar(255),
siblings0 varchar(255),
siblings1 varchar(255),
killed_by varchar(255),
character_image varchar(255),
character_image_full varchar(255),
nickname varchar(255),
killed0 varchar(255),
killed1 varchar(255),
served_by1 varchar(255),
served_by2 varchar(255),
parent_of1 varchar(255),
parent_of2 varchar(255),
parent_of3 varchar(255),
married_engaged varchar(255),
serves varchar(255),
kings_guard boolean,
killed_by2 varchar(255),
siblings3 varchar(255),
siblings4 varchar(255),
killed3 varchar(255),
killed4 varchar(255),
killed5 varchar(255),
killed6 varchar(255),
killed7 varchar(255),
killed8 varchar(255),
killed9 varchar(255),
killed10 varchar(255),
killed11 varchar(255),
killed12 varchar(255),
killed13 varchar(255),
guarded_by varchar(255),
actor_name0 varchar(255),
actor_link0 varchar(255),
season_active0 int,
actor_name1 varchar(255),
actor_link2 varchar(255),
season_active1 int,
season_active2 int,
season_active3 int,
season_active4 int,
serves1 varchar(255),
serves2 varchar(255),
serves3 varchar(255),
house_name1 varchar(255),
parent_of4 varchar(255),
parent_of5 varchar(255),
married_engaged1 varchar(255),
season_active5 int,
season_active6 int,
killed14 varchar(255),
killed15 varchar(255),
served_by3 varchar(255),
served_by4 varchar(255),
served_by5 varchar(255),
served_by6 varchar(255),
guarded_by1 varchar(255),
guarded_by2 varchar(255),
guardian_of0 varchar(255),
allies0 varchar(255),
allies1 varchar(255),
siblings5 varchar(255),
killed_by3 varchar(255),
actor_name2 varchar(255),
actor_link3 varchar(255),
season_active8 int,
season_active9 int,
season_active10 int,
season_active11 int,
season_active12 int,
guardian_of1 varchar(255),
guardian_of2 varchar(255),
parents2 varchar(255),
killed_by4 varchar(255),
abducted_by0 varchar(255),
married_engaged2 varchar(255),
abducted varchar(255),
siblings6 varchar(255),
siblings7 varchar(255),
allies2 varchar(255)
);

-- chaves primarias e estrangeiras
alter table characters_v4_csv add primary key (id_character);

alter table duration_character_csv add constraint fk foreign key (id_character) references characters_v4_csv(id_character);

-- carga de dados no banco via bash
-- carga: personagens
\copy characters_got from '/home/characters_v4.csv' with delimiter ',' csv header;

-- carga: episodios
\copy episodes_got from '/home/GOT_episodes_v4.csv' with delimiter ',' csv header;

-- carga: casas
\copy houses_got from '/home/houses_v1.csv' with delimiter ',' csv header;


-- alterando tabelas
alter table budget from episodes_got

