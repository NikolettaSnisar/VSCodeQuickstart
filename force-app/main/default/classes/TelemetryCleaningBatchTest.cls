@isTest
public with sharing class TelemetryCleaningBatchTest {

    @isTest
    static void TelemetryCleaningBatchTest (){
        Telemetry__c telemetries = new Telemetry__c(
            name = 'Test'
        );
        insert telemetries;
        Test.startTest();
        TelemetryCleaningBatch BC = new TelemetryCleaningBatch ();
        Database.executeBatch(BC);
        Test.stopTest();

        List<Telemetry__c> deletedList = [SELECT Id FROM  Telemetry__c 
        WHERE CreatedDate != LAST_N_DAYS:90];
        System.assertEquals(0, deletedList.size(), 'All records were deleted');
    }
}
    


