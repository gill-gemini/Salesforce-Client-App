# Salesforce-Client-App

This app consumes the profanity check api[1] and deletes the contentversion , which has obscene words.

The application detects a **txt** file(content version) under a case Sobject and create queuable job. The async queuable job calls the 
profanity check rest api with content version data. Based on the response from the API , the attachment is deleted , if it contains obcsene 
words.Currently the client app cannot handle the file > 12 MB.

The client app makes a post call to the following URL , with the content version data in the body.
https://scancontent.herokuapp.com

The rest API is running on free dynos on Heroku account. So when you make the first request , server is sleeping ,it will time out. Sencond request will be successful.


The profanity check api rest endpoint is set in the custom metadata type(Profanity_Check_Setting__mdt). Remote site settings should have the rest API URL.

The client app can only handle one file in a transaction. If bulk of files are loaded , then only for the first file , the profanity check is done.

Package.xml contains all the metadata , which needs to be deployed to sandbox.

* **SAMPLE TEST**

  After deployment , Upload a file (content version) on a case. If the txt file contains an obcscene word , then it will be deleted.

[1] https://github.com/gill-gemini/profanitycheckapi/tree/master
