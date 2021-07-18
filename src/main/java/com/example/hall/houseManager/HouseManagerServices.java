package com.example.hall.houseManager;

import com.example.hall.commManager.CommManager;
import com.example.hall.services.Services;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Map;

@AllArgsConstructor
@Service
@Transactional
public class HouseManagerServices implements Services<HouseManager> {

    @Autowired
    HouseManagerDao houseManagerDao;

    @Override
    public HouseManager save(HouseManager houseManager) {
        houseManagerDao.save(houseManager);
        return houseManager;
    }

    @Override
    public HouseManager deleteById(Integer id) {

        if(!houseManagerDao.existsById(id)){
            System.out.println("NotFoundException: "+ "id is not in the DB");
        }

        try {
            HouseManager houseManager = houseManagerDao.findById(id).orElse(null);
            houseManagerDao.deleteById(id);
            return houseManager;
        }catch (Exception e){
            System.out.println("VehicleServiceValidationException");
            return null;
        }


    }

    @Override

    public HouseManager updateById(Integer id, HouseManager houseManager) {
        if(!houseManagerDao.existsById(id)){
            System.out.println("订单管理id没找到");
        }
        try {
            houseManager.setHouse_id(id);
            save(houseManager);
            return houseManager;

        }catch (RuntimeException e){
            return null;
        }
    }

}