trigger OfferEmailTrigger on Vehicle_offer__c (after insert, after update) {
  // public class OfferEmail (){
  //   public void sendemail(List<Vehicle_ofer__c> triggerNewList)
  // }

    // this should a class that trigger invokes
    List<Messaging.SingleEmailMessage> mails =  new List<Messaging.SingleEmailMessage>();

    List<String> sendTo = new List<String>();

    List <Vehicle_offer__c> vehofflist = new List <Vehicle_offer__c>();

    List<Vehicle_offer__c> vhoffer= [
        SELECT Name, Vehicle_offer__c.Vehicle__r.Name, Vehicle_offer__c.Showroom__r.Name
        FROM Vehicle_offer__c];

        // Vehicle__r.Name 
        //
    sendTo.add('nikabane26@gmail.com ');

      for(Vehicle_offer__c vhoffer : Trigger.new){
        Messaging.SingleEmailMessage mail =  new Messaging.SingleEmailMessage();
        mail.setToAddresses(sendTo);
        mail.setSubject('New Offer was created');
        // String body = '';
        // for loop goes through the Trigger.new{  
//              String body += 'Check a new offer Name:  '+ vhoffer.Name +' Vehicle Name: '
//              + vhoffer.Vehicle__r.Name + '<br>';
        // }
        String body = 'Check a new offer Name:  '+ vhoffer.Name +' Vehicle Name: '
        + vhoffer.Vehicle__r.Name;
        + ' Showroom: ' + vhoffer.Showroom__r.Name;
        mail.setHtmlBody(body);
        mails.add(mail);
      }
       Messaging.sendEmail(mails);
}


