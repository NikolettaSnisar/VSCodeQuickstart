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


            // is it right to put Id here, because in anither way I`m getting misteakes? 
           

            // List<Vehicle_offer__c> offerlist = new List<Vehicle_offer__c>();

            Try {

             insert offer2;
            //  I`m not sure that it should be insert offer2?

            }

            Catch (Exception offer) {
            List <Vehicle_offer__c> offerlist =[SELECT Id FROM Vehicle_offer__c];
            System.assertEquals(offerlist.size(), 1 );

            }
            // I lost my thoughts a little bit in all of that
        }}
          
