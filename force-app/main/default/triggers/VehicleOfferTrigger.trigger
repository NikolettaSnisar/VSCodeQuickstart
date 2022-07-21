trigger VehicleOfferTrigger on Vehicle_offer__c (before update, before insert) {
List <Vehicle_offer__c> voffObject = Trigger.new;
List <Vehicle_offer__c> vofflist = new List <Vehicle_offer__c>();
for (Vehicle_offer__c c:Trigger.new){
    List <Vehicle_offer__c> offer =[SELECT Vehicle__c, Showroom__c FROM Vehicle_offer__c
    WHERE Vehicle__c=:c.Vehicle__c AND Showroom__c=:c.Showroom__c AND Is_physically__c=true];
    if (offer.size()>0){
        c.Vehicle__c.addError('The vehicle is already available in Showroom');
    }
}
}

    // List <Vehicle_offer__c> vofflist = new List <Vehicle_offer__c> ();
    // // map <Id, Vehicle_offer__c> setPhysically = new map <Id, Vehicle_offer__c>();
    // for (Vehicle_offer__c voffObject:[SELECT Vehicle__r.id, Showroom__r.id, Showroom__r.Name
    // FROM Vehicle_offer__c WHERE Is_physically__c = true AND Vehicle__r.Id =: Vehicle__r.Id])
    // for (Vehicle_offer__c a:Trigger.new){
    //      if (!setVehicle__c.contains(Vehicle__c))
    // {
    //  setVehicle__c.add(Vehicle__c);}

    //     else { Vehicle__c.addError('The vehicle is already available in ' + Showroom__c.Name);

    // }}}