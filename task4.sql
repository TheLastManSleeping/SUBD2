use MyData;

set foreign_key_checks = 0;
truncate table gtype;
truncate table control;
truncate table subject;
truncate table teacher;
truncate table result;

insert into gtype(id, gtype) values
(1, '1'), (2, '2'), (3, '3'), (4, '4'), (5, '5'), (6, '6'), (7, '7'), (8, '8'), (9, '9'), (10, '10'), (11,
'зачёт'), (12, 'незачёт'), (13,'неявка');

insert into control(id, control) values
(1, 'зачёт'), (2, 'экзамен');

insert into subject(id)
select
(@index := @index + 1) as id
FROM
name,
(select @index := 0) as t_index
limit 1000;

insert into teacher(id, id_name1, id_name2, id_name3)
select(@index := @index + 1) as id,
(rand() * (fname_max - 1) + 1),
(rand() * (lname_max - 1) + 1),
(rand() * (mname_max - 1) + 1)
FROM
name,
(select @index := 0) as t_index,
(select max(id) as fname_max from name) as t_fname,
(select max(id) as lname_max from surname) as t_lname,
(select max(id) as mname_max from patronymic) as t_mname
limit 10000;

insert into result(id, id_control, id_gtype, id_student, id_subject,
id_teacher, date5)
select
(@index := @index + 1) as id,
(rand() * (control_form_max - 1) + 1),
(rand() * (grade_max - 1) + 1),
(rand() * (student_max - 1) + 1),
(rand() * (subject_max - 1) + 1),
(rand() * (teacher_max - 1) + 1),
'2000-01-01' + interval rand() * 11000 day
from
teacher as t1,
teacher as t2,
(select @index := 0) as t_index,
(select max(id) as control_form_max from control) as t_control,
(select max(id) as grade_max from gtype) as t_grade,
(select max(id) as student_max from student) as t_student,
(select max(id) as subject_max from subject) as t_subject,
(select max(id) as teacher_max from teacher) as t_teacher
limit 1000000;

set foreign_key_checks = 1;