-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[UpdateTransaction] 
	-- Add the parameters for the stored procedure here
    @Id int,
    @Amount decimal(18,2),
    @AbsAmount decimal(18,2),
    @Date datetimeoffset(7),
    @Description nvarchar(max),
    @Updated datetimeoffset(7),
    @CategoryId int,
    @UpdatedByUserId nvarchar(128),
    @ReconciledAmount decimal(18,2),
    @AbsReconciledAmount decimal(18,2)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	-- Get the original value before modifying it
	DECLARE @OrigAmt decimal, @BankAcct int
	SELECT @OrigAmt = t.Amount, @BankAcct = t.AccountId FROM Transactions t
	WHERE t.Id = @Id

    -- Insert statements for procedure here
	UPDATE [dbo].[Transactions]
	SET [Amount] = @Amount,
       [AbsAmount] = @AbsAmount,
       [Date] = @Date,
       Description = @Description,
       [Updated] = @Updated,
       [CategoryId] = @CategoryId,
       [UpdatedByUserId] = @UpdatedByUserId,
       [ReconciledAmount] = @ReconciledAmount,
       [AbsReconciledAmount] = @AbsReconciledAmount
	WHERE Id = @Id

	-- Update balance of account...
	SET @OrigAmt = @Amount - @OrigAmt
	EXEC dbo.UpdateAccountBal @BankAcct, @OrigAmt
END
