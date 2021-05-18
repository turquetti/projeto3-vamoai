--Média por temporada 
select epi.season, round(avg(epi.rating)::decimal, 2) "Notas médias" from got_episodes_v4_csv epi
group by epi.season
order by "Notas médias" desc ;

--Qual temporada tem melhor nota
select epi.season, round(avg(epi.rating)::decimal, 2) "Notas médias" from got_episodes_v4_csv epi
group by epi.season
order by "Notas médias" desc
limit 1
;
