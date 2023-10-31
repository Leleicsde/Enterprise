create table Sectii(
IdSectie int primary key,
Nume nvarchar(30) NOT NULL,
)

create table Angajati(
IdAngajat int primary key,
Nume nvarchar(20) NOT NULL,
Prenume nvarchar(20) NOT NULL,
DataNasterii date, 
Adresa nvarchar(30),
Functie nvarchar(30) NOT NULL,
Salariu numeric(10,2) NOT NULL,
IdSectie int NOT NULL,
foreign key (IdSectie) references Sectii(IdSectie),
)


create table Furnizori(
IdFurnizor int primary key,
Nume nvarchar(20) NOT NULL,
Prenume nvarchar(20) NOT NULL,
Adresa nvarchar(30) NOT NULL,
)


create table Ingineri(
IdIngineri int primary key,
IdAngajat int NOT NULL,
foreign key (IdAngajat) references Angajati(IdAngajat),
Specialitatea nvarchar(30) NOT NULL,
)


 create table Dependenti(
 IdDependent int primary key, 
 IdAngajat int NOT NULL, 
 foreign key (IdAngajat) references Angajati(IdAngajat),
 Nume nvarchar(20) NOT NULL,
 Prenume nvarchar(20) NOT NULL,
 DataNasterii date, -- aaaa-ll-zz
 GradRudenie nvarchar(30) NOT NULL,
 )


 create table Proiecte(
 IdProiect int primary key, 
 Denumire nvarchar(30) NOT NULL, 
 Termen date, 
 Buget numeric(10,2) NOT NULL, 
 )



create table Activitati(
IdActivitati int primary key, 
IdProiect int NOT NULL,
foreign key (IdProiect) references Proiecte(IdProiect),
IdAngajat int NOT NULL, 
foreign key (IdAngajat) references Angajati(IdAngajat),
Ore int,
)



create table Componente(
IdComponenta int primary key, 
Denumire nvarchar(30) NOT NULL,
Descriere nvarchar(30) NOT NULL,
)


create table Produse(
IdProdus int primary key, 
Denumire nvarchar(30) NOT NULL, 
Descriere nvarchar(30) NOT NULL,
)


create table Compozitii(
IdCompozitie int primary key, 
IdComponenta int NOT NULL,
foreign key (IdComponenta) references Componente(IdComponenta),
IdProdus int NOT NULL,
foreign key (IdProdus) references Produse(IdProdus),
NrComponente int NOT NULL,
)


create table Achizitii(
IdAchizitie int primary key, 
IdFurnizor int NOT NULL,
foreign key (IdFurnizor) references Furnizori(IdFurnizor),
IdComponenta int NOT NULL,
foreign key (IdComponenta) references Componente(IdComponenta),
IdAngajat int NOT NULL,
foreign key (IdAngajat) references Angajati(IdAngajat),
Data date,
NrComponente int NOT NULL,
PretUnitar numeric(10,2)
)




create table Secretare(
IdSecretara int primary key, 
IdAngajat int NOT NULL,
foreign key (IdAngajat) references Angajati(IdAngajat),
VitezaRedactare int NOT NULL,
)



create table Clienti(
IdClient int primary key, 
Nume nvarchar(20) NOT NULL,
Prenume nvarchar(20) NOT NULL,
Adresa nvarchar(30),
)


create table Vanzari(
IdVanzare int primary key, 
IdProdus int NOT NULL,
foreign key (IdProdus) references Produse(IdProdus),
IdClient int NOT NULL,
foreign key (IdClient) references Clienti(IdClient),
IdAngajat int NOT NULL,
foreign key (IdAngajat) references Angajati(IdAngajat),
DataVanzare date, -- aaaa-ll-zz
NrProduse int NOT NULL,
)



insert into Sectii (IdSectie, Nume) values
(1, 'Sectie1'),
(2, 'Sectie2'),
(3, 'Sectie3'),
(4, 'Sectie4'),
(5, 'Sectie5')

insert into Angajati(IdAngajat, Nume, Prenume, DataNasterii, Adresa, Functie, Salariu, IdSectie) values
(1,'Popescu', 'Ion', '1980-02-01', 'Str. 1 octombrie nr. 20','Director Adjunct',2999,1),
(2,'Popescu', 'Mihai-Andrei', '2000-12-24', 'Str. Principala nr. 60','Director Executiv',4999,3),
(3,'Hortopan', 'Marius', '1996-06-30', 'Str. 1 Mai nr. 1','Analist',3989,5),
(4,'Ionescu', 'Eduard', '1990-11-09', 'Str. Mihai Viteazu nr. 7','Consultant',5600,2),
(5,'Predescu', 'Elena-Ionela', '2002-05-08', 'Str. Tudor Vladimirescu nr. 5 ','Administrator',7500,4)

