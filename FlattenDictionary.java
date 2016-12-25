/*
    Given a dictionary, write a function to flatten it

    Input : {"Key1":"1","Key2":{"a":"2","b":"3","c":{"d":"3","e":"1","f":{"g":"4","h":"5"}}}}
    Output : {"Key1":"1","Key2.a":"2","Key2.b":"3","Key2.c.d":"3","Key2.c.e":"1","Key2.c.e.f.g":"4","Key2.c.e.f.h":"1"}

*/

import java.util.Map;
import java.util.HashMap;

public class FlattenDictionary {

    public Map flatten(Map in) {
       return flattenHelper("", in, new HashMap());
    }

    public Map flattenHelper(Object prefix, Map in, Map out) {
        if (in == null)
            return out;

        for (Object key : in.keySet()) {
            Object tempPrefix;

            if (prefix == "") {
                tempPrefix = key;
            } else {
                tempPrefix = prefix + "." + key;
            }

            if (in.get(key) instanceof Map) {
                flattenHelper(tempPrefix, (Map)in.get(key), out);
            } else {
                out.put(tempPrefix, in.get(key));
            }
        }

        return out;
    }


    public static void main(String[] args) {
        Map input = new HashMap();
        Map tempKey = new HashMap();

        input.put("Key1", "1");
        input.put("Key2", tempKey);

        tempKey.put("a", "2");
        tempKey.put("b", "3");

        tempKey = new HashMap();
        tempKey.put("d", "3");
        tempKey.put("e", "1");
        ((Map)input.get("Key2")).put("c", tempKey);

        tempKey = new HashMap();
        tempKey.put("g", "4");
        tempKey.put("h", "5");

        ((Map)((Map)input.get("Key2")).get("c")).put("f", tempKey);


        FlattenDictionary map = new FlattenDictionary();
        Map output = map.flatten(input);
        System.out.println(output);
    }

}
