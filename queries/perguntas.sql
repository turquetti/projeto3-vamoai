----------------------------------------------ANÃ�LISE GERAL DA SÃ‰RIE--------------------------------------------------------

-- EpisÃ³dios por temporada
select season, count(season) as total 
from episodes_got
group by season
order by season
;

-- Total de episÃ³dios
select count(episode) as total
from episodes_got
;

-- DuraÃ§Ã£o da sÃ©rie em minutos
select sum(duration) from episodes_got
;

----------------------------------------------ANÃ�LISE DE DESEMPENHO DA SÃ‰RIE--------------------------------------------------------

------------------------Audiência
select 
	season, 
	round(avg(e.us_viewers)::numeric, 2) "Audiência média" 
from episodes_got e
group by e.season
order by "Audiência média" desc
;

------------------------ Por temporada
--Media da nota por temporada 
select e.season, round(avg(e.rating)::decimal, 2) "Notas medias" from episodes e 
group by e.season
order by "Notas medias" desc 
;

--Qual temporada tem melhor nota
select e.season, round(avg(e.rating)::decimal, 2) "Notas medias" from episodes e 
group by e.season
order by "Notas medias" desc
limit 1
;

------------------------ Por diretores
--RelaÃ§Ã£o em nota do episÃ³dio versus diretor
select director, round(avg(rating)::numeric, 2) 
from got_episodes_v4_csv gevc2 
group by director 
order by avg(rating) desc
;

--Numero de episodios dos 3 diretores com melhor media
select e.director Diretor, e.season Temporada, count(e.episode) "Nï¿½ de episï¿½dios" from got_episodes_v4_csv e
where e.director ilike 'Neil Marshall' or e.director ilike 'Alex Graves' or e.director ilike 'Matt Shakman'
group by  e.director, e.season
order by e.director 
;

----------------------------------------------UNIVERSO DE WESTEROS--------------------------------------------------------
--Distribuição por gênero
select 	gender, 
		round((count(gender)*100)/831::numeric, 2) Gênero
from (select gender from characters_v4_csv c where gender != '') Gênero
group by gender
order by Gênero desc
;

--Casas por regiï¿½o
select h.region, count(h.region) as "Quantidade de casas por regiao" from houses_v1_csv
group by h.region 
order by "Quantidade de casas por regiao" desc 
LIMIT 9
;

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
limit 10
;

--Valor relativo de casas por regiï¿½o
select h.region, round((count(h.region)*100)/471::numeric, 2) as "Valor relativo de casas por regiï¿½o" from houses_v1_csv
group by h.region 
order by "Valor relativo de casas por regiï¿½o" desc 
limit 9
;


----------------------------------------------PERSONAGENS--------------------------------------------------------
--Personagem que mais apareceu
select c.characters_name, (c.last_appearance-c.first_appearance) Anos from characters1 c 
order by Anos desc
;

--tempo de tela dos principais personagens
select name, 
	temp_1 + temp_2 + temp_3 + temp_4 + temp_5 + temp_6 + temp_7 + temp_8 as Total
from duration_character
order by Total desc
limit 10

-- relaÃ§Ã£o entre o tempo de tela e a apariÃ§Ã£o dos personagens
