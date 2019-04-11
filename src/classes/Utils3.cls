/*Given two integer arrays, write a function to return the maximum difference between a value in the first array and a value in the second array. Example:
int[] arr1 = {1,-5,3,6,7}
int[] arr2 = {10,3,5}
max difference = 15
*/

/*
Design and build a “most recently used” cache, which evicts the most recently used item.
The cache should allow you to insert and retrieve a value associated with a particular key and should be initialized with a max size.
When its full, it should evict the most recently used item
*/

public class Utils3 {

    public void MRUCache() {
        
    }
    
    public static Integer findMaxDifference(List<Integer> arr1, List<Integer> arr2) {
        arr1.sort(); //-5,1,3,6,7
        arr2.sort(); //3,5,10
        
        Integer diff1 = arr2[arr2.size()-1] - arr1[0];  //10 - -5 = 15
        Integer diff2 = arr1[arr1.size()-1] - arr2[0];  //7 - 8 = -1

        //if(diff1<0) {diff1 = diff1*-1};
        //if(diff2<0) {diff2 = diff2 *-1};
        
        if(diff1 >= diff2) {
            return diff1;
        } else {
            return diff2;
        }
    }

}