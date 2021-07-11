package com.example.hall.commManager;

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

@RestController
public class CommManagerController {

    @Autowired
    CommManagerDao commManagerDao;

    @Autowired
    private CommManagerServices commManagerServices;

    @GetMapping("/getCommManager")
    public Map<String, Object> getAll() {
        List all = commManagerDao.findAll();
//        JSONObject result = new JSONObject();
        Map<String, Object> result = new HashMap<>();
        try {
            System.out.println("data: " + all);
            result.put("code", "0");
            result.put("count", commManagerDao.count());
            result.put("data", all);
            result.put("msg", "Query OK!");
        } catch (Exception e) {
            result.put("code", "500");
            result.put("msg", "Query error!");
        }
        return result;
    }

    @PostMapping(path = "/addCommManager", produces = "application/json")
    public ResponseEntity<CommManager> addManagement(@Valid @RequestBody CommManager commManager){
        System.out.println("[add one comm]");
        return new ResponseEntity<>(commManagerServices.save(commManager), HttpStatus.CREATED);
    }

    @DeleteMapping(path = "/deleteCommManager/{id}", produces = "application/json")
    public ResponseEntity<CommManager> deleteCommManagerById(@PathVariable Integer id){
        System.out.println("[Delete one comm manager] parameters: "+id);
        return new ResponseEntity<>(commManagerServices.deleteById(id), HttpStatus.OK);
    }

    //http://localhost:8080/updatebyid/{id}
    @PutMapping(path="/updateCommManager/{id}", produces = "application/json")
    public ResponseEntity<CommManager> updateCommManagerById(@NotNull @PathVariable Integer id,
                                                      @Valid @RequestBody CommManager commManager){
        //id is not match
        if(!id.equals(commManager.getComm_id())) {
            new ResponseEntity<>(null, HttpStatus.BAD_REQUEST);
        }
        System.out.println("社区修改成功");
        return new ResponseEntity<>(commManagerServices.updateById(id, commManager), HttpStatus.CREATED);
    }


}
