	

/**
create table fakultet (
id_fakultet int not null primary key identity(1,1),
fakultet nvarchar(50) not null
);

create table kafedra (
id_kafedra int not null primary key identity(1,1),
kafedra nvarchar(50) not null,
id_fakultet int  foreign key  references fakultet(id_fakultet) not null
);

create table gruppa (
id_gruppa int not null primary key identity(1,1),
gruppa nvarchar(50) not null,
id_kafedra int  foreign key  references kafedra(id_kafedra) not null
);

create table tip_nas_punkt (
id_tip_nas_punkt int not null primary key identity(1,1),
tip_nas_punkt nvarchar(50) not null
);

create table oblast (
id_oblast int not null primary key identity(1,1),
oblast nvarchar(50) not null
);


create table rayon (
id_rayon int not null primary key identity(1,1),
rayon nvarchar(50) not null,
id_oblast int  foreign key  references oblast(id_oblast) not null
);

create table nas_punkt (
id_nas_punkt int not null primary key identity(1,1),
nas_punkt nvarchar(50) not null,
id_tip_nas_punkt int  foreign key  references tip_nas_punkt(id_tip_nas_punkt) not null,
id_rayon int  foreign key  references rayon(id_rayon) not null
);



create table grajdanstvo (
id_grajdanstvo int not null primary key identity(1,1),
grajdanstvo nvarchar(50) not null,
);

create table natsionalnost (
id_natsionalnost int not null primary key identity(1,1),
natsionalnost nvarchar(50) not null,
);

create table pol (
id_pol int not null primary key identity(1,1),
pol nvarchar(50) not null,
);

create table student (
id_student int not null primary key identity(1,1),
fam nvarchar(50) not null,
imya nvarchar(50) not null,
otch nvarchar(50) not null,
passport nvarchar(12) not null,
pasword nvarchar(50) not null,
red_date date not null,
id_gruppa int foreign key  references gruppa(id_gruppa) not null,
id_nas_punkt int foreign key  references nas_punkt(id_nas_punkt) not null,
id_natsionalnost int foreign key  references natsionalnost(id_natsionalnost) not null,
id_pol int foreign key  references pol(id_pol) not null,
id_grajdanstvo int foreign key  references grajdanstvo(id_grajdanstvo) not null,
comments nvarchar(500) not null,
foto nvarchar(500)
);

create table tip_kont (
id_tip_kont int not null primary key identity(1,1),
tip_kont nvarchar(50) not null
);

create table kontakty (
id_kontakty int not null primary key identity(1,1),
id_student int foreign key references student(id_student) not null,
id_tip_kont int foreign key references tip_kont(id_tip_kont) not null
);


create table sostav (
id_sostav int not null primary key identity(1,1),
sostav nvarchar(50) not null
);

create table zvanie (
id_zvanie int not null primary key identity(1,1),
zvanie nvarchar(50) not null,
id_sostav int foreign key references sostav(id_sostav) not null
);

create table voinsk_slujba (
id_voinskaya_sl int not null primary key identity(1,1),
data_nachala date not null,
data_okonch date not null,
nomer_prikaza nvarchar(50) not null,
comments nvarchar(500) not null,
id_student int foreign key references student(id_student) not null,
id_zvanie int foreign key  references zvanie(id_zvanie) not null,
);

create table tip_pov_kvalif (
id_tip_pov_kvalif int not null primary key identity(1,1),
tip_pov_kvalif nvarchar(50) not null
);

create table pov_kvalif (
id_pov_kvalif int not null primary key identity(1,1),
data_pov date not null,
nomer_doc nvarchar(50) not null,
comments nvarchar(500) not null,
id_tip_pov_kvalif int foreign key  references tip_pov_kvalif(id_tip_pov_kvalif) not null,
id_student int foreign key references student(id_student) not null,
);
**/

/**
CREATE TABLE #TempTable1
    (
      Type INT ,
      ObjName VARCHAR(256) ,
      Owner VARCHAR(25) ,
      Sequence INT
    ); 

INSERT  INTO #TempTable1
        EXEC sp_MSdependencies NULL 

SELECT  *
FROM     #TempTable1
WHERE   Type = 8 --Tables 
ORDER BY Sequence ,
        ObjName 
DROP TABLE #TempTable1;
**/

