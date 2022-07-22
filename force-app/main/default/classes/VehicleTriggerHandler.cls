// public with sharing class VehicleTriggerHandler {
//     public VehicleTriggerHandler() {
//         String Name;
//         Integer fuel_usage;
//         Integer power;
//         Integer age;


    }}
//     trigger TelemetryTrigger on Vehicle__c (after delete) {
//         List <Telemetry__c> telemetryList = new List <Telemetry__c>();
//         for (Vehicle__c vehicle: trigger.old){
//             Telemetry__c telemetry = new Telemetry__c();
//             telemetry.Name = Name;
//             telemetry.Vehicle_Power__c = power;
//             telemetry.fuel_usage__c = fuel_usage ;
//             telemetry.age__c = age;
    
//             telemetryList.add(telemetry);
//         }
//         if(!telemetryList.isEmpty()){
//             insert telemetryList;
//         }
    
//     }
// }
