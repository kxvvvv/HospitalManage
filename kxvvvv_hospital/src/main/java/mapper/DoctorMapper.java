package mapper;
import pojo.*;
public interface DoctorMapper {
    String doctorReg(String acc,String pwd);
    String doctorLogin(String acc,String pwd);
}
