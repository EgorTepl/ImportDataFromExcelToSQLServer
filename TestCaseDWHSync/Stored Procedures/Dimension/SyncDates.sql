-------------------------------------------------------------------------------
-- Author: TeplouhovES
-- Created: 24.11.2024
-- Purpose: Хранимая процедура, которая синхронизирует таблицу [Dimension].[Dates]
----------------------------------------------------------------------------
CREATE PROCEDURE [Dimension].[SyncDates]
AS
	DECLARE @id INT = 1

	INSERT INTO Dimension.Dates(Id, DateSQL, Month, Year)
	SELECT
		@id + ROW_NUMBER() over(order by ParedDatesFromRef.DateSQL) AS id,
		ParedDatesFromRef.DateSQL,
		ParedDatesFromRef.Month,
		ParedDatesFromRef.Year

	FROM
	(
		SELECT DISTINCT
			CAST(Ref.FDate AS DATE) AS DateSQL,
			Ref.Month,
			Ref.Year
		FROM excel.Ref
		WHERE Ref.id_Client != 'NULL'
	) AS ParedDatesFromRef
	WHERE NOT EXISTS
	(
		SELECT 1
		FROM Dimension.Dates AS dt
		WHERE dt.DateSQL = ParedDatesFromRef.DateSQL
	)
RETURN 0