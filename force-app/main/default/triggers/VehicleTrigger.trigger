trigger VehicleTrigger on Vehicle__c (after delete) {

    List <Telemetry__c> telList = new List <Telemetry__c>();
    // Set <Id> telemetryIds = new Set<Id>();
    
    // for(Vehicle__c vehObj:Trigger.old){
    //     telemetryIds.add(vehObj.Vehicle__c);}

    List <Case> caselist = new List <Case>();
    for (Vehicle__c vehObj: Trigger.old){       
         Case caseObj = new Case (
         // Vehicle_Case__c = casevehObj.Id,
         subject = 'Check if ' +  vehObj.Name + '  was successfully removed  ' ,
         status = 'new',
         priority = 'Medium');

         caselist.add(caseObj);
        //  telList.add(telObject);

         }

        if (caselist.size() > 0)
        { insert caselist;
        delete telList;

    }
}    


