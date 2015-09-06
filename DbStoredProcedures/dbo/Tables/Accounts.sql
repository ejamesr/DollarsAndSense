CREATE TABLE [dbo].[Accounts] (
    [Id]                INT             IDENTITY (1, 1) NOT NULL,
    [HouseholdId]       NVARCHAR (MAX)  NULL,
    [Name]              NVARCHAR (MAX)  NULL,
    [ReconciledBalance] DECIMAL (18, 2) NOT NULL,
    [CheckbookBalance]  DECIMAL (18, 2) DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_dbo.Accounts] PRIMARY KEY CLUSTERED ([Id] ASC)
);

