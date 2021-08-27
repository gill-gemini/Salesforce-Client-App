/**
 * Created by gill.bilal on 17/08/2021.
 */

public with sharing class PC_ContentDocumentLinkHandler {

    public static void checkFileContent(List<ContentDocumentLink> conDocLinkList){
        List<String> linkEntityIdList = new List<String>();
        List<String> contentDocumentIdList = new List<String>();
        List<Id> caseContentDocList = new List<Id>();
        List <Case> cases = new List <Case>();
        List <ContentVersion> conVerList = new List <ContentVersion>();
        Map<Id , Id> contentMap = new Map<Id , Id>();
        for (ContentDocumentLink link : conDocLinkList) {
            linkEntityIdList.add(link.linkedEntityId);
            contentDocumentIdList.add(link.ContentDocumentId);
            contentMap.put(link.linkedEntityId ,link.ContentDocumentId);
        }

        if (!linkEntityIdList.isEmpty()) {
            cases = [
                    SELECT Id
                    FROM Case
                    WHERE id = :linkEntityIdList
                    LIMIT 1000
            ];
        }

        Map<String , ContentVersion> contentVersionMap = new Map<String ,ContentVersion>();


        if (!contentDocumentIdList.isEmpty()) {
            conVerList = [
                    SELECT Id, VersionData,ContentDocumentId
                    FROM ContentVersion
                    WHERE ContentDocumentId = :caseContentDocList
                    LIMIT 1000];
            
        }
        if(!System.isQueueable() && !conVerList.isEmpty()) {
            PC_AsyncCallout makeCallout = new PC_AsyncCallout(conVerList[0]);
            ID jobID = System.enqueueJob(makeCallout);
        }
    }

}