package pojo;
import lombok.Data;
@Data
public class Doctor {
    Integer docId;
    String name;
    String docPwd;//密码
    String docAcc;//账号
    Integer role;
    Integer sectionId;//所属科室id
    String phone;
    String major;//主治专业
    String job;//职称
    String degree;//学历
    Integer regFee;//挂号费用
    //测试00001
    public Doctor(){};
    public Doctor(Integer docId,String docPwd,String docAcc,Integer role, Integer sectionId,String phone,
                  String major,String job,String degree,Integer regFee){
        this.docId=docId;
        this.docPwd=docPwd;
        this.docAcc=docAcc;
        this.role=role;
        this.sectionId=sectionId;
        this.phone=phone;
        this.major=major;
        this.job=job;
        this.degree=degree;
        this.regFee=regFee;
    }
}

