package pojo;

import java.time.LocalDate;
import java.time.LocalDateTime;

//挂号
public class Registered {
    // 挂号ID
    Integer registration_id;

    // 医生ID
    Integer doc_id;

    // 病人ID
    Integer patient_id;

    // 所需的费用
    String fee;

    // 挂号状态，例如“已挂号”0、“已完成”1、“已取消”2等
    Integer status;

    // 挂号发生的日期和时间
    LocalDateTime registration_time;

    // 病人预约的就诊日期
    LocalDate appointment_date;

    // 当前所预约时段(上下午)已有人数，20为满
    Integer people_before;

    // 预约时段，0为上午，1为下午
    Integer timeframe;

    public Registered(Integer registration_id, Integer doc_id, Integer patient_id, String fee, Integer status, LocalDateTime registration_time, LocalDate appointment_date, Integer people_before, Integer timeframe) {
        this.registration_id = registration_id;
        this.doc_id = doc_id;
        this.patient_id = patient_id;
        this.fee = fee;
        this.status = status;
        this.registration_time = registration_time;
        this.appointment_date = appointment_date;
        this.people_before = people_before;
        this.timeframe = timeframe;
    }

    public Integer getRegistration_id() {
        return registration_id;
    }

    public void setRegistration_id(Integer registration_id) {
        this.registration_id = registration_id;
    }

    public Registered(Integer doc_id, LocalDate appointment_date, Integer timeframe) {
        this.doc_id = doc_id;
        this.appointment_date = appointment_date;
        this.timeframe = timeframe;
    }

    public Integer getDoc_id() {
        return doc_id;
    }

    public void setDoc_id(Integer doc_id) {
        this.doc_id = doc_id;
    }

    public LocalDate getAppointment_date() {
        return appointment_date;
    }

    public void setAppointment_date(LocalDate appointment_date) {
        this.appointment_date = appointment_date;
    }

    public Integer getTimeframe() {
        return timeframe;
    }

    public void setTimeframe(Integer timeframe) {
        this.timeframe = timeframe;
    }
}
