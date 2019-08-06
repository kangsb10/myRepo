package kr.or.ddit.dao.sensor;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.vo.SensorVO;

@Repository
public class ISensorDaoImpl implements ISensorDao {

	@Autowired
	private SqlMapClient client;
	
	@Override
	public SensorVO sensorInfo(Map<String, String> params) throws Exception {
		return (SensorVO) client.queryForObject("sensor.sensorInfo", params);
	}

	@Override
	public void inserSensor(SensorVO sensorInfo) throws Exception {
		String sensor_no = (String) client.insert("sensor.insertsensor" , sensorInfo);
	}

	@Override
	public int UpdateSensor(SensorVO sensorInfo) throws Exception {
		return client.update("sensor.updateSensor", sensorInfo);
	}

	@Override
	public void deleteSensor(Map<String, String> params) throws Exception {
		client.delete("sensor.deleteSensor",params);
	}

}
