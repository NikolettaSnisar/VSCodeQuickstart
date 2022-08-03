public class InsertCaseQueueable implements Queueable {

    private List<Showroom__c> showrooms;

    public void setShowrooms(List<Showroom__c> showrooms){
        this.showrooms = showrooms;
    }

    public void execute(QueueableContext context) {

        if(this.showrooms != null){
            List<Case> cases = new List<Case>();

            for(Showroom__c showroom : showrooms){
                Case caseObj = new Case (
                    subject = 'Time for renovation ' + showroom.Name ,
                    status = 'new',
                    priority = 'Medium'
                );
                cases.add(caseObj);
            }
            
            insert cases;

            ID jobID = System.enqueueJob(Cases);

        }

    }
}