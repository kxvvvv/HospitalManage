package pojo;

import lombok.Data;

import java.math.BigDecimal;
import java.time.LocalDateTime;

@Data
//评价
public class Rate {
    Integer rate_id;
    BigDecimal rating;
    String comment;
    Integer doc_id;
    Integer patient_id;
    Integer rate_state;
    LocalDateTime rate_date;

    public Rate(Integer rate_id, BigDecimal rating, String comment, Integer doc_id, Integer patient_id, Integer rate_state, LocalDateTime rate_date) {
        this.rate_id = rate_id;
        this.rating = rating;
        this.comment = comment;
        this.doc_id = doc_id;
        this.patient_id = patient_id;
        this.rate_state = rate_state;
        this.rate_date = rate_date;
    }

    public Integer getRate_id() {
        return rate_id;
    }

    public void setRate_id(Integer rate_id) {
        this.rate_id = rate_id;
    }

    public Integer getDoc_id() {
        return doc_id;
    }

    public void setDoc_id(Integer doc_id) {
        this.doc_id = doc_id;
    }

    public Integer getPatient_id() {
        return patient_id;
    }

    public void setPatient_id(Integer patient_id) {
        this.patient_id = patient_id;
    }
}
