package mapper;
import org.apache.ibatis.annotations.Param;
import pojo.*;

import java.util.List;

public interface DoctorMapper {
    String doctorReg(String acc,String pwd);
    int doctorLogin(String acc,String pwd);//返回doc_id
    //ceshi00002
    List<Integer> selectAllDoctorId();//查询返回所有医生id
    List<Doctor> selectById(@Param("docIds") List<Integer> docIds);//根据多个id查询

    Doctor selectByAcc(String acc);//根据账号返回医生

}
