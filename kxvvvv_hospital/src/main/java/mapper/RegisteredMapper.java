package mapper;
import org.apache.ibatis.annotations.Param;
import pojo.Registered;

import java.time.LocalDate;
import java.util.Map;

public interface RegisteredMapper {
    //挂号所需实现：新建挂号（要先查count（预约日期与时段）是否<20）是就新建，否就提示错误
    //更改状态，医生可以将0变为1（完成），病人可以将0变为2（取消）
    //挂号所需费用固定10元

    int countRegister(@Param("doc_id") Integer doc_id, @Param("appointment_date") LocalDate appointment_date, @Param("timeframe") Integer timeframe);
    int insertRegistration(Map<String ,Object> map);
//    void changeStatusByDoctor1(Integer registration_id);
//    void changeStatusByDoctor2(Integer registration_id);
}
