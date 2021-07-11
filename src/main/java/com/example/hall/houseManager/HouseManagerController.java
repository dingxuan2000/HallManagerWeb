package com.example.hall.houseManager;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
public class HouseManagerController {

    @Autowired
    private HouseManagerServices houseManagerServices;

    @PostMapping(path="/addHouseManager", produces = "application/json")
    public ResponseEntity<HouseManager> addManagement(@Valid @RequestBody HouseManager houseManager){
        System.out.println("[add one houseManager]");
        return new ResponseEntity<>(houseManagerServices.save(houseManager), HttpStatus.CREATED);
    }

    @DeleteMapping(path="/deleteHouseManager/{id}", produces = "application/json")
    public ResponseEntity<HouseManager> deleteHouseManagerById(@PathVariable Integer id){
        System.out.println("[Delete one hall manager] parameters: "+ id);
        return new ResponseEntity<>(houseManagerServices.deleteById(id), HttpStatus.OK);
    }

    @Autowired
    HouseManagerDao houseManagerDao;

    @GetMapping("/houseManagerGetAll")
    public Map<String, Object> getAll() {
        System.out.println("error");
        List all = houseManagerDao.findAll();
//        JSONObject result = new JSONObject();
        Map<String, Object> result = new HashMap<>();
        try {
            System.out.println("data: " + all);
            result.put("code", "0");
            result.put("count",houseManagerDao.count());
            result.put("data", all);
            result.put("msg", "Query OK!");
        } catch (Exception e) {
            System.out.println("error");
            result.put("code", "500");
            result.put("msg", "Query error!");
        }
        return result;
    }

}
