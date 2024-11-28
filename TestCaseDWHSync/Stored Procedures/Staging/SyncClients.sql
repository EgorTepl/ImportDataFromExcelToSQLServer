-------------------------------------------------------------------------------
-- Author: TeplouhovES
-- Created: 24.11.2024
-- Purpose: Хранимая процедура, которая синхронизирует таблицу [Staging].[Clients]
-------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[SyncClients]
AS
	DECLARE @id INT = 1

	INSERT INTO [dbo].Clients(Id, SourceId, ClientName)
	
	SELECT @id, 0, N'Отсутствует'

	UNION ALL
	
	SELECT
		@id + ROW_NUMBER() over(order by ClientsWithoutNull.id_Client) AS id,
		ClientsWithoutNull.id_Client,
		ClientsWithoutNull.Client

	FROM
	(
		SELECT DISTINCT
			CAST(Ref.id_Client AS BIGINT) AS id_Client,
			Ref.Client
		FROM excel.Ref
		WHERE Ref.id_Client != 'NULL'
	) AS ClientsWithoutNull
	WHERE NOT EXISTS
	(
		SELECT 1
		FROM [dbo].Clients AS cl
		WHERE cl.SourceId = ClientsWithoutNull.id_Client
	)

RETURN 0