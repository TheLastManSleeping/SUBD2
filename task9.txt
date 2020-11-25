use MyData;

set foreign_key_checks = 0;
truncate table personal;

insert into personal(id, id_addr1, id_addr2, id_addr3, id_department,
id_email, id_faculty, id_sex, id_lname1, id_lname2, id_lname3, id_post, id_place,
id_speciality, id_university, date1,
mob_num, date3, date4,
series, password, identity, date2, course, group, form)
select
(@index := @index + 1) as id,
(rand() * (addr_max - 1) + 1),
(rand() * (addr_max - 1) + 1),
(rand() * (addr_max - 1) + 1),
(rand() * (department_max - 1) + 1),
(rand() * (email_max - 1) + 1),
(rand() * (faculty_max - 1) + 1),
(rand() * (sex_max - 1) + 1),
(rand() * (lname1_max - 1) + 1),
(rand() * (lname2_max - 1) + 1),
(rand() * (lname3_max - 1) + 1),
(rand() * (post_max - 1) + 1),
(rand() * (place_max - 1) + 1),
(rand() * (speciality_max - 1) + 1),
(rand() * (university_max - 1) + 1),
'2000-01-01' + interval rand() * 11000 day,
rand() * 9999998 + 1,
'2000-01-01' + interval rand() * 11000 day,
'2000-01-01' + interval rand() * 11000 day,
substring(MD5(rand()), 1, 2),
rand() * 999998 + 1,
substring(MD5(rand()), 1, 14),
'2000-01-01' + interval rand() * 11000 day,
rand() * 5 + 1,
substring(MD5(rand()), 1,10),
rand() * 5 + 1
from
name as t1,
name as t2,
(select @index := 0) as t_index,
(select max(id) as addr_max from adress) as t_addr,
(select max(id) as department_max from department) as t_department,
(select max(id) as email_max from email) as t_email,
(select max(id) as faculty_max from faculty) as t_faculty,
(select max(id) as sex_max from sex) as t_sex,
(select max(id) as lname1_max from lname) as t_lname1,
(select max(id) as lname2_max from lsurname) as t_lname2,
(select max(id) as lname3_max from lpatronymic) as t_lname3,
(select max(id) as post_max from post) as t_post,
(select max(id) as place_max from place) as t_place,
(select max(id) as speciality_max from speciality) as t_speciality,
(select max(id) as university_max from university) as t_university
limit 1000000;

set foreign_key_checks = 1;