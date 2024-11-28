CREATE TABLE [dbo].[Ref]
(
	Id BIGINT NOT NULL,
	[DateKey] INT NOT NULL,
	[ClientKey] BIGINT NOT NULL,
	[DistributorKey] BIGINT NOT NULL,
	[ProductKey] BIGINT NOT NULL,
	[SalesType] [tinyint] NOT NULL,
	[QTY] [int] NOT NULL
	CONSTRAINT [PK_Fact_Ref_Id] PRIMARY KEY CLUSTERED (Id)
	CONSTRAINT [FK_Fact_Ref_DateKey_Dimension_Dates] FOREIGN KEY([DateKey])
	 REFERENCES [Dimension].[Dates] ([Id])
	CONSTRAINT [FK_Fact_Ref_ClientKey_Dimension_Clients] FOREIGN KEY([ClientKey])
	 REFERENCES [Dimension].[Clients] ([Id])
	CONSTRAINT [FK_Fact_Ref_DistributorKey_Dimension_Distributors] FOREIGN KEY([DistributorKey])
	 REFERENCES [Dimension].[Distributors] ([Id])
	CONSTRAINT [FK_Fact_Ref_ProductKey_Dimension_Products] FOREIGN KEY([ProductKey])
	 REFERENCES [Dimension].[Products] ([Id])
)
