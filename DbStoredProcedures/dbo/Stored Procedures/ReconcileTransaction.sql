-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE ReconcileTransaction
	-- Add the parameters for the stored procedure here
	@Id int,
	@UpdatingUser nvarchar(128),
	@Date datetimeoffset
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
UPDATE [dbo].[Transactions]
   SET [Updated] = @Date,
       [UpdatedByUserId] = @UpdatingUser,
       [ReconciledAmount] = Amount,
       [AbsReconciledAmount] = AbsAmount
 WHERE AccountId = @Id
END
