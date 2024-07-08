package pojo;

import java.time.LocalDateTime;

//病例
public class medRecord {
    // 病历ID
    Integer medicalRecordId;

    // 病人ID
    Integer patientId;

    // 医生ID
    Integer doctorId;

    // 性别
    String gender;

    // 年龄
    String age;

    // 治疗方案
    String treatmentPlan;

    // 创建时间
    LocalDateTime createTime;

    // 该病例对应的挂号ID
    Integer regId;
}
