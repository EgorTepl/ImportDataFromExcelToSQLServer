CREATE TABLE [Staging].[Ref]
(
	Id BIGINT IDENTITY(1, 1) NOT NULL,
	[FDate] DATE NOT NULL,
	[ClientSourceId] BIGINT NOT NULL,
	[DistributorSourceId] BIGINT NOT NULL,
	[ProductSourceId] BIGINT NOT NULL,
	[SalesType] [tinyint] NOT NULL,
	[QTY] [int] NOT NULL
	CONSTRAINT [PK_FStaging_Ref_Id] PRIMARY KEY CLUSTERED (Id)
	CONSTRAINT [UQ_Staging_Ref_FDate_Client_Distributor_Product] UNIQUE (FDate, ClientSourceId, DistributorSourceId, ProductSourceId)
)
