use MyData;
set foreign_key_checks = 0;
truncate table ctype;
truncate table districts;
truncate table adress;

insert into districts(id)
select
(@index := @index + 1) as id
from
name as t1,
name as t2,
(select @index := 0) as t_index
limit 1000000;

insert into ctype(id)
select
(@index := @index + 1) as id
from
name as t1,
name as t2,
(select @index := 0) as t_index
limit 100;

insert into adress(id, id_country, id_area, id_city, id_street, id_stype, id_ctype, id_district, house, corps, flat, index, number)
select
(@index := @index + 1) as id,
(rand() * (country_max - 1) + 1),
(rand() * (area_max - 1) + 1),
(rand() * (locality_max - 1) + 1),
(rand() * (street_max - 1) + 1),
(rand() * (street_type_max - 1) + 1),
(rand() * (ctype_max - 1) + 1),
(rand() * (district_max - 1) + 1),
rand() * 300 +1,
rand() * 30 + 1,
rand() * 300 + 1,
rand() * 200000 + 1,
rand() * 9999998 + 1
from
areas as t1,
areas as t2,
(select @index := 0) as t_index,
(select max(id) as country_max from countries) as t_country,
(select max(id) as area_max from areas) as t_area,
(select max(id) as locality_max from city) as t_locality,
(select max(id) as street_max from streets) as t_street,
(select max(id) as street_type_max from stype) as t_street_type,
(select max(id) as ctype_max from ctype) as t_type,
(select max(id) as district_max from districts) as t_district
limit 10000;

set foreign_key_checks = 1;
