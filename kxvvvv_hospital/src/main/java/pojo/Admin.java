package pojo;
import lombok.Data;
//管理员
@Data
public class Admin {
    int adminId;
    int role;//默认为0：管理员
    String adminAcc;
    String adminPwd;
};

