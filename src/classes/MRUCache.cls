/*
Design and build a “most recently used” cache, which evicts the most recently used item.
The cache should allow you to insert and retrieve a value associated with a particular key and should be initialized with a max size.
When its full, it should evict the most recently used item
*/

public class MRUCache {

    private Map<String, String> cache;
    private static Integer maxSize = 5;
    private String mostRecentKey = '';
    
    public MRUCache() {
        cache = new Map<String, String>();
    }
    
    public Boolean addToCache(String key, String value) {
        if(cache.containsKey(key) || ( !cache.containsKey(key) && cache.size() <= maxSize)) {
            cache.put(key, value);
            mostRecentKey = key;
        } else if(cache.size() == maxSize) {
            cache.remove(mostRecentKey);
            cache.put(key, value);
            mostRecentKey = key;
        }
        return true;
    }

    public String retrieveFromCache(String key) {
        mostRecentKey = key;
        return cache.get(key);
    }

}