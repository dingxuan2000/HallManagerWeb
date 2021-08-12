package com.example.hall.joinHallManagerInfo;

import com.example.hall.hallmanager.HallManager;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface JoinRepository extends JpaRepository <HallManager, Integer>{

//    String QueryStr = "select *" +
//        "from hall_manager hm, hall_manager_detail hd" +
//        "where hd.hall_id=hall_manager.hall_id";
    @Query("SELECT new com.example.hall.joinHallManagerInfo.JoinDto(hm.hall_id, hm.hall_name, hm.hall_community, " +
            "hm.hall_house, hm.hall_address, hd.hall_detail_floor, hd.hall_detail_unit, hd.hall_detail_table_num, hd.hall_detail_rent, hd.hall_detail_area) " +
            "FROM HallManager hm, HallManagerDetail hd " +
            "WHERE hd.hallManager.hall_id = hm.hall_id")
    List<JoinDto> fetchByQuery();
}
