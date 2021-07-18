package com.example.hall.houseManager;


import com.example.hall.commManager.CommManager;
import com.example.hall.commManager.CommManagerDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import javax.validation.constraints.NotNull;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
public class HouseManagerController {

    @Autowired
    CommManagerDao commManagerDao;

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
            result.put("code", "500");
            result.put("msg", "Query error!");
        }
        return result;
    }

    //http://localhost:8080/updatebyid/{id}
    @PutMapping(path="/updateHouseManager/{id}", produces = "application/json")
    public ResponseEntity<HouseManager> updateHouseManagerById(@NotNull @PathVariable Integer id,
                                                             @Valid @RequestBody HouseManager houseManager){
        //id is not match
        if(!id.equals(houseManager.getHouse_id())) {
            new ResponseEntity<>(null, HttpStatus.BAD_REQUEST);
        }
        System.out.println("小区修改成功");
        return new ResponseEntity<>(houseManagerServices.updateById(id, houseManager), HttpStatus.CREATED);
    }


    @GetMapping("/getCommList")
    public List getCommList(){
        List commList = commManagerDao.findAll();
        System.out.println("returned all data is: " + commList);
        return commList;
    }

}
