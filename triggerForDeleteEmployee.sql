USE [HR_dep]
GO
/****** Object:  Trigger [dbo].[delete_empl]    Script Date: 22.03.2021 13:04:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER trigger [dbo].[delete_empl]
on [dbo].[Сотрудник]
instead of delete
as
delete from Документ_сотрудника
where ID_сотрудника_FK = (select ID_сотрудника from deleted)
delete from Сотрудник
where ID_сотрудника = (select ID_сотрудника from deleted)