insert into Furnizori(IdFurnizor, Nume, Prenume, Adresa) values
(1, 'Danciulescu', 'Ana-Maria', 'Str. A.I.Cuza nr. 14'),
(2, 'Stanciu', 'Cristian', 'Str. 9 Mai nr. 140'),
(3, 'Balan', 'Stefan-Darius', 'Str. Sperantei nr. 29'),
(4, 'Dumitrescu', 'Florin', 'Str. Pacii nr. 45'),
(5, 'Scarlatescu', 'Sorin-Marian', 'Str. Independentei nr. 74')

insert into Ingineri(IdIngineri,IdAngajat, Specialitatea) values
(1,2,'Constructor'),
(2,3,'Economist'),
(3,4,'Tester'),
(4,1,'Designer'),
(5,2,'Mecanica')

insert into Dependenti(IdDependent, IdAngajat, Nume, Prenume, DataNasterii, GradRudenie) values
(1, 1, 'Popescu', 'Andreea-Georgiana', '1989-10-10', 'sotie'),
(2, 1, 'Ionescu', 'Alexandra', '2003-02-01', 'sora'),
(3, 5, 'Ionescu ', 'Dante', '2015-04-08', 'fiu'),
(4, 3, 'Predescu', 'Liana', '2010-08-26', 'sora'),
(5, 2, 'Predescu', 'Dragos', '1999-11-15', 'frate')

insert into Proiecte (IdProiect, Denumire, Termen, Buget) values
(1, 'Proiect1', '2022-01-02', 2400),
(2, 'Proiect2', '2023-02-08', 5421),
(3, 'Proiect3', '2021-10-11', 7895),
(4, 'Proiect4', '2020-12-25', 2333),
(5, 'Proiect5', '2019-05-05', 4553)

insert into Activitati(IdActivitati, IdProiect, IdAngajat, Ore) values
(1,2,4,5),
(2,3,1,7),
(3,5,4,12),
(4,1,3,21),
(5,3,2,11)

insert into Componente (IdComponenta, Denumire, Descriere) values
(1, 'Denumire1', 'Descriere1'),
(2, 'Denumire2', 'Descriere2'),
(3, 'Denumire3', 'Descriere3'),
(4, 'Denumire4', 'Descriere4'),
(5, 'Denumire5', 'Descriere5')

insert into Produse(IdProdus, Denumire, Descriere) values
(1, 'Denumire1', 'Descriere1'),
(2, 'Denumire2', 'Descriere2'),
(3, 'Denumire3', 'Descriere3'),
(4, 'Denumire4', 'Descriere4'),
(5, 'Denumire5', 'Descriere5')

insert into Compozitii(IdCompozitie,IdComponenta,IdProdus,NrComponente) values
(1,3,1,143567),
(2,1,4,147),
(3,2,5,63567),
(4,3,2,1437),
(5,2,1,1567)

insert into Achizitii(IdAchizitie, IdFurnizor, IdComponenta, IdAngajat, Data, NrComponente, PretUnitar) values
(1,1,1,1,'2003-02-01',4,123),
(2,1,1,1,'2003-02-01',4,123),
(3,1,1,1,'2003-02-01',4,123),
(4,1,1,1,'2003-02-01',4,123),
(5,1,1,1,'2003-02-01',4,123)

insert into Secretare(IdSecretara, IdAngajat, VitezaRedactare) values
(1, 1, 127),
(2, 4, 107),
(3, 5, 105),
(4, 2, 104),
(5, 3, 96)

insert into Clienti(IdClient, Nume, Prenume, Adresa) values
(1, 'Anghelescu', 'Darius-Alexandru', 'Str. 9 mai nr. 15'),
(2, 'Bontea', 'Catalin', 'Str. Independentei nr. 17'),
(3, 'Neacsu', 'Eduard-Daniel', 'Str. Scolii nr. 27'),
(4, 'Neamtu', 'Adriana-Maria', 'Str. Principala nr. 44'),
(5, 'Dragomir', 'Mariana', 'Str. Primaverii nr. 21')

insert into Vanzari(IdVanzare,IdProdus,IdClient,IdAngajat, DataVanzare, NrProduse) values 
(1,1,1,1,'2003-02-01',4),
(2,1,1,1,'2003-02-01',4),
(3,1,1,1,'2003-02-01',4),
(4,1,1,1,'2003-02-01',4),
(5,1,1,1,'2003-02-01',4)
