USE [MyPayWebcomTest]
GO
/****** Object:  StoredProcedure [dbo].[Usp_RequestAgent]    Script Date: 9/11/2023 10:08:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 Create Or Alter PROC [dbo].[Usp_RequestAgent]   (
 @flag varchar(25)
,@FullAddress varchar(100)=NULL,
 @FullName varchar(100)=NULL,
@ContactNumber varchar(60)=NULL,
@Email varchar(100)=NULL,
@TransactionLimitAmount varchar(100)=NULL,
@IncomeSource int=NULL,
@Remarks nvarchar(max)=NULL,
@IpAddress nvarchar(50)=NULL,
@DeviceCode nvarchar(50)=NULL,
@Createdplatform varchar(50)=NULL
)

AS
SET NOCOUNT ON
BEGIN
   
   IF @flag='i'  --request to be agent 
      begin
           IF (ISNULL(@ContactNumber, '') = '')
	       BEGIN
	       	 select '1' code ,
	       	  'Mobile number is required' message
	       	
	       	RETURN
	       END
	           If (len(cast(@ContactNumber as nvarchar))!=10)
	        Begin 
	        select '1' code ,
	       	   'Invalid mobile number' message
	        	
	       	RETURN
	        end 
         if  exists (select 'x' from tbl_AgentDetailUser where MobileNo = cast (@ContactNumber as nvarchar))
         begin
          select '1' code ,
         	 'Contact number already exists.' message        	 	
         	RETURN
         end

		 if  exists (select 'x' from Users where ContactNumber = cast (@ContactNumber as nvarchar))
         begin
          select '1' code ,
         	 'Contact number already exists.' message        	 	
         	RETURN
         end

             BEGIN TRY
            BEGIN TRANSACTION;
           
		   Insert into  dbo.tbl_Agent_Request
		   (  
		   FullName,
		   Address,
		   Email,
		   ContactNumber,
		   TransactionLimitAmount,
		   IncomesourceId,
		   Remarks,
		   CreatedDate,
		   CreatedUTCDate,
		   IpAddress,
		   DeviceCode,
		   Createdplatform

		   )
		   values
		   (
		   @FullName,
		   @FullAddress,
		   @Email,
		   @ContactNumber,
		   @TransactionLimitAmount,
		   @IncomeSource,
		   @Remarks,
		   GETDATE(),
		   GETUTCDATE(),
		   @IpAddress,
		   @DeviceCode,
		   @Createdplatform
		   )
		   
declare @id varchar(20)=  SCOPE_IDENTITY() 
select 
      '0' code ,'Success' message,
       @id Id

		 IF @@TRANCOUNT > 0
                COMMIT;
          END TRY
          BEGIN CATCH
            IF @@TRANCOUNT > 0
                ROLLBACK;

				 Insert into tbl_error_log_sql 
				  values 
				(
				@id
				,'Usp_RequestAgent @flag=i'
				,null
				,null
				,null
				,GETUTCDATE()
				,GETDATE()
				,'sql'
				)				
				select '1' code ,
				ERROR_MESSAGE() message      
        END CATCH;
            End
end