package mapper;

import pojo.medRecord_Drug;

import java.util.List;
import java.util.Map;

public interface medRecord_DrugMapper {
    List<medRecord_Drug> selectpatientdrugByMid(Integer mid);

    void insertpatientanddrug(Map<String,Object> map);

}
