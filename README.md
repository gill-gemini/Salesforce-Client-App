# Salesforce-Client-App

This app consumes the profanity check api and deletes the contentversion , which have obscene words.

The application detects a file(content version) under a case Sobject and create queuable job. The async queuable job calls the 
profanity check rest api with content version data. Based on the response from the API , the attachment is deleted , if it contains obcsene 
words.

