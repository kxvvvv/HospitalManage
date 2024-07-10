package pojo;

import lombok.Data;
//科室
@Data
public class Section {
    Integer sec_id;
    Integer sec_doctor_id;
    String sec_name;
    String sec_inform;

    public Section(Integer sec_id, Integer sec_doctor_id, String sec_name, String sec_inform) {
        this.sec_id = sec_id;
        this.sec_doctor_id = sec_doctor_id;
        this.sec_name = sec_name;
        this.sec_inform = sec_inform;
    }

    public Integer getSec_id() {
        return sec_id;
    }

    public void setSec_id(Integer sec_id) {
        this.sec_id = sec_id;
    }

    public Integer getSec_doctor_id() {
        return sec_doctor_id;
    }

    public void setSec_doctor_id(Integer sec_doctor_id) {
        this.sec_doctor_id = sec_doctor_id;
    }

    public String getSec_name() {
        return sec_name;
    }

    public void setSec_name(String sec_name) {
        this.sec_name = sec_name;
    }

    public String getSec_inform() {
        return sec_inform;
    }

    public void setSec_inform(String sec_inform) {
        this.sec_inform = sec_inform;
    }
}
