package com.example.hall.houseManager;

import com.example.hall.services.Services;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
    public HouseManager updateById(Integer anId, HouseManager anObj) {
        return null;
    }
}