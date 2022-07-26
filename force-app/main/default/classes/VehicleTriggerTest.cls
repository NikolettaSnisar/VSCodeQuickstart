@isTest
public with sharing class VehicleTriggerTest {

    @isTest
    static void TestAfterDelete() {

        List <Case> caselist = new List <Case>();
        Vehicle__c vehObj = new Vehicle__c (
            name = 'AAwe2'
        );
        insert vehObj;
        Case caseObj = new Case (
        subject = 'Check if ' +  vehObj.Name + '  was successfully removed  ' ,
        status = 'new',
        priority = 'Medium'

        );
         delete vehObj;
         insert caseObj;
        }

    // try {
        
    //     delete vehObj;
    
    // }

    // Catch (DMLException case) {
    //     System.assert(case.getMessage().contains(''))
    }

