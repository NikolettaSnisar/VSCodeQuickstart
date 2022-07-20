trigger VehicleTrigger on Vehicle_offer__c (before update, before insert) {
    map <Id, Vehicle_offer__c> setPhysically = new map <Id, Vehicle_offer__c>();
    for (Vehicle_offer__c offerObject:[Select Vehicle__c, Showroom__r.Name
    FROM Vehicle_offer__c WHERE Is_physically__c = true]){

    for (Vehicle_offer__c a:Trigger.new){
         (!setVehicle__c.contains(Vehicle__c))
        {
            setVehicle__c.add(Vehicle__c);
        }
        else { Vehicle__c.addError('The vehicle is already available in ' + Showroom__r.Name);

    }}}}

// }
// Set <String> setName = new Set <String>();
// for (Vehicle__c objVehicle:[Select Name from Vehicle__c])
// setName.add(objVehicle.Name);
// for (Vehicle__c objVehicle:Trigger.new)
// {
//     if (!setName.contains(objVehicle.Name))
//     {
//         setName.add(objVehicle.Name);
//     }
//     else { objVehicle.Name.addError('The vehicle is already available in Showroom');
// }
// }


// }