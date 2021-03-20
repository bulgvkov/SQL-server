	
USE HR_dep;	

CREATE TABLE Документ_сотрудника
(
    ID_пакета_документов int not null identity(1,1),
    Номер_паспорта int not null,
    Номер_военного_билета int,
    Ученная_степень varchar(50),
    ID_сотрудника_FK int not null,
    primary key(ID_пакета_документов),
    foreign key(ID_сотрудника_FK) references Сотрудник(ID_сотрудника)
);
CREATE TABLE Должность
(
    ID_должности int not null identity(1,1),
    Занимаемая_должность varchar(50) not null,
    primary key(ID_должности)
);
CREATE TABLE Подразделение
(
    ID_подразделения int not null identity(1,1),
    Название_подразделения varchar(50) not null,
    primary key(ID_подразделения)
);
CREATE TABLE Сотрудник
(
    ID_сотрудника int not null identity(1,1),
    Фамилия varchar(50) not null,
    Имя varchar(50) not null,
    Отчество varchar(50),
    Дата_рождения data,	
    Пол varchar(50) not null,
    ID_должности_FK int not null,
    ID_подразделения_FK int not null,
    primary key(ID_сотрудника),
    foreign key(ID_должности_FK) references Должность(ID_должности),
    foreign key(ID_подразделения_FK) references Подразделение(ID_подразделения), 
);

