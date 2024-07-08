package pojo;
import lombok.Data;

import java.util.Date;

@Data
public class Drug {
    Integer drug_id;
    String drug_name;
    String function;
    String drug_price;
    Date inbound_date; //入库时间
    Date expiration_date;//有效期
    String stock_quantity;//库存
    String frequency_use;//使用频率
    public Drug(){};
    public Drug(Integer drug_id,String function,
                String drug_price,
                Date inbound_date,
                Date expiration_date,
                String stock_quantity,
                String frequency_use ){
        this.drug_id=drug_id;
        this.function=function;
        this.drug_price=drug_price;
        this.inbound_date=inbound_date;
        this.expiration_date=expiration_date;
        this.stock_quantity=stock_quantity;
        this.frequency_use=frequency_use;
    }
}

