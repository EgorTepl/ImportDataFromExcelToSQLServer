CREATE TABLE [dbo].[Distributors]
(
	Id BIGINT NOT NULL,
	SourceId BIGINT NOT NULL,
	DistributorName NVARCHAR(50)
	CONSTRAINT [PK_Staging_Distributors_Id] PRIMARY KEY CLUSTERED (Id)
	CONSTRAINT [UQ_Staging_Distributors_SourceId] UNIQUE (SourceId)
)
