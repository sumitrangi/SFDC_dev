public class Utils {

    public static void test1() {
        //wordsWithSameChars(new List<String>{'Eat','Ate','Meat','Team'});
        
    }
    
    public static void numsWithSameSum(List<Integer> lstInputInts, Integer inputSum) {
        lstInputInts.sort();
        //Split the list
        //traverse through the split list
    }
    
    public static void wordsWithSameChars(List<String> lstInputWords) {
        Map<String, List<String>> mapWords = new Map<String, List<String>>();
        for(String word : lstInputWords) {
            String sortedString = sortString(word);
            if(!mapWords.containsKey(sortedString)) {
                mapWords.put(sortedString, new List<String>());
            }
            mapWords.get(sortedString).add(word);
        }
        for(String key : mapWords.keySet()) {
            System.debug(mapWords.get(key));
        }
    }

    public static String sortString(String inputString) {
        inputString = inputString.toLowerCase();
        List<String> lstChars = new List<String>();
        for(Integer i=0; i<inputString.length(); i++) {
            lstChars.add(inputString.substring(i,i+1));
        }
        lstChars.sort();
        String sortedString = '';
        for(Integer i=0; i<lstChars.size(); i++) {
            sortedString += lstChars[i];
        }
        return sortedString;
    }
}