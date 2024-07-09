package pojo;
import lombok.Data;

import java.time.LocalDateTime;

@Data
public class medRecord {
            Integer medical_record_id;
            Integer patient_id;
            Integer doctor_id;
            String gender;
            String age;
            String treatment_plan;
            LocalDateTime create_time;
            Integer drug_id;
            Integer reg_id;
            public medRecord(){};
            public  medRecord( Integer medical_record_id, Integer patient_id
           ,Integer doctor_id,String gender, String age,String treatment_plan,
                               LocalDateTime create_time, Integer drug_id, Integer reg_id){
                this.medical_record_id=medical_record_id;
                this.patient_id=patient_id;
                this.doctor_id=doctor_id;
                this.gender=gender;
                this.age=age;
                this.treatment_plan=treatment_plan;
                this.create_time=create_time;
                this.drug_id=drug_id;
                this.reg_id=reg_id;
            }
}
