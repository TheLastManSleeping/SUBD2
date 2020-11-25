use MyData;

set foreign_key_checks = 0;
truncate table email;
truncate table sex;
truncate table lname;
truncate table lsurname;
truncate table lpatronymic;
truncate table place;
truncate table speciality;
truncate table post;

insert into email(id)
select
(@index := @index + 1) as id
from
name as t1,
name as t2,
(select @index := 0) as t_index
limit 1000000;

insert into sex(id, short_sex, sex) values (1, 'муж', 'мужской'), (2,
'жен', 'женский');

insert into lname(id)
select
(@index := @index + 1) as id
from
name as t1,
name as t2,
(select @index := 0) as t_index
limit 1000000;

insert into lsurname(id)
select
(@index := @index + 1) as id
from
name as t1,
name as t2,
(select @index := 0) as t_index
limit 1000000;

insert into lpatronymic(id)
select
(@index := @index + 1) as id
from
name as t1,
name as t2,
(select @index := 0) as t_index
limit 1000000;

insert into place(id)
select
(@index := @index + 1) as id
from
name as t1,
name as t2,
(select @index := 0) as t_index
limit 100;

insert into post(id) 
select
(@index := @index + 1) as id
from
name as t1,
name as t2,
(select @index := 0) as t_index
limit 50;

insert into speciality(id)
select
(@index := @index + 1) as id
from
name as t1,
name as t2,
(select @index := 0) as t_index
limit 500;

set foreign_key_checks = 1;
