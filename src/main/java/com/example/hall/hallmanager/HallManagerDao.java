package com.example.hall.hallmanager;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface HallManagerDao extends JpaRepository<HallManager, Integer> {
//    Long deleteByHallName(String hallName);
//    List<HallManager> findByHallName(String hallName);

//String QueryStr = "select *" +
//        "from hall_manager hm, hall_manager_detail hd" +
//        "where hd.hall_id=hall_manager.hall_id";
//    @Query(QueryStr)
//    List<HallManager> findByQuery();

}
