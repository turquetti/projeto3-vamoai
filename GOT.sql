--Chave primária dos personagens
alter table characters_v4_csv 
add id_characters serial not null;

ALTER TABLE characters_v4_csv
ADD CONSTRAINT id_characters PRIMARY KEY (id_characters);

--Chave primária das casas
alter table houses_v1_csv 
add id_house serial not null;

ALTER TABLE houses_v1_csv 
ADD CONSTRAINT id_house PRIMARY KEY (id_house);

--Chave primária dos episódios
alter table got_episodes_v4_csv 
add id_episode serial not null;

ALTER TABLE got_episodes_v4_csv 
ADD CONSTRAINT id_episode PRIMARY KEY (id_episode);

--Renomeia a coluna do nome dos personagens
ALTER TABLE characters_v4_csv
RENAME column "Character" TO characters_name;

--Muda os nomes das tabelas
alter table characters_v4_csv 
rename to characters1

alter table got_episodes_v4_csv 
rename to episodes

alter table houses_v1_csv 
rename to houses



--Média da nota por temporada 
select e.season, round(avg(e.rating)::decimal, 2) "Notas médias" from got_episodes_v4_csv e
group by e.season
order by "Notas médias" desc 
;

--Qual temporada tem melhor nota
select e.season, round(avg(e.rating)::decimal, 2) "Notas médias" from got_episodes_v4_csv e
group by e.season
order by "Notas médias" desc
limit 1
;

--Personagem que mais apareceu
select c.characters_name, (c.last_appearance-c.first_appearance) Anos from characters_v4_csv c
order by Anos desc
;

--Casas por região
select h.region, count(h.region) as "Quantidade de casas por região" from houses_v1_csv h 
group by h.region 
order by "Quantidade de casas por região" desc 
;



