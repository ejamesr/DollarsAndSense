CREATE TABLE [dbo].[Reconciliations] (
    [Id]            INT                IDENTITY (1, 1) NOT NULL,
    [StatementDate] DATETIMEOFFSET (7) NOT NULL,
    [Updated]       DATETIMEOFFSET (7) NOT NULL,
    [BankAccountId] INT                NOT NULL,
    [BeginBal]      DECIMAL (18, 2)    NOT NULL,
    [EndBal]        DECIMAL (18, 2)    NOT NULL,
    [IsReconciled]  BIT                NOT NULL,
    CONSTRAINT [PK_dbo.Reconciliations] PRIMARY KEY CLUSTERED ([Id] ASC)
);

