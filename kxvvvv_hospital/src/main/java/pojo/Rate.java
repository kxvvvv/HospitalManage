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

    public Rate() {
    }

    public Rate(Integer rate_id, BigDecimal rating, String comment,
                Integer doc_id, Integer patient_id,
                Integer rate_state,LocalDateTime rate_date) {
        this.rate_id=rate_id;
        this.rating=rating;
        this.comment=comment;
        this.doc_id=doc_id;
        this.patient_id=patient_id;
        this.rate_state=rate_state;
        this.rate_date=rate_date;
    }

}
