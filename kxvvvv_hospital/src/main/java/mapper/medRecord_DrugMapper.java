package mapper;

import pojo.medRecord_Drug;

import java.util.List;

public interface medRecord_DrugMapper {
    List<medRecord_Drug> selectpatientdrugByMid(Integer pid);

    void insertpatientanddrug(medRecord_Drug medRecord_drug);

}
