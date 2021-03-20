USE HR_dep

CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'SO_hard_for_h@ck';
GO

CREATE CERTIFICATE certificateForPass
   WITH SUBJECT = 'passport_number';  
GO  

CREATE SYMMETRIC KEY aesKey  
    WITH ALGORITHM = AES_256  
    ENCRYPTION BY CERTIFICATE certificateForPass;  
GO  

ALTER TABLE Документ_сотрудника
    ADD PassNumberEncrypted varbinary(160);   
GO  

OPEN SYMMETRIC KEY aesKey  
   DECRYPTION BY CERTIFICATE certificateForPass;  

UPDATE Документ_сотрудника
SET PassNumberEncrypted = EncryptByKey(Key_GUID('aesKey'), CONVERT(NVARCHAR(100), Номер_паспорта), 1, HASHBYTES('SHA2_256', CONVERT(varbinary, ID_сотрудника_FK)));  
GO  

OPEN SYMMETRIC KEY aesKey  
   DECRYPTION BY CERTIFICATE certificateForPass;  
GO

SELECT Номер_паспорта, PassNumberEncrypted
AS 'encrypted passport number', CONVERT(nvarchar, 
DECRYPTBYKEY(PassNumberEncrypted, 1, HASHBYTES('SHA2_256', CONVERT(varbinary, ID_сотрудника_FK))))
AS 'decrypted passport number' FROM Документ_сотрудника;
GO



