package pojo;

public class medRecord_Drug {
    Integer medical_record_id;
    Integer drug_id;

    public medRecord_Drug(Integer medical_record_id, Integer drug_id) {
        this.medical_record_id = medical_record_id;
        this.drug_id = drug_id;
    }

    public Integer getMedical_record_id() {
        return medical_record_id;
    }

    public void setMedical_record_id(Integer medical_record_id) {
        this.medical_record_id = medical_record_id;
    }

    public Integer getDrug_id() {
        return drug_id;
    }

    public void setDrug_id(Integer drug_id) {
        this.drug_id = drug_id;
    }
}
