package com.example.hall.hallmanager;

import com.example.hall.hallManagerDetail.HallManagerDetail;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import lombok.Data;
import lombok.ToString;
import org.hibernate.annotations.GenericGenerator;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.util.List;

@Data
@Entity
@ToString(exclude={"hallManagerDetailList"})
@Table(name = "hall_manager")
public class HallManager {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "hall_id")
    private Integer hall_id;

    @Column(name = "hall_name")
    private String hall_name;

    @Column(name = "hall_community")
    private String hall_community;

    @Column(name = "hall_house")
    private String hall_house;

    @Column(name = "hall_address")
    private String hall_address;

    @Column(name = "hall_area")
    private double hall_area;

    @Column(name = "hall_table_num")
    private int hall_table_num;

    @Column(name = "hall_deposit")
    private double hall_deposit;

    //喜宴厅详细列表, 建立一对多的关系，一个喜宴厅对应多条喜宴厅详细信息
    //JoinColumn:用于定义主键字段和外键字段的对应关系,和mappedBy是对立关系。
    //一对多的关系，外键总是建立在多的一方(hallManagerDetail),用到JoinColumn,
    //而mappedBy存在相反的一方(hallManager)，mappedBy中的hallManager是指HallManagerDetail实体中的hallManager属性
    //JsonManagedReference: is used to annotate the inverse side.
    @OneToMany(mappedBy = "hallManager", cascade = CascadeType.ALL)
    @JsonManagedReference
    private List<HallManagerDetail> hallManagerDetailList;



    //------------------------Get Methods----------------
    public Integer getHall_id() { return hall_id; }
    public String getHall_name() {
        return hall_name;
    }
    public String getHall_community() {
        return hall_community;
    }
    public String getHall_house() {
        return hall_house;
    }
    public String getHall_address() {
        return hall_address;
    }
    public Double getHall_area() {
        return hall_area;
    }
    public Integer getHall_table_num() {
        return hall_table_num;
    }
    public Double getHall_deposit() {
        return hall_deposit;
    }
    public List<HallManagerDetail> getHallManagerDetailList(){return hallManagerDetailList;}


    //------------------------Set Methods----------------
   public void setHall_id(Integer hall_id) { this.hall_id = hall_id; }
    public void setHall_name(String hall_name) {
        this.hall_name = hall_name;
    }
    public void setHall_community(String hall_community ) { this.hall_community = hall_community; }
    public void setHall_house(String hall_house) { this.hall_house = hall_house; }
    public void setHall_address(String hall_address) {
        this.hall_address = hall_address;
    }
    public void setHall_area(Double hall_area) {
        this.hall_area = hall_area;
    }
    public void setHall_table_num(Integer hall_table_num) { this.hall_table_num = hall_table_num; }
    public void setHall_deposit(Double hall_deposit) { this.hall_deposit = hall_deposit; }
    public void setHallManagerDetailList(List<HallManagerDetail> hallManagerDetailList){this.hallManagerDetailList = hallManagerDetailList;}

}
