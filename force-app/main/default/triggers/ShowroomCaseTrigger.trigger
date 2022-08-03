Trigger ShowroomCaseTrigger on Showroom__c(after update) {

    List<Showroom__c> closedShowrooms = new List<Showroom__c>();

    for (Showroom__c shObj: Trigger.new){  
        if (shObj.Showroom_status__c == 'Closed'){
            closedShowrooms.add(shObj);
        }
    }   

    InsertCaseQueueable caseQueueable = new InsertCaseQueueable();

    caseQueueable.setShowrooms(closedShowrooms);
    ID jobID = System.enqueueJob(closedShowrooms);
} 