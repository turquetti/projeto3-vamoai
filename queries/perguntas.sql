----------------------------------------------ANALISE GERAL DA SERIE--------------------------------------------------------

-- Episodios por temporada
select season, count(season) as total 
from episodes_got
group by season
order by season;

-- Total de episodios
select count(episode) as total
from episodes_got;

-- Duracao da serie em minutos
select sum(duration) from episodes_got;

select sum(
			make_time(
				duration / 60,
				duration % 60,
				(duration * 60) % 60
			)
		);

----------------------------------------------ANALISE DE DESEMPENHO DA SERIE--------------------------------------------------------

------------------------Audiência
select 
	season, 
	round(avg(e.us_viewers)::numeric, 2) "Audiência média" 
from episodes_got e
group by e.season
order by "Audiência média" desc;

------------------------ Por temporada
--Media da nota por temporada 
select e.season, round(avg(e.rating)::decimal, 2) "Notas medias" from episodes e 
group by e.season
order by "Notas medias" desc;

--Qual temporada tem melhor nota
select e.season, round(avg(e.rating)::decimal, 2) "Notas medias" from episodes e 
group by e.season
order by "Notas medias" desc
limit 1;

------------------------ Por diretores
--Relacao em nota do episodio vs diretor
select director, round(avg(rating)::numeric, 2) 
from got_episodes_v4_csv gevc2 
group by director 
order by avg(rating) desc;

--Numero de episodios dos 3 diretores com melhor media
select e.director Diretor, e.season Temporada, count(e.episode) "No de episodios" from got_episodes_v4_csv e
where e.director ilike 'Neil Marshall' or e.director ilike 'Alex Graves' or e.director ilike 'Matt Shakman'
group by  e.director, e.season
order by e.director;

----------------------------------------------UNIVERSO DE WESTEROS--------------------------------------------------------
--Distribuicao por genero
select 	gender, 
		round((count(gender)*100)/831::numeric, 2) Gênero
from (select gender from characters_v4_csv c where gender != '') Gênero
group by gender
order by Gênero desc;

--Casas por regiao
select h.region, count(h.region) as "Quantidade de casas por regiao" from houses_v1_csv
group by h.region 
order by "Quantidade de casas por regiao" desc 
limit 9;

--Personagens por casas
select 	c.name_by_house House, 
		count(c.name_by_house) Members
from (select 	
			c.name_by_house 
			from characters_v4_csv c 
			where 
				name_by_house is not null and 
				name_by_house != 'Wildling' and
				name_by_house  != '"White Walkers"' and
				name_by_house  != 'Nights Watch'
			) c
group by c.name_by_house 
order by Members desc
limit 10;

--Valor relativo de casas por regiao
select h.region, round((count(h.region)*100)/471::numeric, 2) as "Valor relativo de casas por regiao" from houses_v1_csv
group by h.region 
order by "Valor relativo de casas por regiao" desc 
limit 9;

----------------------------------------------PERSONAGENS--------------------------------------------------------
--Personagem que mais apareceu
select c.characters_name, (c.last_appearance-c.first_appearance) Anos from characters1 c 
order by Anos desc;

-- relação entre personagem e tempo de tela
select 	c.character_name , 
		temp_1 + temp_2 + temp_3 + temp_4 + temp_5 + temp_6 + temp_7 + temp_8 as Total
from duration_character d
join characters_v4_csv c on d.id_character = c.id_character 
order by Total desc
limit 10;

-- relação entre tempo de tela e aparição nos episodios
select 	c.character_name, c.episodes_appeared, temp_1 + temp_2 + temp_3 + temp_4 + temp_5 + temp_6 + temp_7 + temp_8 as Total
from duration_character d
join characters_v4_csv c on d.id_character = c.id_character 
order by c.episodes_appeared desc
limit 10;

-- maiores assassinos
select cc."characters/characterName",
		(select 
			sum(case when Mortes != '' then 1 else 0 end) 
			from unnest(array[
					cc."characters/killed/0", 
					cc."characters/killed/1",
					cc."characters/killed/2",
					cc."characters/killed/3",
					cc."characters/killed/4",
					cc."characters/killed/5",
					cc."characters/killed/6",
					cc."characters/killed/7",
					cc."characters/killed/8",
					cc."characters/killed/9",
					cc."characters/killed/10",
					cc."characters/killed/11",
					cc."characters/killed/12",
					cc."characters/killed/13",
					cc."characters/killed/14",
					cc."characters/killed/15"]) Mortes) Mortes
from characters3_csv cc
order by Mortes desc, cc."characters/characterName" 
limit 10;
