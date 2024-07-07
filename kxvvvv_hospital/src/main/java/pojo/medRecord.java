package pojo;

import java.time.LocalDateTime;

//病例
public class medRecord {
    // 病历ID
    private Integer medicalRecordId;

    // 病人ID
    private Integer patientId;

    // 医生ID
    private Integer doctorId;

    // 性别
    private String gender;

    // 年龄
    private String age;

    // 治疗方案
    private String treatmentPlan;

    // 创建时间
    private LocalDateTime createTime;

    // 药品ID
    private Integer drugId;

    // 该病例对应的挂号ID
    private Integer regId;
}
