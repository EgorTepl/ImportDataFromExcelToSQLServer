-------------------------------------------------------------------------------
-- Author: TeplouhovES
-- Created: 24.11.2024
-- Purpose: Хранимая процедура, которая синхронизирует таблицу [Fact].[Ref]
-------------------------------------------------------------------------------
CREATE PROCEDURE [Fact].[SyncRef]
AS
	INSERT INTO Fact.Ref (Id, DateKey, ClientKey, DistributorKey, ProductKey, SalesType, QTY)
	SELECT
		CAST(source.FDate AS date) AS 
	FROM Excel.Ref AS source

RETURN 0
