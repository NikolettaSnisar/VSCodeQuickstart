@isTest
public with sharing class TriggerVehicleOfferTest {
    @isTest

        static void testBeforeInsert(){
            Vehicle__c vehObj = new Vehicle__c (
                name = 'AA234'
            );
            insert vehObj;

            Account acc = new Account(
                name = 'Audi'
            );

            insert acc;

            Showroom__c showObj = new Showroom__c (
                name = 'Gdansk'
            );

            showObj.Account__c = acc.Id;
            insert showObj;

        

            Vehicle_offer__c offer1 = new Vehicle_offer__c(
                name = 'Offer 1',
                Is_physically__c = true
            );
            offer1.Vehicle__c = vehObj.Id;
            offer1.Showroom__c = showObj.Id;
            insert offer1;

            Vehicle_offer__c offer2 = new Vehicle_offer__c(
                name = 'Offer 2',
                Is_physically__c = true
            );
            offer2.Vehicle__c = vehObj.Id;
            offer2.Showroom__c = showObj.Id;




            Try {

             insert offer2;
         

            }

            Catch (Exception offer) {
            List <Vehicle_offer__c> offerlist =[SELECT Id FROM Vehicle_offer__c];
            System.assertEquals(offerlist.size(), 1 );

            }
 
        }}
          
