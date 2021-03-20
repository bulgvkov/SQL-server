	
USE HR_dep;	

CREATE TABLE Документ_сотрудника
(
    ID_пакета_документов INT  not null IDENTITY(1,1),
    Номер_паспорта INT not null,
    Номер_военного_билета INT,
	Ученная_степень VARCHAR(50),
	ID_сотрудника_FK INT not null,
	PRIMARY KEY(ID_пакета_документов),
	foreign key (ID_сотрудника_FK) references Сотрудник(ID_сотрудника)
);
CREATE TABLE Должность
(
    ID_должности INT not null  IDENTITY(1,1),
    Занимаемая_должность varchar(50) not null,
	PRIMARY KEY(ID_должности)
);
CREATE TABLE Подразделение
(
    ID_подразделения  INT not null IDENTITY(1,1),
    Название_подразделения VARCHAR(255) not null,
	PRIMARY KEY(ID_подразделения)
);
CREATE TABLE Сотрудник
(
	ID_сотрудника int not null IDENTITY(1,1),
	Фамилия VARCHAR(255) not null,
    Имя VARCHAR(255) not null,
	Отчество VARCHAR(255),
	Дата_рождения DATA,	
	Пол VARCHAR(255) not null,
	ID_должности_FK INT not null,
	ID_подразделения_FK INT not null,
	PRIMARY KEY(ID_сотрудника),
	foreign key(ID_должности_FK) references Должность(ID_должности),
	foreign key(ID_подразделения_FK) references Подразделение(ID_подразделения),
);

