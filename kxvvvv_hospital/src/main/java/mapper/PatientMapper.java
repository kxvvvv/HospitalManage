package mapper;
import pojo.*;

import java.util.Map;

public interface PatientMapper {
    int patientRegister(Map<String,Object> map);//病人注册
    Integer patientLogin(Map<String,Object> map);//病人login，返回值为patient_id
    Integer doctorLogin(Map<String,Object> map);//返回doc_id
    Integer adminLogin(Map<String,Object> map);//返回admin_id



}
