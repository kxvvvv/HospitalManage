package mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import pojo.Drug;

public interface DrugMapper {

    // 插入药品
    int insertDrug(Drug drug);

    // 删除药品
    int deleteDrugById(Integer drugId);

    // 增加药品数量
    void increaseStockQuantity(@Param("drugId") Integer drugId, @Param("quantity") Integer quantity);
    // 减少药品数量
    void decreaseStockQuantity(@Param("drugId") Integer drugId, @Param("quantity") Integer quantity);

    // 根据drug_id查询药品
    Drug selectDrugById(Integer drugId);

    // 显示所有药品
    List<Drug> selectAllDrugs();

//    Drug selectDrugByPatientId(int patientId);
    // 根据drug_name查询药品
    Drug selectDrugByName(Integer drugName);
}