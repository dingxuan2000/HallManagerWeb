package com.example.hall.chargetype;


import com.example.hall.services.Services;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@AllArgsConstructor
@Service
@Transactional
public class ChargeTypeServices implements Services<ChargeType> {

    @Autowired
    ChargeTypeDao chargeTypeDao;

    @Override
    public ChargeType save(ChargeType chargeType) {
        chargeTypeDao.save(chargeType);
        return chargeType;
    }


    @Override
    public ChargeType deleteById(Integer id) {

        if(!chargeTypeDao.existsById(id)){
            System.out.println("NotFoundException: "+ "id is not in the DB");
        }

        try {
            ChargeType chargeType = chargeTypeDao.findById(id).orElse(null);
            chargeTypeDao.deleteById(id);
            return chargeType;
        }catch (Exception e){
            System.out.println("VehicleServiceValidationException");
            return null;
        }


    }

    @Override
    public ChargeType updateById(Integer anId, ChargeType anObj) {
        return null;
    }


}

