package com.example.hall.hallmanager;

import com.example.hall.services.Services;
import javassist.NotFoundException;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@AllArgsConstructor
@Service
@Transactional
public class HallManagerServices implements Services<HallManager> {

    @Autowired
    HallManagerDao hallManagerDao;

    @Override
    public HallManager save(HallManager hallManager) {
        hallManagerDao.save(hallManager);
        return hallManager;
    }

    @Override
    public HallManager deleteById(Integer id) {

        if(!hallManagerDao.existsById(id)){
            System.out.println("NotFoundException: "+ "id is not in the DB");
        }

        try {
            HallManager hallManager = hallManagerDao.findById(id).orElse(null);
            hallManagerDao.deleteById(id);
            return hallManager;
        }catch (Exception e){
            System.out.println("VehicleServiceValidationException");
            return null;
        }


    }

    @Override
    public HallManager updateById(Integer id, HallManager hallManager) {
        if(!hallManagerDao.existsById(id)){
            System.out.println("订单管理id没找到");
        }
        try {
            hallManager.setHall_id(id);
            save(hallManager);
            return hallManager;

        }catch (RuntimeException e){
            return null;
        }
    }
}
