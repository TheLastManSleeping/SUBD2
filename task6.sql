use MyData;

set foreign_key_checks = 0;
truncate table faculty;
set foreign_key_checks = 1;

drop temporary table if exists buffer_table;
create temporary table buffer_table (
id smallint unsigned primary key auto_increment,
name varchar(50),
short char(10));

insert into buffer_table(short, name) values ('ФКП','Факультет компьютерного проектирования'),('ФИТУ','Факультет информационных технологий и управления'),('ФРЭ','Факультет радиотехники и электроники'),('ФКСИС','Факультет компьютерных систем и сетей'),('ФИ','Факультет инфокоммуникаций'),('ИЭФ','Инженерно-экономический факультет'),('ВФ','Военный факультет'),('ФДПиПО','Факультет доуниверситетской подготовки и профессиональной ориентации'),('ИИТ','Институт информационных технологий');

insert into faculty(id, faculty, faculty_short)
select * from buffer_table;

drop temporary table buffer_table;
