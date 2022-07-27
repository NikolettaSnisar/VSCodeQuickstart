public with sharing class TelemetryCleaningBatch implements Database.Batchable<SObject> {
    
    public Database.Querylocator start (Database.BatchableContext BC){
        String query = 'SELECT Id FROM Telemetry__c';
        return Database.getQueryLocator(query);
    }

    public void execute (Database.BatchableContext BC, List <SObject> scope){
        List <Telemetry__c> telemetries = [SELECT Id from Telemetry__c WHERE CreatedDate != LAST_N_DAYS:90];
        delete telemetries;
    }

    public void finish (Database.BatchableContext BC){}


}
