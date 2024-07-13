package mapper;

import pojo.Admin;
import pojo.Doctor;

import java.util.Map;

public interface AdminMapper {

    int adminLogin(String acc,String pwd);//返回doc_id
    Admin selectByAcc(String acc);
}