/*
INSERT fakultet VALUES
('Ленинградское СВУ МВД'),
('Московское СВУ'),
('Московское военно-музыкальное училище'),
('Новочеркасское СВУ'),
('Саратовское СВУ');

INSERT kafedra VALUES
('Кафедра тактики и стратегии',1),
('Кафедра военной географии и военной истории',2),
('Кафедра военной инженерии',3),
('Кафедра военной этики и психологии',4),
('Кафедра истории и культуры',5);
 
INSERT gruppa VALUES
('Ребята по истории',1),
('Математические гении',2),
('Физтех',3),
('Художественные мастера',4),
('Языковые асы',5);

INSERT grajdanstvo VALUES
('гражданин Российской Федерации'),
('гражданство Ватикана'),
('гражданство Кыргызстана'),
('гражданство США'),
('гражданство Дубаи');

INSERT natsionalnost VALUES
('Кыргыз'),
('Русский'),
('Казак'),
('Украинец'),
('Кореец');

INSERT pol VALUES
('М'),
('Ж');

INSERT oblast VALUES
('Чуй'),
('Ош'),
('Баткен'),
('Нурсултан'),
('Москва');

INSERT rayon VALUES
('Первомайский',1),
('Сверловский',2),
('Октябрьский',3),
('Ленинский',4),
('Аламединский',5);

INSERT tip_nas_punkt VALUES
('Городской тип населения'),
('Сельский тип населения'),
('Туристический тип населения'),
('Экономический тип населения'),
('Технологический тип населения');

INSERT nas_punkt VALUES
('Бишкек',1,1),
('Нарын',2,2),
('Ацфц',3,3),
('цфым',4,4),
('цаф',5,5);

INSERT student VALUES
('Картанбаев','Чингиз','Замирович','AB123425', 'qwerty', '2018-02-01', 1, 1, 1 ,1, 1, 'no comments', null),
('Петров','Петр','Петрович','AB123423','123','2018-03-01',2,2,2,1,2, 'again no comments', null),
('Сидоров','Сидор','Сидорович','AB1231245','323','2018-06-01',3,3,3,1,3, 'again no comments', null),
('Краснова','Ирина','Петровна', 'AB14231245','4125','2018-05-01',4,4,4,2,4,'again no comments', null);
	
INSERT sostav VALUES
('Оперативный полк'),
('Войска поддержки'),
('Разведывательные единицы'),
('Единицы управления');

INSERT zvanie VALUES
('Генерал',1),
('Полковник',2),
('Капитан',3),
('Лейтенант',4),
('Сержант',1);

INSERT voinsk_slujba VALUES
('2018-06-01','2019-06-01','AD23123','no comments',4,1),
('2018-03-01', '2019-03-01', 'AD12421', 'again no comments', 5,2),
('2018-06-01', '2019-06-01', 'AV12343', 'hmm', 6,3),
('2018-05-01', '2019-05-01', 'AV12151', 'Yey', 7,4);

INSERT tip_pov_kvalif VALUES
('Beginner'),
('Intermediate'),
('Expert'),
('Specialist');

INSERT pov_kvalif VALUES
('2020-12-12','AV1212','no comments', 1, 4),
('2020-01-01','AV1251','no comments', 2, 5),
('2020-10-10','AV1245','no comments', 3, 6),
('2020-11-25','AV5212','no comments', 4, 7);
*/


/*
SELECT imya, fam
FROM dbo.student
WHERE id_gruppa = (SELECT id_gruppa FROM gruppa WHERE id_kafedra = (SELECT id_kafedra FROM kafedra WHERE id_fakultet = (SELECT id_fakultet FROM fakultet WHERE fakultet = 'Ленинградское СВУ МВД')))

SELECT imya, fam
FROM dbo.student
WHERE id_pol = (SELECT id_pol FROM pol WHERE pol = 'м')
 

SELECT imya, fam
FROM dbo.student
WHERE id_natsionalnost = (SELECT id_natsionalnost FROM natsionalnost WHERE natsionalnost = 'Русский')
*/