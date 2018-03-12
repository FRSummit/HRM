package com.frsummit.HRM.chart;

import java.util.Map;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class CanvasjsChartData {
    static Map<Object,Object> map = null;
    static List<List<Map<Object,Object>>> list = new ArrayList<List<Map<Object,Object>>>();
    static List<Map<Object,Object>> dataPoints1 = new ArrayList<Map<Object,Object>>();

    static {
        map = new HashMap<Object,Object>(); map.put("x", 1483209000000L); map.put("y", 7);dataPoints1.add(map);
        map = new HashMap<Object,Object>(); map.put("x", 1485887400000L); map.put("y", 6);dataPoints1.add(map);
        map = new HashMap<Object,Object>(); map.put("x", 1488306600000L); map.put("y", 6);dataPoints1.add(map);
        map = new HashMap<Object,Object>(); map.put("x", 1490985000000L); map.put("y", 9);dataPoints1.add(map);
        map = new HashMap<Object,Object>(); map.put("x", 1493577000000L); map.put("y", 11);dataPoints1.add(map);
        map = new HashMap<Object,Object>(); map.put("x", 1496255400000L); map.put("y", 14);dataPoints1.add(map);
        map = new HashMap<Object,Object>(); map.put("x", 1498847400000L); map.put("y", 17);dataPoints1.add(map);
        map = new HashMap<Object,Object>(); map.put("x", 1501525800000L); map.put("y", 18);dataPoints1.add(map);
        map = new HashMap<Object,Object>(); map.put("x", 1504204200000L); map.put("y", 17);dataPoints1.add(map);
        map = new HashMap<Object,Object>(); map.put("x", 1506796200000L); map.put("y", 15);dataPoints1.add(map);
        map = new HashMap<Object,Object>(); map.put("x", 1509474600000L); map.put("y", 12);dataPoints1.add(map);
        map = new HashMap<Object,Object>(); map.put("x", 1512066600000L); map.put("y", 9);dataPoints1.add(map);

        list.add(dataPoints1);
    }

    public static List<List<Map<Object, Object>>> getCanvasjsDataList() {
        return list;
    }
}
