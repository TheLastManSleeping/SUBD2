use MyData;
set foreign_key_checks = 0;
truncate table adress;

insert into adress(id, id_country, id_area, id_city, id_street, id_stype)
select
(@index := @index + 1) as id,
(rand() * (country_max - 1) + 1),
(rand() * (area_max - 1) + 1),
(rand() * (locality_max - 1) + 1),
(rand() * (street_max - 1) + 1),
(rand() * (street_type_max - 1) + 1)
from
areas as t1,
areas as t2,
(select @index := 0) as t_index,
(select max(id) as country_max from countries) as t_country,
(select max(id) as area_max from areas) as t_area,
(select max(id) as locality_max from city) as t_locality,
(select max(id) as street_max from streets) as t_street,
(select max(id) as street_type_max from stype) as t_street_type
limit 10000;

set foreign_key_checks = 1;