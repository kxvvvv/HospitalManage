package pojo;

//管理员

public class Admin {
   private Integer adminId;
    private Integer role;//默认为0：管理员
    private String adminAcc;
    private String adminPwd;
    public Admin(){}
    public Admin(Integer adminId,Integer role,String adminAcc,String adminPwd){
        this.adminId=adminId;
        this.role=role;
        this.adminAcc=adminAcc;
        this.adminPwd=adminPwd;
    }
}


