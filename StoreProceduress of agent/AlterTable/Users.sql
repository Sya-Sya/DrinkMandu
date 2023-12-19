ALTER TABLE Users
ADD failed_login_attempt nvarchar(255);

ALTER TABLE Users
ADD lastlogindate nvarchar(255);

ALTER TABLE Users
ADD Session nvarchar(255);

select *from Users