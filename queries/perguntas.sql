--Mï¿½dia da nota por temporada 
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

--Personagem que mais apareceu
select c.characters_name, (c.last_appearance-c.first_appearance) Anos from characters1 c 
order by Anos desc
;

--Casas por regiï¿½o
select h.region, count(h.region) as "Quantidade de casas por regiao" from houses_v1_csv
group by h.region 
order by "Quantidade de casas por regiao" desc 
LIMIT 9
;

--Valor relativo de casas por região
select h.region, round((count(h.region)*100)/471::numeric, 2) as "Valor relativo de casas por região" from houses_v1_csv
group by h.region 
order by "Valor relativo de casas por região" desc 
limit 9
;

--RelaÃ§Ã£o em nota do episÃ³dio versus diretor
select director, round(avg(rating)::numeric, 2) 
from got_episodes_v4_csv gevc2 
group by director 
order by avg(rating) desc
;

--Número de episódios dos 3 diretores com melhor média
select e.director Diretor, e.season Temporada, count(e.episode) "Nº de episódios" from got_episodes_v4_csv e
where e.director ilike 'Neil Marshall' or e.director ilike 'Alex Graves' or e.director ilike 'Matt Shakman'
group by  e.director, e.season
order by e.director ;