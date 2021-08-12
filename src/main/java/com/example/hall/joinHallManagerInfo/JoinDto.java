package com.example.hall.joinHallManagerInfo;

public class JoinDto {

    private int hall_id;
    private String hall_name;
    private String hall_address;
    private String hall_house;
    private String hall_community;
    private String hall_detail_floor;
    private String hall_detail_unit;
    private int hall_detail_table_num;
    private double hall_detail_area;
    private double hall_detail_rent;

    public JoinDto(int hall_id, String hall_name, String hall_address, String hall_house, String hall_community, String hall_detail_floor, String hall_detail_unit, int hall_detail_table_num, double hall_detail_area, double hall_detail_rent) {
        this.hall_id = hall_id;
        this.hall_name = hall_name;
        this.hall_address = hall_address;
        this.hall_house = hall_house;
        this.hall_community = hall_community;
        this.hall_detail_floor = hall_detail_floor;
        this.hall_detail_unit = hall_detail_unit;
        this.hall_detail_table_num = hall_detail_table_num;
        this.hall_detail_area = hall_detail_area;
        this.hall_detail_rent = hall_detail_rent;
    }

    public int getHall_id() {
        return hall_id;
    }

    public void setHall_id(int hall_id) {
        this.hall_id = hall_id;
    }

    public String getHall_name() {
        return hall_name;
    }

    public void setHall_name(String hall_name) {
        this.hall_name = hall_name;
    }

    public String getHall_address() {
        return hall_address;
    }

    public void setHall_address(String hall_address) {
        this.hall_address = hall_address;
    }

    public String getHall_house() {
        return hall_house;
    }

    public void setHall_house(String hall_house) {
        this.hall_house = hall_house;
    }

    public String getHall_community() {
        return hall_community;
    }

    public void setHall_community(String hall_community) {
        this.hall_community = hall_community;
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

    public double getHall_detail_area() {
        return hall_detail_area;
    }

    public void setHall_detail_area(double hall_detail_area) {
        this.hall_detail_area = hall_detail_area;
    }

    public double getHall_detail_rent() {
        return hall_detail_rent;
    }

    public void setHall_detail_rent(double hall_detail_rent) {
        this.hall_detail_rent = hall_detail_rent;
    }
}
