package com.example.hall.hallmanager;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface HallManagerDao extends JpaRepository<HallManager, Integer> {
//    Long deleteByHallName(String hallName);
//    List<HallManager> findByHallName(String hallName);


}
