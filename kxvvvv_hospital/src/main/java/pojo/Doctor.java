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
}

