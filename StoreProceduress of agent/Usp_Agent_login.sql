USE [MyPayWebcomTest]
GO
/****** Object:  StoredProcedure [dbo].[sproc_agentUser_login]    Script Date: 9/7/2023 12:57:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



ALTER    PROCEDURE [dbo].[sproc_agentUser_login] @flag VARCHAR(10)
	,@user_name VARCHAR(512)
	,@password VARCHAR(512)
	,@action_ip NVARCHAR(30)=NULL
	,@browser_info NVARCHAR(512)=NULL
	,@access_code VARCHAR(50) = null
	,@sessionId VARCHAR(max) = null
AS
SET NOCOUNT ON;

DECLARE @errortable TABLE (
	code INT
	,msg VARCHAR(100)
	,id VARCHAR(20)
	);
DECLARE @sys_date DATE;
---check if multiple login allow or not --                                        
DECLARE @allow_multiple_login CHAR(1)
	,@is_currently_loggedin CHAR(1)
	,@login_device_id NVARCHAR(50)
	,@login_session_id NVARCHAR(300)
	,@last_online_date NVARCHAR(50)
	,@user_type NVARCHAR(25)
	,@last_browser_info VARCHAR(1000)
	,@active_status VARCHAR(100)
	,@session_id NVARCHAR(100)
	,@checkCred NVARCHAR(max)
BEGIN
	IF @flag = 'login'
	BEGIN
		IF EXISTS (
					SELECT 'x'
					FROM Users WITH (NOLOCK)
					WHERE 
						ContactNumber = @user_name 
						and Password=@password
						AND isnull(IsActive,'1') ='1'
					)
				SELECT 0 code
				,message = 'success'
				,ud.UserId as UserId
				,ud.FullName FullName
				,ud.CreatedDate 
				,ud.UserImage			
				,'agent' AS usertype
			FROM Users ud WITH (NOLOCK) where ContactNumber=@user_name 

			else
			select 1 code ,
			message ='password or username wrong'
			End
		End;		