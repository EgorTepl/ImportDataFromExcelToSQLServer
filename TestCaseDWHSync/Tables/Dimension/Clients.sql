CREATE TABLE [Dimension].[Clients]
(
	Id BIGINT NOT NULL,
	ClientName NVARCHAR(50)
	CONSTRAINT [PK_Dimension_Clients_Id] PRIMARY KEY CLUSTERED (Id)
)
