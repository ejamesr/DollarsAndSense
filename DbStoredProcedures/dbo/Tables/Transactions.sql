CREATE TABLE [dbo].[Transactions] (
    [Id]                  INT                IDENTITY (1, 1) NOT NULL,
    [AccountId]           INT                NOT NULL,
    [Amount]              DECIMAL (18, 2)    NOT NULL,
    [AbsAmount]           DECIMAL (18, 2)    NOT NULL,
    [Date]                DATETIMEOFFSET (7) NOT NULL,
    [Description]         NVARCHAR (MAX)     NULL,
    [Updated]             DATETIMEOFFSET (7) NULL,
    [CategoryId]          INT                NOT NULL,
    [UpdatedByUserId]     NVARCHAR (128)     NULL,
    [ReconciledAmount]    DECIMAL (18, 2)    DEFAULT ((0)) NOT NULL,
    [AbsReconciledAmount] DECIMAL (18, 2)    DEFAULT ((0)) NOT NULL,
    [ReconciliationId]    INT                NULL,
    CONSTRAINT [PK_dbo.Transactions] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_dbo.Transactions_dbo.Accounts_AccountId] FOREIGN KEY ([AccountId]) REFERENCES [dbo].[Accounts] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_dbo.Transactions_dbo.AspNetUsers_UpdatedByUserId_Id] FOREIGN KEY ([UpdatedByUserId]) REFERENCES [dbo].[AspNetUsers] ([Id]),
    CONSTRAINT [FK_dbo.Transactions_dbo.Categories_CategoryId] FOREIGN KEY ([CategoryId]) REFERENCES [dbo].[Categories] ([Id]) ON DELETE CASCADE
);




GO
CREATE NONCLUSTERED INDEX [IX_AccountId]
    ON [dbo].[Transactions]([AccountId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_UpdatedByUserId]
    ON [dbo].[Transactions]([UpdatedByUserId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_CategoryId]
    ON [dbo].[Transactions]([CategoryId] ASC);

