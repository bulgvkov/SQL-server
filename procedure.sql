create proc new_empl
	@ID_���������� as int,
	@������� as varchar(20),
	@��� as varchar(20),
	@�������� as varchar(20),
	@����_�������� as date,
	@��� as varchar(20),
	@ID_���������_FK as int, 
	@ID_�������������_FK as int
as
	begin
	insert into dbo.���������
	values(@ID_����������, @�������, @���, @��������, @����_��������, @���, @ID_���������_FK, @ID_�������������_FK)
	end;
