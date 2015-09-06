CREATE TABLE [dbo].[Households] (
    [Id]          INT            IDENTITY (1, 1) NOT NULL,
    [Name]        NVARCHAR (MAX) NULL,
    [HouseholdId] NVARCHAR (MAX) NULL,
    CONSTRAINT [PK_dbo.Households] PRIMARY KEY CLUSTERED ([Id] ASC)
);

