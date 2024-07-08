package mapper;
import pojo.*;

import java.util.Map;

public interface PatientMapper {
    int patientRegister(Map<String,Object> map);//病人注册
    int patientLogin(Map<String,Object> map);//三种身份通用的login，返回值为role值，据此判断登陆用户权限

}
