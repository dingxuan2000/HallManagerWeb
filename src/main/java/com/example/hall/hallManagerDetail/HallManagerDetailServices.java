package com.example.hall.hallManagerDetail;

import com.example.hall.services.Services;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@AllArgsConstructor
@Service
@Transactional
public class HallManagerDetailServices implements Services<HallManagerDetail> {

    @Autowired
    HallManagerDetailDao hallManagerDetailDao;

    @Override
    public HallManagerDetail save(HallManagerDetail hallManagerDetail){
        //需要以List形式一个个存起来
        hallManagerDetailDao.save(hallManagerDetail);
        return hallManagerDetail;
    }

    @Override
    public HallManagerDetail deleteById(Integer id){
        if(!hallManagerDetailDao.existsById(id)){
            System.out.println("NotFoundException: "+"id is not in the DB");
        }

        try{
            HallManagerDetail hallManagerDetail = hallManagerDetailDao.findById(id).orElse(null);
            hallManagerDetailDao.deleteById(id);
            return hallManagerDetail;
        }catch(Exception e){
            System.out.println("VehicleServiceValidationException");
            return null;
        }
    }

    @Override
    public HallManagerDetail updateById(Integer id, HallManagerDetail hallManagerDetail){
        if(!hallManagerDetailDao.existsById(id)){
            System.out.println("喜宴厅详细信息id没找到");
        }
        try{
            hallManagerDetail.setHall_detail_id(id);
            save(hallManagerDetail);
            return hallManagerDetail;
        }catch (RuntimeException e){
            return null;
        }
    }
}
