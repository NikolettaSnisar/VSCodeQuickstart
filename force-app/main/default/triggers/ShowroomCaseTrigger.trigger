trigger ShowroomCaseTrigger on Showroom__c(after update) {
    
    List <Showroom__c> showrooms = [
        SELECT ID, Name
        FROM Showroom__c 
        WHERE Showroom_status__c = 'Closed'];

    for (Showroom__c shObj: Trigger.new){  
        
        List <Case> caselist = new List <Case>();
        Case caseObj = new Case (
        subject = 'Time for renovation ' + shObj.Name ,
        status = 'new',
        priority = 'Medium');

        // FeedItem feed = new FeedItem();
        // feed.ParentId = 'showrooms Id';
        // feed.Body = 'Time to renovate' + shObj.Name  ;
        // insert feed;
 
        if (shObj.Showroom_status__c == 'Closed'){
   
            caselist.add(caseObj);
            
        }

        if (caselist.size() > 0)
        { insert caselist;

        }
    }   
} 
