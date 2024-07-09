package pojo;

import java.time.LocalDateTime;

//病例
public class medRecord {
    // 病历ID
    Integer medical_record_id;

    // 病人ID
    Integer patient_id;

    // 医生ID
    Integer doctor_id;

    // 性别
    String gender;

    // 年龄
    Integer age;

    // 治疗方案
    String treatment_plan;

    // 创建时间
    LocalDateTime create_time;

    // 该病例对应的挂号ID
    Integer reg_id;

    public medRecord(Integer medical_record_id, Integer patient_id, Integer doctor_id, String gender, Integer age, String treatment_plan, LocalDateTime create_time, Integer reg_id) {
        this.medical_record_id = medical_record_id;
        this.patient_id = patient_id;
        this.doctor_id = doctor_id;
        this.gender = gender;
        this.age = age;
        this.treatment_plan = treatment_plan;
        this.create_time = create_time;
        this.reg_id = reg_id;
    }

    public Integer getMedical_record_id() {
        return medical_record_id;
    }

    public void setMedical_record_id(Integer medical_record_id) {
        this.medical_record_id = medical_record_id;
    }

    public Integer getPatient_id() {
        return patient_id;
    }

    public void setPatient_id(Integer patient_id) {
        this.patient_id = patient_id;
    }

    public Integer getDoctor_id() {
        return doctor_id;
    }

    public void setDoctor_id(Integer doctor_id) {
        this.doctor_id = doctor_id;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public String getTreatment_plan() {
        return treatment_plan;
    }

    public void setTreatment_plan(String treatment_plan) {
        this.treatment_plan = treatment_plan;
    }

    public LocalDateTime getCreate_time() {
        return create_time;
    }

    public void setCreate_time(LocalDateTime create_time) {
        this.create_time = create_time;
    }

    public Integer getReg_id() {
        return reg_id;
    }

    public void setReg_id(Integer reg_id) {
        this.reg_id = reg_id;
    }
}
