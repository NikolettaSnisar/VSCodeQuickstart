@isTest
public with sharing class TelemetryCleaningBatchTest {

    @isTest
    static void TelemetryCleaningBatchTest (){
        Test.startTest();
        Telemetry__c telemetries = new Telemetry__c();
        insert telemetries;
        TelemetryCleaningBatch BC = new TelemetryCleaningBatch ();
        Database.executeBatch(BC);
        Test.stopTest();
    }
}
    
//     // @isTest
//     // static void setup() {
//     //     List <Telemetry__c> telList = new List <Telemetry__c>();

//     //     Telemetry__c telemetriObject = new Telemetry__c (
//     //         name = 'TestTelemetry'
//     //     );

//     //     insert telemetriObject;}
    
//     @isTest static void execute(){
//         for ( Database.BatchableContext BC)
//         {
//             List <SObject> scope : [SELECT id FROM Telemetry__c 
//         WHERE CreatedDate != LAST_N_DAYS:90 ];

//         delete scope;
//     }
//     }
    

//     @isTest static void test(){
//         Test.startTest ();
//         TelemetryCleaningBatch tcb = new TelemetryCleaningBatch();
//         Id batchId = Database.executeBatch(tcb);
//         Test.stopTest();
//     }
// }

