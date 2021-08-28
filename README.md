# Salesforce-Client-App

This app consumes the profanity check api[1] and deletes the contentversion , which has obscene words.

The application detects a **txt** file(content version) under a case Sobject and create queuable job. The async queuable job calls the 
profanity check rest api with content version data. Based on the response from the API , the attachment is deleted , if it contains obcsene 
words.Currently the client app cannot handle the file > 12 MB.

The client app makes a post call to the following URL , with the content version data in the body.
https://scancontent.herokuapp.com

The rest API is running on free dynos on Heroku account. So when you make the first request , server is sleeping ,it will time out. Sencond request will be successful.The profanity check api rest endpoint is set in the custom metadata type(Profanity_Check_Setting__mdt). Remote site settings should have the rest API URL.The client app can only handle one file in a transaction. If bulk of files are loaded , then only for the first file , the profanity check is done.

* **Type of Files Supported**

  Only txt files are supported. **.txt , .csv and .xml extensions are supported**
* **Banned Words Document**

The list of banned words is fetched from the google link mentioned below. Use a word from this doc to create a file , which should be deleted.
https://docs.google.com/spreadsheets/d/1hIEi2YG3ydav1E06Bzf2mQbGZ12kh2fe4ISgLg_UBuM/export?format=csv

* **Deployment**

Clone the repo and use Package.xml which contains all the metadata for deployment to the SF sandbox.

* **SAMPLE TEST**

  After deployment , Upload a file (content version) on a case. If the txt file contains an obscene word , then it will be deleted.
  
  <img width="781" alt="Screenshot 2021-08-28 at 4 17 41" src="https://user-images.githubusercontent.com/1822240/131201810-a0bc7d40-2c7c-43d4-b09e-cee5eb8e8b94.png">
  
  
  * **NOTES && ENHANCMENTS**
    An exception log needs to be implemented , so that the async errors can be logged.
    Support for files >12MB will be implemented.

[1] https://github.com/gill-gemini/profanitycheckapi/tree/master
