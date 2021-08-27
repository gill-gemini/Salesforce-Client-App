/**
 * Created by gill.bilal on 24/08/2021.
 */

public with sharing class PC_ResponseWrapper {

    public boolean result;
    public List<String> curseWords;

    public static PC_ResponseWrapper parse(String json){
        return (PC_ResponseWrapper) System.JSON.deserialize(json, PC_ResponseWrapper.class);
    }
}