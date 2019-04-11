public class Jobs {
    
    public static void findTime() {
        List<String> lstJobs = new List<String>{'A', 'B', 'A', 'B'};
        Map<String, Integer> mapLastRun = new Map<String, Integer>();
        Integer currentPos = 0;
        //Integer nextReady = 0;
        for(STRING job : lstJobs) {
            Integer lastPos = 0;
            If(mapLastRun.containsKey(job)) {
               lastPos =   mapLastRun.get(job);
            }
            if(lastPos == 0) {
                mapLastRun.put(job, currentPos + 1);
                currentPos ++;
            } else {
                Integer nextReady = lastPos + 3;
                if(currentPos < nextReady + 1) {
                    currentPos = nextReady + 1;
                }
                mapLastRun.put(job, currentPos);
            }
        }
        System.debug(currentPos);
    }

}