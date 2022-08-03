public with sharing class OfferEmailSending {
    public void sendEmail(List <Vehicle_offer__c> triggerNewList) {

    List<Messaging.SingleEmailMessage> mails =  new List<Messaging.SingleEmailMessage>();

    List<String> sendTo = new List<String>();

    List<Vehicle_offer__c> vehofflist= [
        SELECT Name, Vehicle_offer__c.Vehicle__c, Vehicle_offer__c.Showroom__c
        FROM Vehicle_offer__c];

    sendTo.add('nikabane26@gmail.com ');
    Messaging.SingleEmailMessage mail =  new Messaging.SingleEmailMessage();
    mail.setToAddresses(sendTo);
    mail.setSubject('New Offer was created');
    for(Vehicle_offer__c vhoffer : triggerNewList){
    String body = 'Check a new offer Name:  '+ vhoffer.Name +' Vehicle Name: '
    + vhoffer.Vehicle__c + ' Showroom: ' + vhoffer.Showroom__c + '<br>';
    mail.setHtmlBody(body);
    mails.add(mail);

    Messaging.sendEmail(mails);
      }
     
    }
}


