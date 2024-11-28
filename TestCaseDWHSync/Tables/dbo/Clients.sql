CREATE TABLE [dbo].[Clients]
(
	Id BIGINT NOT NULL,
	SourceId BIGINT NOT NULL,
	ClientName NVARCHAR(50)
	CONSTRAINT [PK_Staging_Clients_Id] PRIMARY KEY CLUSTERED (Id)
	CONSTRAINT [UQ_Staging_Clients_SourceId] UNIQUE (SourceId)
)
