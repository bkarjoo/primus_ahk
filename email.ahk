#include files.ahk

send_mail(emailToAddress,emailPass,emailFromAddress,emailSubject,emailMessage, fileLocation)
{
Run, mailsend.exe -to %emailToAddress% -from %emailFromAddress% -ssl -smtp smtp.gmail.com -port 465 -sub %emailSubject% -M %emailMessage% +cc +bc -q -auth-plain -user %emailFromAddress% -pass %emailPass% -attach %fileLocation%,, Hide
}

email_message(subj,msg)
{
  creds := {}
  load_csv_dictionary("secret.csv", creds)
  send_mail(creds["email"], creds["password"],creds["email"],subj,msg,"")
}


email_attachment(subj,msg,file)
{
  creds := {}
  load_csv_dictionary("secret.csv", creds)
  send_mail(creds["email"], creds["password"],creds["email"],subj,msg,file)
}
