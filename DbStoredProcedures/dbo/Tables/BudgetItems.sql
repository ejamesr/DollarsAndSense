CREATE TABLE [dbo].[BudgetItems] (
    [Id]            INT             IDENTITY (1, 1) NOT NULL,
    [HouseholdId]   NVARCHAR (MAX)  NULL,
    [CategoryId]    INT             NOT NULL,
    [DefaultAmount] DECIMAL (18, 2) DEFAULT ((0)) NOT NULL,
    [JanBudget]     DECIMAL (18, 2) DEFAULT ((0)) NOT NULL,
    [FebBudget]     DECIMAL (18, 2) DEFAULT ((0)) NOT NULL,
    [MarBudget]     DECIMAL (18, 2) DEFAULT ((0)) NOT NULL,
    [AprBudget]     DECIMAL (18, 2) DEFAULT ((0)) NOT NULL,
    [MayBudget]     DECIMAL (18, 2) DEFAULT ((0)) NOT NULL,
    [JunBudget]     DECIMAL (18, 2) DEFAULT ((0)) NOT NULL,
    [JulBudget]     DECIMAL (18, 2) DEFAULT ((0)) NOT NULL,
    [AugBudget]     DECIMAL (18, 2) DEFAULT ((0)) NOT NULL,
    [SepBudget]     DECIMAL (18, 2) DEFAULT ((0)) NOT NULL,
    [OctBudget]     DECIMAL (18, 2) DEFAULT ((0)) NOT NULL,
    [NovBudget]     DECIMAL (18, 2) DEFAULT ((0)) NOT NULL,
    [DecBudget]     DECIMAL (18, 2) DEFAULT ((0)) NOT NULL,
    [JanActual]     DECIMAL (18, 2) DEFAULT ((0)) NOT NULL,
    [FebActual]     DECIMAL (18, 2) DEFAULT ((0)) NOT NULL,
    [MarActual]     DECIMAL (18, 2) DEFAULT ((0)) NOT NULL,
    [AprActual]     DECIMAL (18, 2) DEFAULT ((0)) NOT NULL,
    [MayActual]     DECIMAL (18, 2) DEFAULT ((0)) NOT NULL,
    [JunActual]     DECIMAL (18, 2) DEFAULT ((0)) NOT NULL,
    [JulActual]     DECIMAL (18, 2) DEFAULT ((0)) NOT NULL,
    [AugActual]     DECIMAL (18, 2) DEFAULT ((0)) NOT NULL,
    [SepActual]     DECIMAL (18, 2) DEFAULT ((0)) NOT NULL,
    [OctActual]     DECIMAL (18, 2) DEFAULT ((0)) NOT NULL,
    [NovActual]     DECIMAL (18, 2) DEFAULT ((0)) NOT NULL,
    [DecActual]     DECIMAL (18, 2) DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_dbo.BudgetItems] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_dbo.BudgetItems_dbo.Categories_CategoryId] FOREIGN KEY ([CategoryId]) REFERENCES [dbo].[Categories] ([Id]) ON DELETE CASCADE
);




GO
CREATE NONCLUSTERED INDEX [IX_CategoryId]
    ON [dbo].[BudgetItems]([CategoryId] ASC);

