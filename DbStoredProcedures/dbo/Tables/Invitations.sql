CREATE TABLE [dbo].[Invitations] (
    [Id]         INT            IDENTITY (1, 1) NOT NULL,
    [FromUserId] NVARCHAR (MAX) NULL,
    [ToEmail]    NVARCHAR (MAX) NULL,
    CONSTRAINT [PK_dbo.Invitations] PRIMARY KEY CLUSTERED ([Id] ASC)
);

