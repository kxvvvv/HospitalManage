package pojo;

import lombok.Data;
//科室
@Data
public class Section {
    Integer sec_id;
    Integer sec_doctor_id;
    String sec_name;
    String sec_inform;

    public Section() {
    }

    public Section(Integer sec_id,
                   String sec_inform,
                   Integer sec_doctor_id,
                   String sec_name) {
        this.sec_doctor_id=sec_doctor_id;
        this.sec_id=sec_id;
        this.sec_inform=sec_inform;
        this.sec_name=sec_name;
    }

}
