-------------------------------------------------------------------------------
-- Author: TeplouhovES
-- Created: 24.11.2024
-- Purpose: Хранимая процедура, которая синхронизирует таблицу [Staging].[Products]
-------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[SyncProducts]
AS
	DECLARE @id INT = 1

	INSERT INTO [dbo].Products(Id, SourceId, ProductName, BrandName)

	SELECT @id, 0, N'Отсутствует', N'Отсутствует'

	UNION ALL

	SELECT
		@id + ROW_NUMBER() over(order by ProductssWithoutNull.id_Product) AS id,
		ProductssWithoutNull.id_Product,
		ProductssWithoutNull.Product,
		ProductssWithoutNull.Brand
	FROM
	(
		SELECT DISTINCT
			CAST(Ref.id_Product AS BIGINT) AS id_Product,
			Ref.Product,
			Ref.Brand
		FROM excel.Ref
		WHERE Ref.id_Product != 'NULL'
	) AS ProductssWithoutNull
	WHERE NOT EXISTS
	(
		SELECT 1
		FROM [dbo].Products AS prod
		WHERE prod.SourceId = ProductssWithoutNull.id_Product
	)
RETURN 0