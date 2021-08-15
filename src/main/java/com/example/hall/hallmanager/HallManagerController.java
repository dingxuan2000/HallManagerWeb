package com.example.hall.hallmanager;

import com.example.hall.hallManagerDetail.HallManagerDetail;
import com.example.hall.hallManagerDetail.HallManagerDetailDao;
import com.example.hall.houseManager.HouseManager;
import com.example.hall.houseManager.HouseManagerDao;
import com.example.hall.houseManager.HouseManagerServices;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.Query;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

import org.springframework.test.annotation.Rollback;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import javax.validation.constraints.NotNull;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
public class HallManagerController {

    @Autowired
    private HallManagerServices hallManagerServices;

    @Autowired
    HallManagerDao hallManagerDao;

    @Autowired
    private HouseManagerServices houseManagerServices;

    @Autowired
    HouseManagerDao houseManagerDao;

    @Autowired
    HallManagerDetailDao hallManagerDetailDao;

    @PostMapping(path = "/addHallManager", produces = "application/json")
    public ResponseEntity<HallManager> addHallManagement(@Valid @RequestBody HallManager hallManager){
        System.out.println("[add one hall]");
        return new ResponseEntity<>(hallManagerServices.save(hallManager), HttpStatus.CREATED);

    }

    @GetMapping("/hallManagerGetAll")
    public Map<String, Object> getAll() {
        List all = hallManagerDao.findAll();
        Map<String, Object> result = new HashMap<>();
        try {
            System.out.println("data: " + all);
            result.put("code", "0");
            result.put("count",hallManagerDao.count());
            result.put("data", all);
            result.put("msg", "Query OK!");
        } catch (Exception e) {
            result.put("code", "500");
            result.put("msg", "Query error!");
        }
        //TEST
        System.out.println("TEST Return Hall Info: "+ result);
        return result;
    }

//    @GetMapping(path = "/findHallDetailById/{id}", produces = "application/json")
//    public ResponseEntity<HallManagerDetail> findHallDetailById(@PathVariable Integer id){
//        System.out.println("[find all hall detail info] parameters: " + id);
//        return new ResponseEntity<>(hallManagerServices.findById(id), HttpStatus.OK);
//    }


    @DeleteMapping(path="/deleteHallbyId/{id}", produces = "application/json")
    public ResponseEntity<HallManager> deleteHallManagerById(@PathVariable Integer id){
        System.out.println("[Delete one hall manager] parameters: "+ id);
        return new ResponseEntity<>(hallManagerServices.deleteById(id), HttpStatus.OK);
    }

    @PutMapping(path="/updateHallManager/{id}", produces = "application/json")
    public ResponseEntity<HallManager> updateHallManagerById(@NotNull @PathVariable Integer id,
                                               @Valid @RequestBody HallManager hallManager){
        //id is not match
        if(!id.equals(hallManager.getHall_id())) {
            new ResponseEntity<>(null, HttpStatus.BAD_REQUEST);
        }
        System.out.println("小区管理修改成功");
        return new ResponseEntity<>(hallManagerServices.updateById(id, hallManager), HttpStatus.CREATED);
    }



}
