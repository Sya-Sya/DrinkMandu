USE [MyPayWebcomTest]
GO
/****** Object:  StoredProcedure [dbo].[Usp_AgentUserList]    Script Date: 9/8/2023 2:23:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 ALTER     PROC [dbo].[Usp_AgentUserList]   (
      @UserType varchar(100),
	  @mobileusername varchar(60)	
	)
AS
SET NOCOUNT ON
BEGIN
    DECLARE 
	    @flag NVARCHAR(max),
         @sql NVARCHAR(MAX);
Begin

	IF @flag='S'
begin
    -- construct SQL
  SET @sql = '   
          select    
          b.MobileNo as ContacNumber,
		  b.numberofUser,
		  b.FullName,
		  b.CreatedBY CreatedBY,
		  b.Email  Email,
		  b.CreatedDate,
		  b.UpdatedDate,
		  c.TotalAmount as availablebalance,
		  c.ComissionBalance,
		  c.TotalRewardPoints
     from tbl_AgentDetailUser b 
	 left join Users c with(NOLOCK)  on b.AgentID=c.AgentId '
   EXEC sp_executesql @sql
  End
  End

  Begin 

  if @flag='AP'
  begin 
  set @sql ='
  SELECT 
		 ud.UserId as UserId
		,ud.FullName FullName
		,ud.CreatedDate 
		,ud.UserImage			
		,ud.UserType AS usertype
		,ud.Email
		,ud.ContactNumber
		,ud.Gender
		,ud.MemberId
		,ud.UserId
		,RefCode
		,ud.TotalAmount
		,adct.agentimage
		from  Users ud WITH (NOLOCK)		
		join tbl_AgentDetailUser as ad  WITH (NOLOCK) on  ad.AgentID=isnull( ud.AgentId,0)
		join tbl_AgentDocument as adct WITH (NOLOCK) on  ad.AgentID=adct.AgentId
		where  UserId=@UserId
		and isnull(UserType,''Wallet'')= ''agent'' '
		 Exec( @sql)
  end
  End

 Begin 

If @flag='V'
begin 
  SET @sql = '   
          select    
          b.MobileNo as ContacNumber,
		  b.numberofUser,
		  b.FullName,
		  b.CreatedBY CreatedBY,
		  b.Email  Email,
		  b.CreatedDate,
		  b.UpdatedDate,
		  c.TotalAmount as availablebalance,
		  c.ComissionBalance,
		  c.TotalRewardPoints
     from tbl_AgentDetailUser b 
	 left join Users c on b.AgentID=c.AgentId ' 
 EXEC ( @sql)
End 
end
 End