package pojo;
import lombok.Data;
@Data
public class Patient {
    private String name;
    private String patient_pwd;
    private Integer role;
    private String address;
    private Integer patientId;
    private String id;
    private Integer age;
    private String phone;

    public String getName() {
        return name;
    }

    public String getPatient_pwd() {
        return patient_pwd;
    }

    public Integer getRole() {
        return role;
    }

    public String getAddress() {
        return address;
    }

    public Integer getPatient_id() {
        return patientId;
    }

    public String getId() {
        return id;
    }

    public Integer getAge() {
        return age;
    }

    public String getPhone() {
        return phone;
    }

    public String getPatient_acc() {
        return patient_acc;
    }

    public Integer getBalance() {
        return balance;
    }

    private String patient_acc;
    private Integer balance;
    public Patient(){};
    public Patient(String name, String patient_pwd,Integer role,String address,
                   Integer patient_id,String id,Integer age,String phone,String patient_acc,Integer balance){
        this.name=name;
        this.patient_pwd=patient_pwd;
        this.role=role;
        this.address=address;
        this.patientId=patient_id;
        this.id=id;
        this.age=age;
        this.phone=phone;
        this.patient_acc=patient_acc;
        this.balance=balance;
    }
}

