/**
 * Created by gill.bilal on 21/08/2021.
 */

public with sharing class PC_Callouts {

    public static HttpResponse makePostCallout(ContentVersion con)
    {
        HttpRequest request = new HttpRequest();
        request= PC_Callouts.initCallout(con);
        Http http = new Http();
        HttpResponse response  = http.send(request);
        if(response.getStatusCode() == 200) {
            System.debug('ContentVersion PC CallOuts' + con);
            PC_AttachmentInspectService.processResponse(response.getBody(), con);
        } else {
            System.debug('The status code returned was not expected: ' +
            response.getStatusCode() + ' ' + response.getStatus());
            System.debug('Body' + response.getBody());
        }
        return response;
    }


    public static HttpRequest initCallout(ContentVersion con){
        List<Profanity_Check_Setting__mdt> pcEndPointInfo = getpcMdt();

        HttpRequest request = new HttpRequest();
        request.setEndpoint( pcEndPointInfo[0].end_point__c + '/v1/scancontent');
        request.setMethod('POST');
        request.setHeader('Content-Type', 'application/json;charset=UTF-8');
        request.setTimeout(12000);
        request.setBodyAsBlob(con.VersionData);

        return request;
    }

    public static List<Profanity_Check_Setting__mdt> getpcMdt() {
        Map<String, Profanity_Check_Setting__mdt> pcEndpointsMap = new Map<String, Profanity_Check_Setting__mdt>();
        List<Profanity_Check_Setting__mdt> pcEndpointInfos = [
                SELECT  end_point__c ,token__c
                FROM Profanity_Check_Setting__mdt
        ];
        for (Profanity_Check_Setting__mdt pcInfo : pcEndpointInfos) {
            pcEndPointsMap.put(pcInfo.end_point__c, pcInfo);
        }
        return pcEndpointInfos;
    }
}
