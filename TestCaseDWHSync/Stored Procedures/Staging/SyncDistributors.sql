-------------------------------------------------------------------------------
-- Author: TeplouhovES
-- Created: 24.11.2024
-- Purpose: Хранимая процедура, которая синхронизирует таблицу [Staging].[Distributors]
----------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[SyncDistributors]
AS
	DECLARE @id INT = 1

	INSERT INTO [dbo].Distributors(Id, SourceId, DistributorName)
	
	SELECT @id, 0, N'Отсутствует'

	UNION ALL
	
	SELECT
		@id + ROW_NUMBER() over(order by DistributorsWithoutNull.id_Distributor) AS id,
		DistributorsWithoutNull.id_Distributor,
		DistributorsWithoutNull.Distributor

	FROM
	(
		SELECT DISTINCT
			CAST(Ref.id_Distributor AS BIGINT) AS id_Distributor,
			Ref.Distributor
		FROM excel.Ref
		WHERE Ref.id_Distributor != 'NULL'
	) AS DistributorsWithoutNull
	WHERE NOT EXISTS
	(
		SELECT 1
		FROM [dbo].Distributors AS distr
		WHERE distr.SourceId = DistributorsWithoutNull.id_Distributor
	)

RETURN 0