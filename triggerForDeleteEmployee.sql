USE [HR_dep]
GO
/****** Object:  Trigger [dbo].[delete_empl]    Script Date: 20.03.2021 21:04:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER trigger [dbo].[delete_empl]
on [dbo].[Сотрудник]
after delete
as
delete from Документ_сотрудника
where ID_сотрудника_FK = (select ID_сотрудника from deleted)
