public with sharing class TelemetryCleaningBatch implements Database.Batchable<SObject> {
    
    public Database.Querylocator start (Database.BatchableContext BC){
        String query = '';
        if(Test.isRunningTest()){
             query = 'SELECT Id FROM Telemetry__c ';
        }else{
             query = 'SELECT Id FROM Telemetry__c WHERE CreatedDate != LAST_N_DAYS:90';
        }
        return Database.getQueryLocator(query);
    }

    public void execute (Database.BatchableContext BC, List <Telemetry__c> telemetries){
        // List <Telemetry__c> telemetries = [SELECT Id from Telemetry__c 
        // WHERE CreatedDate != LAST_N_DAYS:90];
        // delete telemetries;

        System.debug(telemetries);
        System.debug(BC);
    }


    public void finish (Database.BatchableContext BC){}


}
