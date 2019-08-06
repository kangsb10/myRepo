package kr.or.ddit.service.sensor;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.dao.sensor.ISensorDao;
import kr.or.ddit.dao.sfms.ISfmsDao;
import kr.or.ddit.vo.SensorVO;

@Service
public class ISensorServiceImpl implements ISensorService {

	@Autowired
	private ISensorDao dao;
	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public SensorVO sensorInfo(Map<String, String> params) throws Exception {
		return dao.sensorInfo(params);
	}

	@Transactional(propagation=Propagation.REQUIRED,rollbackFor={Exception.class})
	@Override
	public void inserSensor(SensorVO sensorInfo) throws Exception {
		dao.inserSensor(sensorInfo);
	}

	@Transactional(propagation=Propagation.REQUIRED,rollbackFor={Exception.class})
	@Override
	public int updateSensor(SensorVO sensorInfo) throws Exception {
		return dao.UpdateSensor(sensorInfo);
	}
	
	@Transactional(propagation=Propagation.REQUIRED,rollbackFor={Exception.class})
	@Override
	public void deleteSensor(Map<String, String> params) throws Exception {
		dao.deleteSensor(params);
	}
}
