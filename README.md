# Salesforce-Client-App

This app consumes the profanity check api[1] and deletes the contentversion , which has obscene words.

The application detects a file(content version) under a case Sobject and create queuable job. The async queuable job calls the 
profanity check rest api with content version data. Based on the response from the API , the attachment is deleted , if it contains obcsene 
words.Currently the client app cannot handle the file > 12 MB.

The client app makes a post call to the following URL , with the content version data in the body.
https://scancontent.herokuapp.com

The profanity check api rest endpoint is set in the custom metadata type(Profanity_Check_Setting__mdt). Remote site settings should have the rest API URL.

Package.xml contains all the metadata , which needs to be deployed to sandbox.

[1] https://github.com/gill-gemini/profanitycheckapi/tree/master
