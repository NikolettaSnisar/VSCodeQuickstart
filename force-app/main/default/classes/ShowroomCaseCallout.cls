public with sharing class ShowroomCaseCallout {
    
    @future (callout = true)
    public static void ShowroomCaseCallout(String Id) {

        List <Showroom__c> showrooms = [
        SELECT ID, Name
        FROM Showroom__c 
        WHERE Showroom_status__c = 'Closed'];

        for (Case caseObj = new Case (
        subject = 'Time for renovation ' + showrooms.Name ,
        status = 'new',
        priority = 'Medium'));{

             Http server = new Http();
             HttpRequest req = new HttpRequest();
             req.setEndpoint('https://jsonplaceholder.typicode.com/posts');
             req.setMethod('POST');

             req.setBody(JSON.serialize(
             new List <Case>{
                'Id' = case.Id }));

             HttpResponse resp = server.send(req);}

        if(resp.getStatusCode() = 201)

             { Showroom_status__c.set('Closed');

        }else

             { System.debug(LoggingLevel.ERROR, 'Connection error.');

             }
    
    }
}
