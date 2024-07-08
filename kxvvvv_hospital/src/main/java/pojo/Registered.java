package pojo;
import lombok.Data;
import java.time.LocalDateTime;
@Data
//挂号
public class Registered {
    // 挂号ID
    Integer registrationId;

    // 医生ID
    Integer docId;

    // 病人ID
    Integer patientId;

    // 所需的费用
    String fee;

    // 挂号状态，例如“已挂号”0、“已完成”1、“已取消”2等
    Integer status;

    // 挂号发生的日期和时间
    LocalDateTime registrationTime;

    // 病人预约的就诊日期
    LocalDateTime appointmentDate;

    // 当前所预约时段(上下午)已有人数，20为满
    Integer peopleBefore;

    // 预约时段，0为上午，1为下午
    Integer timeframe;
public Registered(){}
    public Registered(Integer registrationId,Integer docId,
                      LocalDateTime appointmentDate,
                      Integer peopleBefore,  Integer timeframe,
                      Integer patientId, String fee,Integer status,LocalDateTime registrationTime){
    this.appointmentDate=appointmentDate;
    this.fee=fee;
    this.status=status;
    this.registrationId=registrationId;
    this.docId=docId;
    this.peopleBefore=peopleBefore;
    this.timeframe=timeframe;
    this.patientId=patientId;
    this.registrationTime=registrationTime;
    }


}
