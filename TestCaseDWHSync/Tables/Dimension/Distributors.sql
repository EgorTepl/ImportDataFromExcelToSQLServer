CREATE TABLE [Dimension].[Distributors]
(
	Id BIGINT NOT NULL,
	DistributorName NVARCHAR(50)
	CONSTRAINT [PK_Dimension_Distributors_Id] PRIMARY KEY CLUSTERED (Id)
)
