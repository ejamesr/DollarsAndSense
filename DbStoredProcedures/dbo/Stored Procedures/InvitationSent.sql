-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InvitationSent]
	-- Add the parameters for the stored procedure here
	@email nvarchar(max),
	@user  nvarchar(max)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
INSERT INTO [dbo].[Invitations]
           ([FromUserId]
           ,[ToEmail])
     VALUES
           (@user, @email)
RETURN 35
END
