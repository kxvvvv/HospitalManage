package pojo;
import lombok.Data;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Date;

@Data
public class Drug {
    Integer drugId;
    String drugName;
    String function;//详细信息
    String drugPrice;
    String inboundDate; //入库时间

    public Integer getDrugId() {
        return drugId;
    }

    public void setDrugId(Integer drugId) {
        this.drugId = drugId;
    }

    public String getDrugName() {
        return drugName;
    }

    public void setDrugName(String drugName) {
        this.drugName = drugName;
    }

    public String getDrugPrice() {
        return drugPrice;
    }

    public void setDrugPrice(String drugPrice) {
        this.drugPrice = drugPrice;
    }

    public String getInboundDate() {
        return inboundDate;
    }

    public void setInboundDate(String inboundDate) {
        this.inboundDate = inboundDate;
    }

    public String getExpirationDate() {
        return expirationDate;
    }

    public void setExpirationDate(String expirationDate) {
        this.expirationDate = expirationDate;
    }

    public int getStockQuantity() {
        return stockQuantity;
    }

    public void setStockQuantity(int stockQuantity) {
        this.stockQuantity = stockQuantity;
    }

    String expirationDate;//有效期
    int stockQuantity;//库存

    public Integer getDrug_id() {
        return drugId;
    }

    public void setDrug_id(Integer drug_id) {
        this.drugId = drug_id;
    }

    public String getDrug_name() {
        return drugName;
    }

    public void setDrug_name(String drug_name) {
        this.drugName = drug_name;
    }

    public String getFunction() {
        return function;
    }

    public void setFunction(String function) {
        this.function = function;
    }

    public String getDrug_price() {
        return drugPrice;
    }

    public void setDrug_price(String drug_price) {
        this.drugPrice = drug_price;
    }

    public int getStock_quantity() {
        return stockQuantity;
    }

    public void setStock_quantity(int stock_quantity) {
        this.stockQuantity = stock_quantity;
    }

}

