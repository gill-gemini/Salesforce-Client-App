/**
 * Created by gill.bilal on 17/08/2021.
 */

public with sharing class PC_AttachmentInspectService {

    public static void processResponse(String response, ContentVersion conVer){
       PC_ResponseWrapper wrapper= PC_ResponseWrapper.parse(response);
        if(wrapper.result){
            try {
                System.debug('ContentVer Attach Service' + conVer);
                ContentDocument conDoc = [SELECT id from ContentDocument WHERE Id =:conVer.ContentDocumentId];
                System.debug('conDoc' +  conDoc);
                delete conDoc;
                System.debug('Deleted Content Document');
            } catch(DmlException e) {
                System.debug('The following exception has occurred: ' + e.getMessage());
            }
        }
        else{
            System.debug('Profanity check passed , file not deleted');
        }
    }
}