USE MyData;

set foreign_key_checks = 0;
drop temporary table if exists buffer_table;

create temporary table buffer_table (
id tinyint unsigned primary key auto_increment,
name varchar(20)
);

insert into buffer_table(id, name)
select id, stype
from stype;

set @street_type_count = (select count(*) from stype);
insert ignore into buffer_table(name)
values ('бульвар'), ('воинская часть'),
('кольцо'), ('набережная'), ('парк'), ('переулок'), ('площадь'), ('проезд'),
('проспект'), ('следственный изолятор'), ('станция'), ('территория'), ('тракт'),
('тупик'), ('улица'), ('шоссе');
truncate table stype;

insert into stype(id, stype)
select * from buffer_table;

drop temporary table buffer_table;

set foreign_key_checks = 1;