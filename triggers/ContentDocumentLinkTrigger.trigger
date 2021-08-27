/**
 * Created by gill.bilal on 17/08/2021.
 */

trigger ContentDocumentLinkTrigger on ContentDocumentLink (after insert) {
    if(Trigger.isAfter) {
        if (Trigger.isInsert) {
            PC_ContentDocumentLinkHandler.checkFileContent(Trigger.new);
        }
    }
}