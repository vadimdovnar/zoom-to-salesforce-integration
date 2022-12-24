public without sharing class ZoomApis {
    public static void createMeeting(String userEmail,String jasonString) {
        System.debug('jason>>'+jasonString);
        String endPoint = 'callout:ZoomMeeting/users/'+userEmail+'/meetings';
        HttpRequest req = new HttpRequest();
        req.setBody(jasonString);
        req.setMethod('POST');
        req.setHeader('Content-type', 'application/json');
        req.setEndpoint(endPoint); 
        Http http = new Http();
        HttpResponse res = http.send(req);
         
        if(res.getStatusCode() == 201){
            System.debug('res pass >>>' +res.getBody());            
        }else{
            System.debug('res fail >>>' +res);
        }
    }

    public static void get(String userEmail) {
        String endPoint = 'callout:ZoomMeeting/users/'+userEmail+'/meetings';
        HttpRequest req = new HttpRequest();
        req.setMethod('GET');
        req.setHeader('Content-type', 'application/json');
        req.setEndpoint(endPoint); 
        Http http = new Http();
        HttpResponse res = http.send(req);
            System.debug('res ' +res);            
            System.debug('res pass >>>' +res.getBody());            
    }
     
    public class createMeetingWapper{
        Public String topic {get;set;}
        Public Integer type {get;set;}
        Public String start_time {get;set;}
        Public Integer duration {get;set;}
        Public String timezone {get;set;}
        Public String password {get;set;}
    }

    
}