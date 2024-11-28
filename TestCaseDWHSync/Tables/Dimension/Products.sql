CREATE TABLE [Dimension].[Products]
(
	Id BIGINT NOT NULL,
	ProductName NVARCHAR(50),
	BrandName NVARCHAR(50)
	CONSTRAINT [PK_Dimension_Products_Id] PRIMARY KEY CLUSTERED (Id)
)
