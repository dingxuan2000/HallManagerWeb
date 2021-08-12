package com.example.hall.hallManagerDetail;

import com.example.hall.hallmanager.HallManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import javax.validation.constraints.NotNull;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class HallManagerDetailController {

    @Autowired
    private HallManagerDetailServices hallManagerDetailServices;

    @Autowired
    HallManagerDetailDao hallManagerDetailDao;

    @PostMapping(path="/addHallManagerDetail", produces = "application/json")
    public ResponseEntity<HallManagerDetail> addManagementDetail(@Valid @RequestBody HallManagerDetail hallManagerDetail){
        System.out.println("[add one hallDetail]");
        return new ResponseEntity<>(hallManagerDetailServices.save(hallManagerDetail), HttpStatus.CREATED);
    }

    @DeleteMapping(path="/deleteHallDetailbyid/{id}", produces = "application/json")
    public ResponseEntity<HallManagerDetail> deleteHallManagerDetailById(@PathVariable Integer id){
        System.out.println("[Delete one hall manager detail] parameters: "+ id);
        return new ResponseEntity<>(hallManagerDetailServices.deleteById(id), HttpStatus.OK);
    }

    @PutMapping(path="/updateHallDetailbyid/{id}", produces = "application/json")
    public ResponseEntity<HallManagerDetail> updateHallDetailById(@NotNull @PathVariable Integer id,
                                                      @Valid @RequestBody HallManagerDetail hallManagerDetail){
        //id is not match
        if(!id.equals(hallManagerDetail.getHall_detail_id())) {
            new ResponseEntity<>(null, HttpStatus.BAD_REQUEST);
        }
        System.out.println("喜宴厅详细信息修改成功");
        return new ResponseEntity<>(hallManagerDetailServices.updateById(id, hallManagerDetail), HttpStatus.CREATED);
    }

    @GetMapping("/hallManagerDetailGetAll")
    public Map<String, Object> getAll() {
        List all = hallManagerDetailDao.findAll();
//        JSONObject result = new JSONObject();
        Map<String, Object> result = new HashMap<>();
        try {
            System.out.println("data: " + all);
            result.put("code", "0");
            result.put("count",hallManagerDetailDao.count());
            result.put("data", all);
            result.put("msg", "Query OK!");
        } catch (Exception e) {
            result.put("code", "500");
            result.put("msg", "Query error!");
        }
        return result;
    }
}
