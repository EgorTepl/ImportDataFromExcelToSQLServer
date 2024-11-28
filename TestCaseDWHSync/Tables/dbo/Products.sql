CREATE TABLE [dbo].[Products]
(
	Id BIGINT NOT NULL,
	SourceId BIGINT NOT NULL,
	ProductName NVARCHAR(50),
	BrandName NVARCHAR(50)
	CONSTRAINT [PK_Staging_Products_Id] PRIMARY KEY CLUSTERED (Id)
	CONSTRAINT [UQ_Staging_Products_SourceId] UNIQUE (SourceId)
)
