use MyData;

set foreign_key_checks = 0;
truncate table student;

insert into student(id, id_name1, id_name2, id_name3,id_personal)
select
(@index := @index + 1) as id,
(rand() * (fname_max - 1) + 1),
(rand() * (lname_max - 1) + 1),
(rand() * (mname_max - 1) + 1),
(rand() * 999999 + 1)
from
name as t1,
name as t2,
(select @index := 0) as t_index,
(select max(id) as fname_max from name) as t_fname,
(select max(id) as lname_max from patronymic) as t_lname,
(select max(id) as mname_max from surname) as t_mname
limit 1000000;

set foreign_key_checks = 1;