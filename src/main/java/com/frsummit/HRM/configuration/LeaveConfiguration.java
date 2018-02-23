package com.frsummit.HRM.configuration;

import java.util.HashMap;
import java.util.Map;

public class LeaveConfiguration {

    public void mapForRole(String myRole, String myChain){
        String nextRole;
        Map<String, String> myMap = new HashMap<>();
        myMap.put(myRole, myChain);

        System.out.println("-------------------------");
        for(Map.Entry<String,String> entry : myMap.entrySet()){
            System.out.println("Role : " + entry.getKey() + "\n" + "Chain : " + entry.getValue());
            if(entry.getKey().equalsIgnoreCase(myRole)){
                String[] parts = entry.getValue().split(" ");
                for(int i=0; i<parts.length; i++){
                    System.out.println("Step " + i + " = " + parts[i]);
                }
                nextRole = parts[0];
                System.out.println("Next Role is : " + nextRole);
            }
        }
    }

    public String mapForNextRole(String myRole, String myChain){
        String nextRole = new String();
        Map<String, String> myMap = new HashMap<>();
        myMap.put(myRole, myChain);
        for(Map.Entry<String,String> entry : myMap.entrySet()){
            if(entry.getKey().equalsIgnoreCase(myRole)){
                String[] parts = entry.getValue().split(" ");
                nextRole = parts[0];
            }
        }
        return nextRole;
    }
    //working
}
