# c:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < C:\Users\Adri\Desktop\Git\Zavrsni_rad\zavrsni_rad.sql
drop database if exists zavrsni_rad;
create database zavrsni_rad;

use zavrsni_rad;

create table termin (
    sifra int not null primary key auto_increment,
    datum date not null,
    vrijeme time not null,
    klijent int not null
);

create table biljeska (
    sifra int not null primary key auto_increment,
    opazanje varchar (255),
    preporuka varchar (255),
    termin int not null,
    tretman int not null
);

create table tretman (
    sifra int not null primary key auto_increment,
    naziv varchar (100) not null,
    cijena decimal (18,2)
);

create table stanje (
    sifra int not null primary key auto_increment,
    naziv varchar (100) not null,
    opis varchar (250)
);

create table tretman_stanje (
    tretman int not null,
    stranje int not null
);

create table klijent (
    sifra int not null primary key auto_increment,
    ime varchar (50) not null,
    prezime varchar (50) not null,
    kontakt_tel char (14) not null,
    e_mail varchar (100)
);

create table klijent_stanje (
    klijent int not null,
    stanje int not null
);

alter table termin add foreign key (klijent)
references klijent (sifra);

alter table biljeska add foreign key (termin)
references termin (sifra);

alter table biljeska add foreign key (tretman)
references tretman (sifra);

alter table tretman_stanje add foreign key (tretman)
references tretman (sifra);

alter table tretman_stanje add foreign key (stanje)
references stanje (sifra);

alter table klijent_stanje add foreign key (klijent)
references klijent (sifra);

alter table klijent_stanje add foreign key (stanje)
references stanje (sifra);


