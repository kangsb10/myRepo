package kr.or.ddit.service.sensor;

import java.util.Map;

import kr.or.ddit.vo.SensorVO;

public interface ISensorService {
	public SensorVO sensorInfo(Map<String, String>params)throws Exception;
	public void inserSensor(SensorVO sensorInfo)throws Exception;
	public int updateSensor(SensorVO sensorInfo)throws Exception; 
	public void deleteSensor(Map<String , String>params)throws Exception;
}
