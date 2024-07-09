package pojo;
import lombok.Data;
@Data
public class Patient {
    private String name;
    private String patient_pwd;
    private Integer role;
    private String address;
    private Integer patient_id;
    private String id;
    private Integer age;
    private String phone;
    private String patient_acc;
    private Integer balance;
    public Patient(){};
    public Patient(String name, String patient_pwd,Integer role,String address,
                   Integer patient_id,String id,Integer age,String phone,String patient_acc,Integer balance){
        this.name=name;
        this.patient_pwd=patient_pwd;
        this.role=role;
        this.address=address;
        this.patient_id=patient_id;
        this.id=id;
        this.age=age;
        this.phone=phone;
        this.patient_acc=patient_acc;
        this.balance=balance;
    }
}

