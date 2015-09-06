-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CreateTransaction]
	-- Add the parameters for the stored procedure here
           @AccountId int,
           @Amount decimal,
           @AbsAmount decimal,
           @Date datetimeoffset,
           @Description nvarchar,
           @CategoryId int,
           @UpdatedByUserId nvarchar(128),
           @ReconciledAmount decimal = 0,
           @AbsReconciledAmount decimal = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent  extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO [dbo].[Transactions]
           ([AccountId]
           ,[Amount]
		   ,[AbsAmount]
           ,[Date]
           ,[Description]
           ,[Updated]
           ,[CategoryId]
           ,[UpdatedByUserId]
           ,[ReconciledAmount]
		   ,[AbsReconciledAmount])
     VALUES
           (@AccountId,
           @Amount,
           ABS(@Amount),
           @Date,
           @Description,
           null,
           @CategoryId,
           @UpdatedByUserId,
           @ReconciledAmount,
           ABS(@ReconciledAmount))
	EXEC dbo.UpdateAccountBal @AccountId, @Amount
END