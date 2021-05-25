--M�dia da nota por temporada 
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

--Casas por regi�o
select h.region, count(h.region) as "Quantidade de casas por regiao" from houses h 
group by h.region 
order by "Quantidade de casas por regiao" desc 
;

--Relação em nota do episódio versus diretor
select director, round(avg(rating)::numeric, 2) 
from got_episodes_v4_csv gevc2 
group by director 
order by avg(rating) desc
;