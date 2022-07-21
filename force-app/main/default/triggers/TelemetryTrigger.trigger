trigger TelemetryTrigger on Vehicle__c (after delete) {
    List <Telemetry__c> telemetryList = new List <Telemetry__c>();
    for (Vehicle__c vehicle: trigger.old){
        Telemetry__c telemetry = new Telemetry__c();
        telemetry.Vehicle_Power__c = vehicle.power__c;
        telemetry.fuel_usage__c = vehicle.fuel_usage__c ;
        telemetry.age__c = vehicle.age__c;

        telemetryList.add(telemetry);
    }
    if(!telemetryList.isEmpty()){
        insert telemetryList;
    }

}