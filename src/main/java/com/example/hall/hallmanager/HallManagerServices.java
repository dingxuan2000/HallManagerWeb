package com.example.hall.hallmanager;

import com.example.hall.hallManagerDetail.HallManagerDetail;
import com.example.hall.hallManagerDetail.HallManagerDetailDao;
import com.example.hall.houseManager.HouseManager;
import com.example.hall.houseManager.HouseManagerDao;
import com.example.hall.services.Services;
import com.sun.tools.jconsole.JConsoleContext;
import com.sun.tools.jconsole.JConsolePlugin;
import javassist.NotFoundException;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@AllArgsConstructor
@Service
@Transactional
public class HallManagerServices {

    @Autowired
    HallManagerDao hallManagerDao;

    @Autowired
    HouseManagerDao houseManagerDao;

    @Autowired
    HallManagerDetailDao hallManagerDetailDao;



    public HallManager save(HallManager hallManager) {
        //hallManagerDao.save(hallManager);
        HallManager hallManager1 = new HallManager();
        System.out.println("test--catched hall name is: " + hallManager.getHall_name());
        hallManager1.setHall_name(hallManager.getHall_name());
        hallManager1.setHall_community(hallManager.getHall_community());
        hallManager1.setHall_house(hallManager.getHall_house());
        hallManager1.setHall_address(hallManager.getHall_address());
        hallManager1.setHall_area(hallManager.getHall_area());
        hallManager1.setHall_table_num(hallManager.getHall_table_num());
        hallManager1.setHall_deposit(hallManager.getHall_deposit());

        HallManager hallManager2 = hallManagerDao.save(hallManager1); //先save hallManager
        //to get the new created hall_id
        System.out.println("test--new created hall id is: " + hallManager2.getHall_id());//拿到id啦！

        //hallManager1.getHallManagerDetailList().add(hallManagerDetail);

        //print the list of hallDetail
        List<HallManagerDetail> list1 = hallManager.getHallManagerDetailList();
        for(int i = 0; i<list1.size(); i++){
            System.out.println("Total rows are--(shoudl be 2) " + list1.size());
            System.out.println(list1.get(i));
            HallManagerDetail hallManagerDetail = new HallManagerDetail(); //每次create一个新的hallDetail Object!
            hallManagerDetail.setHallManager(hallManager2); //赋值小表的hall_id
            //set each value to hallManagerDetail's data
            hallManagerDetail.setHall_detail_floor(list1.get(i).getHall_detail_floor());
            hallManagerDetail.setHall_detail_unit(list1.get(i).getHall_detail_unit());
            hallManagerDetail.setHall_detail_table_num(list1.get(i).getHall_detail_table_num());
            hallManagerDetail.setHall_detail_rent(list1.get(i).getHall_detail_rent());
            hallManagerDetail.setHall_detail_area(list1.get(i).getHall_detail_area());
            hallManagerDetailDao.save(hallManagerDetail);

        }

        return hallManager1;
    }


//    public HallManager deleteByName(String name) {
//
////        if(!hallManagerDao.existsById(id)){
////            System.out.println("NotFoundException: "+ "id is not in the DB");
////        }
//
//        try {
//            List<HallManager> hallManager = hallManagerDao.findByHallName(name);
//            HallManager atest = hallManager.get(0);
//            System.out.println("test JPARepository deleteByName: " + atest.toString());
//            hallManagerDao.deleteByHallName(name);
//            return atest;
//        }catch (Exception e){
//            System.out.println("VehicleServiceValidationException");
//            return null;
//        }
//
//
//    }


    public HallManager updateById(Integer id, HallManager hallManager) {
//        if(!hallManagerDao.existsById(id)){
//            System.out.println("喜宴厅id没找到");
//        }
//        try {
//            hallManager.setHall_id(id);
//            save(hallManager);
//            return hallManager;
//
//        }catch (RuntimeException e){
//            return null;
//        }
        return null;
    }

    public HouseManager findById(Integer id){
        if(!houseManagerDao.existsById(id)){
            System.out.println("该社区id没找到");
        }try{
            HouseManager houseManager = houseManagerDao.findById(id).orElse(null);
            return houseManager;

        }catch (Exception e){
            return null;
        }

    }


    public HallManager deleteById(Integer id){
        if(!hallManagerDao.existsById(id)){
            System.out.println("NotFoundException: "+"id is not in the DB");
        }

        try{
            HallManager hallManager = hallManagerDao.findById(id).orElse(null);
            hallManagerDao.deleteById(id);
            return hallManager;
        }catch(Exception e){
            System.out.println("VehicleServiceValidationException");
            return null;
        }
    }
}
