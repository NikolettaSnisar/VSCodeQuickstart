public with sharing class TelemetryCleaningSchedule implements Schedulable {

    public static String sched = '0 0 2 1 * ? *';//every first day of month at 2 am

    public static String scheduleTel(){
        TelemetryCleaningSchedule SC = new TelemetryCleaningSchedule();
        return System.schedule('Telemetry to delete', sched, SC);
    }

    public void execute (SchedulableContext sc){
        TelemetryCleaningBatch b1 = new TelemetryCleaningBatch();
        ID batchprocessid = Database.executeBatch(b1);
    }
  
}
