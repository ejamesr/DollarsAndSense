CREATE TABLE [dbo].[BudgetItems] (
    [Id]            INT             IDENTITY (1, 1) NOT NULL,
    [HouseholdId]   NVARCHAR (MAX)  NULL,
    [CategoryId]    INT             NOT NULL,
    [DefaultAmount] DECIMAL (18, 2) DEFAULT ((0)) NOT NULL,
    [Jan]           DECIMAL (18, 2) DEFAULT ((0)) NOT NULL,
    [Feb]           DECIMAL (18, 2) DEFAULT ((0)) NOT NULL,
    [Mar]           DECIMAL (18, 2) DEFAULT ((0)) NOT NULL,
    [Apr]           DECIMAL (18, 2) DEFAULT ((0)) NOT NULL,
    [May]           DECIMAL (18, 2) DEFAULT ((0)) NOT NULL,
    [Jun]           DECIMAL (18, 2) DEFAULT ((0)) NOT NULL,
    [Jul]           DECIMAL (18, 2) DEFAULT ((0)) NOT NULL,
    [Aug]           DECIMAL (18, 2) DEFAULT ((0)) NOT NULL,
    [Sep]           DECIMAL (18, 2) DEFAULT ((0)) NOT NULL,
    [Oct]           DECIMAL (18, 2) DEFAULT ((0)) NOT NULL,
    [Nov]           DECIMAL (18, 2) DEFAULT ((0)) NOT NULL,
    [Dec]           DECIMAL (18, 2) DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_dbo.BudgetItems] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_dbo.BudgetItems_dbo.Categories_CategoryId] FOREIGN KEY ([CategoryId]) REFERENCES [dbo].[Categories] ([Id]) ON DELETE CASCADE
);




GO
CREATE NONCLUSTERED INDEX [IX_CategoryId]
    ON [dbo].[BudgetItems]([CategoryId] ASC);

