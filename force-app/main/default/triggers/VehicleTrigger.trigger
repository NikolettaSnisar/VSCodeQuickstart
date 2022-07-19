trigger VehicleTrigger on Vehicle__c (before update, before insert) {
Set <String> setName = new Set <String>();
for (Vehicle__c objVehicle:[Select Name from Vehicle__c])
setName.add(objVehicle.Name);
for (Vehicle__c objVehicle:Trigger.new)
{
    if (!setName.contains(objVehicle.Name))
    {
        setName.add(objVehicle.Name);
    }
    else { objVehicle.Name.addError('The vehicle is already available in Showroom');
}
}

}