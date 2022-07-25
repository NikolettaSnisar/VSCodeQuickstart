@isTest
public with sharing class TriggerVehicleOfferTest {
    @isTest

        static void testBeforeInsert(){
            Vehicle_offer__c voffObject = new Vehicle_offer__c (
            Name = 'Test Offer',
            Is_physically__c = true);

            insert voffObject;

            Vehicle__c vehObj1 = new Vehicle__c();
            vehObj1.Name = 'SS34';
            vehObj1.model__c = 'FFFF';
            insert vehObj1;

            Showroom__c showObj1 = new Showroom__c();
            showObj1.Name = 'Gdansk';
            insert showObj1;


            Vehicle__c vehObj2 = new Vehicle__c();
            vehObj2.Name = 'SS34';
            vehObj2.model__c = 'FFFF';
            insert vehObj2;

            Showroom__c showObj2 = new Showroom__c();
            showObj2.Name = 'Gdansk';
            insert showObj2;


            List <Vehicle_offer__c> vofflist = new List <Vehicle_offer__c>();

            // for (Vehicle_offer__c physicaloffer : physicaloffers){
                if(voffObject.Vehicle__c == voffObject.Vehicle__c 
            && voffObject.Is_physically__c==true){
                voffObject.addError('We hit a problem Madame');
              
                }else{
                    vofflist.add(voffObject);
                    }


        }

}           



