package com.example.hall.hallmanager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import javax.validation.constraints.NotNull;

@RestController
public class HallManagerController {

    @Autowired
    private HallManagerServices hallManagerServices;

    @PostMapping(path="/addHallManager", produces = "application/json")
    public ResponseEntity<HallManager> addManagement(@Valid @RequestBody HallManager hallManager){
        System.out.println("[add one hall]");
        return new ResponseEntity<>(hallManagerServices.save(hallManager), HttpStatus.CREATED);
    }

    @DeleteMapping(path="/deletebyid/{id}", produces = "application/json")
    public ResponseEntity<HallManager> deleteHallManagerById(@PathVariable Integer id){
        System.out.println("[Delete one hall manager] parameters: "+ id);
        return new ResponseEntity<>(hallManagerServices.deleteById(id), HttpStatus.OK);
    }

    //http://localhost:8080/updatebyid/{id}
    @PutMapping(path="/updatebyid/{id}", produces = "application/json")
    public ResponseEntity<HallManager> updateGoodById(@NotNull @PathVariable Integer id,
                                               @Valid @RequestBody HallManager hallManager){
        //id is not match
        if(!id.equals(hallManager.getHall_id())) {
            new ResponseEntity<>(null, HttpStatus.BAD_REQUEST);
        }
        System.out.println("小区管理修改成功");
        return new ResponseEntity<>(hallManagerServices.updateById(id, hallManager), HttpStatus.CREATED);
    }



}
