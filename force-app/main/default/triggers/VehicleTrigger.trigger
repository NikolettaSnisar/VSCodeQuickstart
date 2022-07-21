trigger VehicleTrigger on Vehicle__c (after delete) {
    // Set<Id> setCaseId = new Set <Id>();
    // for(Vehicle__c c:Trigger.old){ 
    //     setCaseId.add(setCaseId);   
    // }

    List <Case> caselist = new List <Case>();
    for(Vehicle__c caseveh:Trigger.old)
    if(caseveh.Vehicle__c ==null){
        caselist.add(case);

    }

}