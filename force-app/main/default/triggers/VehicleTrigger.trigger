trigger VehicleTrigger on Vehicle__c (after delete) {
    List <Case> caselist = new List <Case>();

    for(Vehicle__c casevehObj:Trigger.old){

    Case caseObj = new Case (
        // Vehicle_Case__c = casevehObj.Id,
        subject = 'Check if ' +  casevehObj.Name + '  was successfully removed  ' ,
        status = 'new',
        priority = 'Medium');

    caselist.add(caseObj);

    if (caselist.size() > 0) { insert caselist;

    }

    } }
        
    // if(Vehicle__c ==null){
    //     caselist.add(case);}}
