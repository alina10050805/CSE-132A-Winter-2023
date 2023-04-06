.mode columns
.headers on
create table frequents (
    drinker varchar(255), 
    bar varchar(255),
    primary key (drinker, bar)
);
create table serves (
    bar varchar(255), 
    beer varchar(255), 
    price float,
    primary key (bar, beer)
);

create table likes (
    drinker varchar(255), 
    beer varchar(255),
    primary key (drinker, beer)
);

-- frequents 
insert into frequents values ('Molly', 'Beer Garden');
insert into frequents values ('Joe', 'Tune In Bar');
insert into frequents values ('Ben', 'Beer Garden');
insert into frequents values ('Ben', 'Tune In Bar');
insert into frequents values ('Bob', 'Start the Fire');

-- serves
insert into serves values ('Beer Garden', 'Coors', 2);
insert into serves values ('Tune In Bar', 'Bass', 3);
insert into serves values ('Tune In Bar', 'Sierra', 5);
insert into serves values ('Start the Fire', 'Budweiser', 100);

-- likes
insert into likes values ('Molly', 'Coors');
insert into likes values ('Joe', 'Bass');
insert into likes values ('Ben', 'Coors');
insert into likes values ('Ben', 'Bass');
insert into likes values ('Ben', 'Sierra');
insert into likes values ('Ben', 'Budweiser');
