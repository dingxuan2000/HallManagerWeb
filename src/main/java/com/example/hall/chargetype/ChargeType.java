package com.example.hall.chargetype;



import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import javax.validation.constraints.NotNull;

@Entity
public class ChargeType {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO, generator = "native")
    @GenericGenerator(name = "native", strategy = "native")
    private Integer charge_id;

    @NotNull
    private String charge_name;

    @NotNull
    private String charge_unit;

    //------------------------Get Methods----------------
    public Integer getCharge_id() { return charge_id; }
    public String getCharge_name() {
        return charge_name;
    }
    public String getCharge_unit() {
        return charge_unit;
    }

    //------------------------Set Methods----------------
    public void setCharge_id(Integer charge_id) {
        this.charge_id = charge_id;
    }
    public void setCharge_name(String charge_name) {
        this.charge_name = charge_name;
    }
    public void setCharge_unit(String charge_unit) {
        this.charge_unit = charge_unit;
    }
}