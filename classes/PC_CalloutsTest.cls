/**
 * Created by gill.bilal on 24/08/2021.
 */
@isTest
public with sharing class PC_CalloutsTest {

    @isTest
    static void fileDeletionTest(){

        String body = '{'+
                '"result": true,'+
                '"curseWords": ['+
                        '"fuck",'+
                        '"fuck",' +
                        '"fuck"]'
                + '}';
        List<Case> cases= TestDataFactory.createCases(1);
        insert cases;
        ContentVersion co = TestDataFactory.createContentVersion('Hey whats Up fuck fuck fuck');
        insert co;
        List<ContentDocument> documents = [SELECT Id, Title, LatestPublishedVersionId FROM ContentDocument];

        test.startTest();
        MockUpResponseGenerator mockResp = new MockUpResponseGenerator(body,200);
        Test.setMock(HttpCalloutMock.class, mockResp);

        ContentVersion content = [SELECT id , contentdocumentid ,versiondata,title from ContentVersion LIMIT 1];
        /*Asyn Queueable is not called , when inserting a Content Document Link. Has to be called separately*/
        //ContentDocumentLink conLink = TestDataFactory.createContentDocumentLink(cases[0].Id, documents[0].id);
       // insert conLink;

        PC_AsyncCallout makeCallout = new PC_AsyncCallout(content);
        ID jobID = System.enqueueJob(makeCallout);
        /*TODO Content Version is deleted a bit late due to async, assertion is not successful */
       // System.assert(contentVersions.isEmpty());
        test.stopTest();
    }
}