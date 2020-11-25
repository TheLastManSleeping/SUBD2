﻿use MyData;

set foreign_key_checks = 0;
truncate table gtype;
truncate table control;
truncate table subject;
truncate table teacher;
truncate table result;

insert into gtype(id, gtype) values
use MyData;

set foreign_key_checks = 0;
truncate table department;
set foreign_key_checks = 1;

drop temporary table if exists buffer_table;
create temporary table buffer_table (
id smallint unsigned primary key auto_increment,
name varchar(100));

insert into buffer_table(name) values ('Высшей математики'),('Вычислительных методов и программирования'),('Гуманитарных дисциплин'),('Защиты информации'),('Инженерной и компьютерной графики'),('Инженерной психологии и эргономики'),('Иностранных языков N1'),('Иностранных языков N2'),('Интеллектуальных информационных технологий'),('Инфокоммуникационных технологий'),('Информатики'),('Информационных радиотехнологий'),('Информационных технологий автоматизированных систем'),('Менеджмента'),('Микро- и наноэлектроники'),('Общеобразовательных дисциплин'),('Программного обеспечения информационных технологий'),('Проектирования информационно-компьютерных систем'),('Систем управления'),('Теоретических основ электротехники'),('Физвоспитания'),('Физики'),('Философии'),('Экономики'),('Экономической информатики'),('Электроники'),('Электронной техники и технологии'),('Электронных вычислительных машин'),('Электронных вычислительных средств'),('Радиоэлектронной техники ВВС и войск ПВО'),('Связи'),('Тактической и общевоенной подготовки');

insert into department(id, department)
select * from buffer_table;

drop temporary table buffer_table;