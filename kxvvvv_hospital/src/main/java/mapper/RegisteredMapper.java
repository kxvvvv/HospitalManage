package mapper;
import pojo.*;

import java.time.LocalDateTime;

public interface RegisteredMapper {
    //挂号所需实现：新建挂号（要先查count（预约日期与时段）是否<20）是就新建，否就提示错误
    //更改状态，医生可以将0变为1（完成），病人可以将0变为2（取消）
    //挂号所需费用固定10元

    boolean canRegister(Integer docId, LocalDateTime appointmentDate, Integer timeframe);
    void insertRegistration(Registered registration);
    void changeStatusByDoctor(Integer registrationId);
    void changeStatusByPatient(Integer registrationId);
}
