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

ALTER TABLE ��������_����������
    ADD PassNumberEncrypted varbinary(160);   
GO  

OPEN SYMMETRIC KEY aesKey  
   DECRYPTION BY CERTIFICATE certificateForPass;  

UPDATE ��������_����������
SET PassNumberEncrypted = EncryptByKey(Key_GUID('aesKey'), CONVERT(NVARCHAR(100), �����_��������), 1, HASHBYTES('SHA2_256', CONVERT(varbinary, ID_����������_FK)));  
GO  

OPEN SYMMETRIC KEY aesKey  
   DECRYPTION BY CERTIFICATE certificateForPass;  
GO

SELECT �����_��������, PassNumberEncrypted
AS 'encrypted passport number', CONVERT(nvarchar, 
DECRYPTBYKEY(PassNumberEncrypted, 1, HASHBYTES('SHA2_256', CONVERT(varbinary, ID_����������_FK))))
AS 'decrypted passport number' FROM ��������_����������;
GO



