USE [MyPayWebcomTest]
GO
/****** Object:  StoredProcedure [dbo].[Usp_AgentUser]    Script Date: 8/28/2023 9:44:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER   PROC [dbo].[Usp_AgentUser]   (
	@FullName Varchar(100)= isnull,
	@MobileNumber varchar(100)='',
	@Email varchar(100)=isnull,
	@Gender varchar(20)=isnull,
	@FatherName varchar(20)=Isnull,
	@MotherName varchar(20)=isnull,
	@GrandFatherName varchar(20)= isnull,
	@SpouseName varchar(20)=isnull,
	@District varchar(20)=isnull,
	@Ward varchar(20)=null,
	@createdby varchar(30)=isnull,
	@Individual varchar(30)=isnull,
	@organization varchar(20)=isnull,
	@Rewardpoint int =null,
	@UserType varchar(50)=isnull,
	@password varchar(100)=isnull,
	@numberofuser nvarchar(40) =isnull,
	@currentAddress varchar(100) =isnull,
	@HouseNumber int=isnull,
	@StreetName varchar(100)=isnull
	,@MartialStatus varchar(50)=isnull,
	@Autorelatedby varchar(50)=isnull,
	@UserName varchar(50)=null,
    @Municipality varchar(50)=null,
	@AgentId int =isnull ,
	@DocumentType nvarchar(100)=null,
	@Documentnumber nvarchar(100)=null
    ,@IssueDate nvarchar(30)=null
	,@Expirydate nvarchar(40)=null,
	@Pannumber nvarchar(50)=null,
	@Pandocuments nvarchar(100)=null,
	@frontimage  nvarchar(100)=null,
	@Backimage nvarchar(100)=null,
	@BankName varchar(100) =null,
	@BankAccountNumber nvarchar(100)='',
	@Branch varchar(100)=isnull,
	@Citizenshipimage nvarchar(100)=isnull,
	@DirectorRecentIamge nvarchar(100)=isnull,
	@Directoremail varchar(50)=isnull,
	@DirectorName varchar(50)=isnull,
	@DirectorNumber nvarchar(50)=isnull,
	@Directorcitizenshipimage nvarchar(60)=isnull,
	@Officelocation varchar(100)=isnull,
	@VatNumber nvarchar(200)=isnull,
	@Districtofoffice varchar(50)=isnull,
	@Provincesofoffice varchar(50)=isnull,
	@MunicilatyofOffice varchar(50)=isnull,
	@Housenumberofffice nvarchar(100)='',
	@Streetnameoffice varchar(100)=isnull,
	@CreatedDate varchar(50)=isnull
	,@UpdatedDate varchar(50)=isnull
	)
AS
SET NOCOUNT ON
BEGIN
    DECLARE 
	    @flag NVARCHAR(max),
		 @Err INT,
		 @StatusCode int,
		 @ErrorMessage NVARCHAR(max),
         @sql NVARCHAR(MAX);
	SET @Err=0

	Begin
	IF @flag='I'
		set @AgentId =SCOPE_IDENTITY()
  	IF (ISNULL(@UserType, '') = '')
	BEGIN
		SET @StatusCode = 1
		SET @ErrorMessage = 'Usertype is required'
		RETURN
	END
	 
  	IF (ISNULL(@MobileNumber, '') = '')
	BEGIN
		SET @StatusCode = 1
		SET @ErrorMessage = 'MobileNumber is required'
		RETURN
	END
	 If (len(cast(@MobileNumber as nvarchar))=10)
	 Begin 
	 	SET @StatusCode = 1
		SET @ErrorMessage = 'MobileNumber is number must be 10 number'
		RETURN
	 end 
	 
if not exists (select ContactNumber from Users where ContactNumber = cast (@MobileNumber as nvarchar))
begin

    -- construct SQL
	insert into tbl_AgentDetailUser
        (
          MobileNo,
		  FatherName,
		  MotherName,
		  GrandFatherName,
		  numberofUser,
		  FullName,
		  SpouseName,
		  CreatedBY,
		  District,
		  Individual,
		  Organization,
		  CurrentAdress,
		  Email,
		  Autorelatedby,
          Ward,
          RewardPoint,
          Password,
          StreetName,
		  HouseNumber,		 
		 MaritualStatus,
		 UserName,
		 Municipality,
		 CreatedDate
        ) 
		values 
		(
            @MobileNumber
            ,@FatherName
			,@MotherName
			,@GrandFatherName
			,@numberofuser
			,@FullName
			,@SpouseName
			,@createdby
			,@District
			,@Individual
			,@organization
			,@currentAddress
			,@Email,
			 @Autorelatedby
			,@Ward
			,@Rewardpoint
			,@Password
			,@StreetName
			,@HouseNumber
			,@MartialStatus
			,@UserName
			,@Municipality
			,GetDate()
		)
		
Insert into tbl_AgentDocument
(AgentId,
DocumentType,
DocumentNumber,
IssueDate,
ExpiryDate,
PanNumber,
PanDocumentImage,
FrontImage,
BackImage,
BankName,
AccountNumber,
Branch,
CitizenshipImage,
DirectorFullName,
DirectorEmail,
DirectorContactNumber,
DirectorCitizenshipImage,
DirectorRecentImage,
VatNumber,
OfficeLocation,
Provinceofoffice,
Districtofoffice,
Municipalityofoffice,
streetname,
housenumber) 
    values
(
SCOPE_IDENTITY(),
@DocumentType,
@Documentnumber,
@IssueDate,
@Expirydate,
@Pannumber,
@Pandocuments,
@frontimage,
@Backimage,
@BankName,
@BankAccountNumber,
@Branch,
@Citizenshipimage,
@DirectorName,
@Directoremail,
@DirectorNumber,
@Directorcitizenshipimage,
@DirectorRecentIamge,
@VatNumber,
@Officelocation,
@Provincesofoffice,
@Districtofoffice,
@MunicilatyofOffice,
@Streetnameoffice,
@Housenumberofffice)
		

Insert into Users (ContactNumber,SpouseName,Email,UserType,MeritalStatus,FatherName,MotherName,Fullname,GrandFatherName,AgentId,Password) values(@MobileNumber,@SpouseName,@Email,'Agent',@MartialStatus,@FatherName,@MotherName,@FullName,@GrandFatherName,SCOPE_IDENTITY(),@password)
end
  EXEC sp_executesql @sql
  End 
  End