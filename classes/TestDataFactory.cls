/**
 * Created by gill.bilal on 24/08/2021.
 */
@isTest
public with sharing class TestDataFactory {

    public static List<Case> createCases(Integer noOfCase){
        List<Case> caseList = new List<Case>();
        for(Integer i=0;i<noofCase;i++){
            Case cs = new Case();
            cs.status ='New';
            cs.Origin = 'Email';
            caseList.add(cs);
        }
        return caseList;
    }

    public static ContentVersion createContentVersion(String text) {
        ContentVersion contentVersion = new ContentVersion(
                Title = 'test',
                PathOnClient = 'test.txt',
                VersionData = Blob.valueOf(text),
                IsMajorVersion = true
        );
        return contentVersion;
    }

    public static ContentDocumentLink createContentDocumentLink(ID caseId , ID contentDocId){
        ContentDocumentLink contentlink = new ContentDocumentLink();
        contentlink.LinkedEntityId = caseId;
        contentlink.ShareType = 'I';
        contentlink.ContentDocumentId = contentDocId;
        contentlink.Visibility = 'AllUsers';
        return contentlink;
    }


}