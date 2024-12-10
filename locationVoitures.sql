drop table contrat;
drop table client;
drop table voitures;
create sequence voitures start with 0 increment by 1;
create sequence contrat start with 0 increment by 1;
--Creation des tables
create table client(
    numC int AUTO_INCREMENT primary key ,
    nom varchar(30) not null,
    adresse varchar(30) not null,
    tel varchar(15) not null
);

create table voitures(
    numV int AUTO_INCREMENT primary key,   
    marque varchar(30) not null,
    modele varchar(30) not null,
    annee int not null
);

create table Contrat(
    numL int AUTO_INCREMENT primary key,
    numC int not null,
    numV int not null,
    dateDebut date not null,
    dateFin date not null,
    duree int not null,
    constraint Fk_client foreign key (numC) references client(numC),
    constraint Fk_voiture foreign key (numV) references voitures(numV)
);
-- ********* Insertion des donnees

insert into client(nom, adresse, tel) values ('Ahmed saidi','sale,Maroc','0661234574');
insert into client(nom, adresse, tel) values ('Ahmed ahmed','casa,Maroc','0661234567');
insert into client(nom, adresse, tel) values ('Ahmed said','safi,Maroc','0664534567');
insert into client(nom, adresse, tel) values ('said ahmed','casa,Maroc','0661239767');

insert into voitures(marque,modele,annee) values ('BMW1','3 Series',2020);
insert into voitures(marque,modele,annee) values ('BMW2','3 Series',2021);
insert into voitures(marque,modele,annee) values ('BMW3','3 Series',2020);
insert into voitures(marque,modele,annee) values ('BMW4','3 Series',2021);

insert into Contrat(numC,numV,dateDebut,dateFin,duree) values (1,1,'2025-01-01','2025-06-30',10);
insert into Contrat(numC,numV,dateDebut,dateFin,duree) values (2,2,'2025-01-01','2025-06-30',6);
insert into Contrat(numC,numV,dateDebut,dateFin,duree) values (3,3,'2025-01-01','2025-06-30',10);
insert into Contrat(numC,numV,dateDebut,dateFin,duree) values (4,4,'2025-01-01','2025-06-30',6);

-- ********* Requetes

-- select for all from  voiture et client 
select * from client ;

select * from voitures;

select client.nom,Contrat.numV,voitures.marque,Contrat.datedebut,Contrat.datefin,Contrat.duree,client.tel,client.adresse
from Contrat
join client on Contrat.numC = client.numC
join voitures on Contrat.numV = Voitures.numV;



-- delete all   contrat  

delete from client where numC=1;

delete from voitures where numV=1 ;

delete from Contrat ;
--  modifier 
UPDATE client 
SET nom = 'Salma'
WHERE numC = 1;


