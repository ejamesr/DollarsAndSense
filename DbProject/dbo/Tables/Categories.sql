CREATE TABLE [dbo].[Categories] (
    [Id]          INT            IDENTITY (1, 1) NOT NULL,
    [HouseholdId] NVARCHAR (MAX) NULL,
    [Name]        NVARCHAR (MAX) NULL,
    [IsIncome]    BIT            DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_dbo.Categories] PRIMARY KEY CLUSTERED ([Id] ASC)
);



