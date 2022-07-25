@isTest
public with sharing class TriggerVehicleOfferTest {
    @isTest

        static void testBeforeInsert(){
            Vehicle__c vehObj = new Vehicle__c (
                name = 'AA234'
            );
            insert vehObj;

            Vehicle_offer__c offer1 = new Vehicle_offer__c(
                name = 'Offer 1',
                Is_physically__c = true
            );
            offer1.Vehicle__c = vehObj.Id;
            insert offer1;

            Vehicle_offer__c offer2 = new Vehicle_offer__c(
                name = 'Offer 2',
                Is_physically__c = true
            );
            offer2.Vehicle__c = vehObj.Id;
            // is it right to put Id here, because in anither way I`m getting misteakes? 
            insert offer2;

            // List<Vehicle_offer__c> offerlist = new List<Vehicle_offer__c>();

            Try {

             insert offer2;
            //  I`m not sure that it should be insert offer2?

            }

            Catch (Exception offer) {
            List <Vehicle_offer__c> offerlist =[SELECT Id FROM Vehicle_offer__c];
            System.assertEquals(offerlist.size(), 2 );

            }
            // I lost my thoughts a little bit in all of that
        }}
          
