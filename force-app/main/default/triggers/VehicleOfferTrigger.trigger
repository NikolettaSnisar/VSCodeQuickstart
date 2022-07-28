trigger VehicleOfferTrigger on Vehicle_offer__c (before update, before insert, after insert) {

    if ( Trigger.isAfter && Trigger.isInsert){
        OfferEmailSending offemail = new OfferEmailSending();
        offemail.sendEmail(Trigger.new);
    }

    
    Set<Id> vehicleIds = new Set<Id>();

    for(Vehicle_offer__c offer : Trigger.new){
        vehicleIds.add(offer.Vehicle__c);

    }

    List <Vehicle_offer__c> physicaloffers =[
        SELECT Vehicle__c, Showroom__c
        FROM Vehicle_offer__c
        WHERE Vehicle__c=:vehicleIds
        AND Is_physically__c=true

    ];

    System.debug(physicaloffers);
    System.debug(Trigger.new);



    List <Vehicle_offer__c> vofflist = new List <Vehicle_offer__c>();
    for (Vehicle_offer__c offer:Trigger.new){
        for (Vehicle_offer__c physicaloffer : physicaloffers){
         if(physicaloffer.Vehicle__c == offer.Vehicle__c && offer.Is_physically__c==true){
            offer.addError('We hit a problem Madame');
            }

      }

    }

}

// trigger VehicleOfferTrigger on Vehicle_offer__c (before update, before insert) {
// List <Vehicle_offer__c> voffObject = Trigger.new;
// List <Vehicle_offer__c> vofflist = new List <Vehicle_offer__c>();
// for (Vehicle_offer__c c:Trigger.new){
//     List <Vehicle_offer__c> offer =[SELECT Vehicle__c, Showroom__c, Showroom__r.Name FROM Vehicle_offer__c
//     WHERE Vehicle__c=:c.Vehicle__c AND Showroom__c=:c.Showroom__c AND Is_physically__c=true];
//     if (offer.size()>0){
//         c.Vehicle__c.addError('The vehicle is already available in Showroom ' + c.Showroom__r.Name);
//     }
// }
// }




