package pojo;

import lombok.Data;

//管理员
@Data
public class Admin {
   private Integer adminId;
    private Integer role;//默认为0：管理员
    private String adminAcc;

    public Integer getAdminId() {
        return adminId;
    }

    public Integer getRole() {
        return role;
    }

    public String getAdminAcc() {
        return adminAcc;
    }

    public String getAdminPwd() {
        return adminPwd;
    }

    private String adminPwd;
    public Admin(){}
    public Admin(Integer adminId,Integer role,String adminAcc,String adminPwd){
        this.adminId=adminId;
        this.role=role;
        this.adminAcc=adminAcc;
        this.adminPwd=adminPwd;
    }
}


