/**
 * Created by gill.bilal on 21/08/2021.
 */

public with sharing class PC_AsyncCallout implements Queueable, Database.AllowsCallouts {
    private ContentVersion conVersion;
    public PC_AsyncCallout(ContentVersion conVer) {
        this.conVersion= conVer;
    }
    public void execute(QueueableContext context) {
       PC_Callouts.makePostCallout(conVersion);
    }
}