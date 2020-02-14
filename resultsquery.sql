select 
h.country,
h.happiness_score,
sum(s.suicides_no) AS suicides,
sum(s.population) AS population,
cast(sum(s.suicides_no)*100.0/sum(s.population) as numeric(10,2)) AS Suicide_rate,
CASE
WHEN h.happiness_score> h.health Then 'Happiness_score_is_fake_news'
ELSE 'Happiness_score_is_real'
END AS Are_they_happy
from happy_country AS h
left join suicide2016 AS s on h.country=s.country
where s.country=h.country
group by 
h.country,
h.happiness_score,
h.health


