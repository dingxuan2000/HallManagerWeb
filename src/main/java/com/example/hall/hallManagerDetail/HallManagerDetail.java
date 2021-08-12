package com.example.hall.hallManagerDetail;


import com.example.hall.hallmanager.HallManager;
import com.fasterxml.jackson.annotation.JsonBackReference;
import lombok.Data;
import lombok.ToString;
import org.hibernate.annotations.GenericGenerator;
import org.springframework.context.annotation.EnableMBeanExport;

import javax.persistence.*;
import javax.validation.constraints.NotNull;

@Data
@ToString(exclude={"hallManager"})
@Entity
@Table(name = "hall_manager_detail")
public class HallManagerDetail {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "hall_detail_id")
    private int hall_detail_id;

    @Column(name = "hall_detail_floor")
    private String hall_detail_floor;

    @Column(name = "hall_detail_unit")
    private String hall_detail_unit;

    @Column(name = "hall_detail_table_num")
    private int hall_detail_table_num;

    @Column(name = "hall_detail_rent")
    private double hall_detail_rent;

    @Column(name = "hall_detail_area")
    private double hall_detail_area;


    //喜宴厅信息，建立多对一的关系，多条喜宴厅详细信息对应一个喜宴厅id
    //JoinColumn:用于定义主键字段和外键字段的对应关系, 设置在hall_manager表中的关联外键
    //JsonBackReference: fixed to get Jackson to be able to handle bi-directional references.
    //it maps the owning side of the relationship
    @ManyToOne
    @JoinColumn(name = "hall_id")
    @JsonBackReference
    private HallManager hallManager;

    public Integer getHall_detail_id() {
        return hall_detail_id;
    }

    public void setHall_detail_id(Integer hall_detail_id) {
        this.hall_detail_id = hall_detail_id;
    }

    public String getHall_detail_floor() {
        return hall_detail_floor;
    }

    public void setHall_detail_floor(String hall_detail_floor) {
        this.hall_detail_floor = hall_detail_floor;
    }

    public String getHall_detail_unit() {
        return hall_detail_unit;
    }

    public void setHall_detail_unit(String hall_detail_unit) {
        this.hall_detail_unit = hall_detail_unit;
    }

    public int getHall_detail_table_num() {
        return hall_detail_table_num;
    }

    public void setHall_detail_table_num(int hall_detail_table_num) {
        this.hall_detail_table_num = hall_detail_table_num;
    }

    public double getHall_detail_rent() {
        return hall_detail_rent;
    }

    public void setHall_detail_rent(double hall_detail_rent) {
        this.hall_detail_rent = hall_detail_rent;
    }

    public double getHall_detail_area() {
        return hall_detail_area;
    }

    public void setHall_detail_area(double hall_detail_area) {
        this.hall_detail_area = hall_detail_area;
    }

//    public int getHall_id() {
//        return hall_id;
//    }
//
//    public void setHall_id(int hall_id) {
//        this.hall_id = hall_id;
//    }
    public HallManager getHallManager(){
        return hallManager;
    }

    public void setHallManager(HallManager hallManager){
        this.hallManager = hallManager;
    }
}
