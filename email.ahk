#include files.ahk
#include logger.ahk

send_mail(emailToAddress,emailPass,emailFromAddress,emailSubject,emailMessage, fileLocation)
{
log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
Run, mailsend.exe -to %emailToAddress% -from %emailFromAddress% -ssl -smtp smtp.gmail.com -port 465 -sub "%emailSubject%" -M "%emailMessage%" +cc +bc -q -auth-plain -user %emailFromAddress% -pass %emailPass% -attach "%fileLocation%",, Hide
}

send_mail_plain(emailToAddress,emailPass,emailFromAddress,emailSubject,emailMessage)
{
log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
Run, mailsend.exe -to %emailToAddress% -from %emailFromAddress% -ssl -smtp smtp.gmail.com -port 465 -sub %emailSubject% -M %emailMessage% +cc +bc -q -auth-plain -user %emailFromAddress% -pass %emailPass%,, Hide
}

email_message(subj,msg)
{
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  creds := {}
  load_csv_dictionary("secret.csv", creds)
  send_mail_plain(creds["email"], creds["password"],creds["email"],subj,msg)
}


email_attachment(subj,msg,file)
{
  log_trace("entered", A_ScriptName, A_ThisFunc, A_LineNumber)
  creds := {}
  load_csv_dictionary("secret.csv", creds)
  send_mail(creds["email"], creds["password"],creds["email"],subj,msg,file)
}
