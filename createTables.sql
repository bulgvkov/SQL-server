	
USE HR_dep;	

CREATE TABLE ��������_����������
(
    ID_������_���������� INT  not null IDENTITY(1,1),
    �����_�������� INT not null,
    �����_��������_������ INT,
	�������_������� VARCHAR(50),
	ID_����������_FK INT not null,
	PRIMARY KEY(ID_������_����������),
	foreign key (ID_����������_FK) references ���������(ID_����������)
);
CREATE TABLE ���������
(
    ID_��������� INT not null  IDENTITY(1,1),
    ����������_��������� varchar(50) not null,
	PRIMARY KEY(ID_���������)
);
CREATE TABLE �������������
(
    ID_�������������  INT not null IDENTITY(1,1),
    ��������_������������� VARCHAR(255) not null,
	PRIMARY KEY(ID_�������������)
);
CREATE TABLE ���������
(
	ID_���������� int not null IDENTITY(1,1),
	������� VARCHAR(255) not null,
    ��� VARCHAR(255) not null,
	�������� VARCHAR(255),
	����_�������� DATA,	
	��� VARCHAR(255) not null,
	ID_���������_FK INT not null,
	ID_�������������_FK INT not null,
	PRIMARY KEY(ID_����������),
	foreign key(ID_���������_FK) references ���������(ID_���������),
	foreign key(ID_�������������_FK) references �������������(ID_�������������),
);

