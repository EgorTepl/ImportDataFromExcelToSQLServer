-------------------------------------------------------------------------------
-- Author: TeplouhovES
-- Created: 24.11.2024
-- Purpose: Хранимая процедура, которая запускает процесс синхронизации хранилища TestCaseDWH
-------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[SyncDWH]
AS
	EXEC [dbo].SyncClients;
	EXEC [dbo].SyncDistributors;
	EXEC [dbo].SyncProducts;

	EXEC Dimension.SyncDates;

RETURN 0