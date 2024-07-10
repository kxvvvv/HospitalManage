package pojo;
import lombok.Data;

import java.time.LocalDate;
import java.util.Date;

@Data
public class Drug {
    Integer drug_id;
    String drug_name;
    String function;
    String drug_price;
    LocalDate inbound_date; //入库时间
    LocalDate expiration_date;//有效期
    String stock_quantity;//库存

    public Drug(Integer drug_id, String drug_name, String function, String drug_price, LocalDate inbound_date, LocalDate expiration_date, String stock_quantity, String frequency_use) {
        this.drug_id = drug_id;
        this.drug_name = drug_name;
        this.function = function;
        this.drug_price = drug_price;
        this.inbound_date = inbound_date;
        this.expiration_date = expiration_date;
        this.stock_quantity = stock_quantity;
    }

    public Integer getDrug_id() {
        return drug_id;
    }

    public void setDrug_id(Integer drug_id) {
        this.drug_id = drug_id;
    }

    public String getDrug_name() {
        return drug_name;
    }

    public void setDrug_name(String drug_name) {
        this.drug_name = drug_name;
    }

    public String getFunction() {
        return function;
    }

    public void setFunction(String function) {
        this.function = function;
    }

    public String getDrug_price() {
        return drug_price;
    }

    public void setDrug_price(String drug_price) {
        this.drug_price = drug_price;
    }

    public String getStock_quantity() {
        return stock_quantity;
    }

    public void setStock_quantity(String stock_quantity) {
        this.stock_quantity = stock_quantity;
    }

}

