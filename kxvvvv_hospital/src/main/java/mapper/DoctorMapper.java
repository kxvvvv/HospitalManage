package mapper;
import pojo.*;
public interface DoctorMapper {
    String doctorReg(String acc,String pwd);
    int doctorLogin(String acc,String pwd);//返回doc_id
    //ceshi00002
}
