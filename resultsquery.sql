select 
h.country,
h.happiness_score,
sum(s.suicides_no) AS suicides,
sum(s.population) AS population,
sum(s.suicides_no)/sum(s.population) AS Suicide_rate,
CASE
WHEN h.happiness_score< sum(s.suicides_no)/sum(s.population) Then 'unhappy_people'
ELSE 'happy_people'
END AS Are_they_happy
from happy_country AS h
left join suicide2016 AS s on h.country=s.country
where s.country=h.country
group by 
h.country,
h.happiness_score


