


SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO




create function @db_user.parsenull (@str varchar(8000))
returns varchar(8000)
as
begin
if (@str is not null)
return @str

return ''
end
GO


SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

