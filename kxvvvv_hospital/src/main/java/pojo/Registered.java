package pojo;

import com.alibaba.fastjson.annotation.JSONField;
import com.google.gson.TypeAdapter;
import com.google.gson.stream.JsonReader;
import com.google.gson.stream.JsonWriter;

import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

//挂号
public class Registered {
    public static class LocalDateTypeAdapter extends TypeAdapter<LocalDate> {
        private final DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");

        @Override
        public void write(JsonWriter out, LocalDate date) throws IOException {
            out.value(date.format(formatter));
        }

        @Override
        public LocalDate read(JsonReader in) throws IOException {
            return LocalDate.parse(in.nextString(), formatter);
        }
    }
    public static class LocalDateTimeTypeAdapter extends TypeAdapter<LocalDateTime> {
        private final DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");

        @Override
        public void write(JsonWriter out, LocalDateTime dateTime) throws IOException {
            out.value(dateTime.format(formatter));
        }

        @Override
        public LocalDateTime read(JsonReader in) throws IOException {
            return LocalDateTime.parse(in.nextString(), formatter);
        }
    }
    // 挂号ID
    Integer registrationId;

    // 医生ID
    Integer docId;

    // 病人ID
    Integer patientId;
    String patientName;

    // 所需的费用
    String fee;

    // 挂号状态，例如“已挂号”0、“已完成”1、“已取消”2等
    Integer status;

    // 挂号发生的日期和时间
    @JSONField(format = "yyyy-MM-dd HH:mm:ss")
    LocalDateTime registrationTime;

    // 病人预约的就诊日期
    @JSONField(format = "yyyy-MM-dd")
    LocalDate appointmentDate;

    // 预约时段，0为上午，1为下午
    Integer timeframe;

    public String getPatient_name() {
        return patientName;
    }

    public Registered(Integer registration_id, Integer doc_id, Integer patient_id, String fee, Integer status, LocalDateTime registration_time, LocalDate appointment_date, Integer timeframe, String patient_name) {
        this.registrationId = registration_id;
        this.docId = doc_id;
        this.patientId = patient_id;
        this.patientName = patient_name;
        this.fee = fee;
        this.status = status;
        this.registrationTime = registration_time;
        this.appointmentDate = appointment_date;
        this.timeframe = timeframe;

    }

    public Integer getRegistration_id() {
        return registrationId;
    }

    public void setRegistration_id(Integer registration_id) {
        this.registrationId = registration_id;
    }

    public Registered(Integer doc_id, LocalDate appointment_date, Integer timeframe) {
        this.docId = doc_id;
        this.appointmentDate = appointment_date;
        this.timeframe = timeframe;
    }

    public Integer getDoc_id() {
        return docId;
    }

    public void setDoc_id(Integer doc_id) {
        this.docId = doc_id;
    }

    public LocalDate getAppointment_date() {
        return appointmentDate;
    }

    public void setAppointment_date(LocalDate appointment_date) {
        this.appointmentDate = appointment_date;
    }

    public Integer getTimeframe() {
        return timeframe;
    }

    public void setTimeframe(Integer timeframe) {
        this.timeframe = timeframe;
    }
}
