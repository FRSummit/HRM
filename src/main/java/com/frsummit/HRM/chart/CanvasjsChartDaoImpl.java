package com.frsummit.HRM.chart;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

@Service("canvasjsChartDao")
@Transactional
public class CanvasjsChartDaoImpl implements CanvasjsChartDao {
    @Override
    public List<List<Map<Object, Object>>> getCanvasjsChartData() {
        return CanvasjsChartData.getCanvasjsDataList();
    }
}
