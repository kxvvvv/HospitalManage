package mapper;
import pojo.*;

import java.util.List;

public interface medRecordMapper {
    //病历所需实现：医生添加病历（insert），用户与医生查看病历（select by p_id）
    //查药去病历与药品的关联表
    //开药也应该在关联表中开，开药时先insert出病历表再查出最新病历（group by 和limit 1）再在关联表中insert对应药品数量的行
    void insertMedRecord(medRecord record);
    List<medRecord> selectMedRecordByPid(Integer pid);
}
