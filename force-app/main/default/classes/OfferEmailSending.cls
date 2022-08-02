public with sharing class OfferEmailSending {
    public void sendEmail(List <Vehicle_offer__c> triggerNewList) {

    List<Messaging.SingleEmailMessage> mails =  new List<Messaging.SingleEmailMessage>();

    List<String> sendTo = new List<String>();

    List<Vehicle_offer__c> vehofflist= [
        SELECT Name, Vehicle_offer__c.Vehicle__c, Vehicle_offer__c.Showroom__c
        FROM Vehicle_offer__c];

    sendTo.add('nikabane26@gmail.com ');
    for(SObject vhoffer : Trigger.new){
        Messaging.SingleEmailMessage mail =  new Messaging.SingleEmailMessage();
        mail.setToAddresses(sendTo);
        mail.setSubject('New Offer was created');
        String body = 'Check a new offer Name:  '+ Vehicle_offer__c.Name +' Vehicle Name: '
        + Vehicle_offer__c.Vehicle__c + ' Showroom: ' + Vehicle_offer__c.Showroom__c;
        mail.setHtmlBody(body);
        mails.add(mail);
      }
       Messaging.sendEmail(mails);
    }}


