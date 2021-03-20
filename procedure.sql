create proc new_empl
	@ID_сотрудника as int,
	@Фамилия as varchar(20),
	@Имя as varchar(20),
	@Отчество as varchar(20),
	@Дата_рождения as date,
	@Пол as varchar(20),
	@ID_должности_FK as int, 
	@ID_подразделения_FK as int
as
	begin
	insert into dbo.Сотрудник
	values(@ID_сотрудника, @Фамилия, @Имя, @Отчество, @Дата_рождения, @Пол, @ID_должности_FK, @ID_подразделения_FK)
	end;
