package com.example.hall.freemarker;

import com.example.hall.chargetype.ChargeType;
import com.example.hall.chargetype.ChargeTypeDao;

import com.example.hall.commManager.CommManager;
import com.example.hall.commManager.CommManagerDao;
import com.example.hall.hallManagerDetail.HallManagerDetail;
import com.example.hall.hallManagerDetail.HallManagerDetailDao;
import com.example.hall.hallmanager.HallManager;
import com.example.hall.hallmanager.HallManagerDao;
import com.example.hall.houseManager.HouseManager;
import com.example.hall.houseManager.HouseManagerDao;

import com.example.hall.mysql.User;
import com.example.hall.mysql.UserDao;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class FreeMarkerController {

    @Autowired
    private UserDao userDao;

    @Autowired
    private CommManagerDao commManagerDao;

    @Autowired
    private ChargeTypeDao chargeTypeDao;

    @Autowired
    private HouseManagerDao houseManagerDao;

    @Autowired
    private HallManagerDao hallManagerDao;

    @Autowired
    private HallManagerDetailDao hallManagerDetailDao;


    @GetMapping("/index")
    public String index(ModelMap map){
        List<User> userList = userDao.findAll();
        map.put("userList1", userList);
        return "/index/index";
    }

    @GetMapping("/commManager")
    public String index2(ModelMap map){
        List<CommManager> commManagerList = commManagerDao.findAll();
        map.put("commManagerList", commManagerList);
        return "/index/commManager";
    }


    @GetMapping("/charge")
    public String index3(ModelMap map){
        List<ChargeType> chargeTypeList = chargeTypeDao.findAll();
        map.put("chargeTypeList", chargeTypeList);
        return "/index/charge";
    }

    @GetMapping("/houseManager")
    public String index4(ModelMap map){
        //List<HouseManager> houseManagerList = houseManagerDao.findAll();
        List<CommManager> commManagerList = commManagerDao.findAll();
        map.put("commManagerList", commManagerList);
        //map.put("houseManagerList", houseManagerList);
        return "/index/houseManager";
    }


    @GetMapping("/hallManager")
    public String index5(ModelMap map){
//        List<HallManager> hallManagerList = hallManagerDao.findAll();
//        map.put("hallManagerList", hallManagerList);
        List<CommManager> commManagerList = commManagerDao.findAll();
        map.put("commManagerList", commManagerList);
        List<HouseManager> houseManagerList = houseManagerDao.findAll();
        map.put("houseManagerList", houseManagerList);
        List<HallManagerDetail> hallManagerDetailList = hallManagerDetailDao.findAll();
        map.put("hallManagerDetailList", hallManagerDetailList);
        return "/index/hallManager";
    }

    @GetMapping("/hallManagerInfo")
    public String index6(ModelMap map){
        //?????????????????????List,??????????????????list,?????????????????????????????????list.
        List<HallManager> hallManagerList = hallManagerDao.findAll();
        map.put("hallManagerList", hallManagerList);
        List<HallManagerDetail> hallManagerDetailList = hallManagerDetailDao.findAll();
        map.put("hallManagerDetailList", hallManagerDetailList);
        return "/index/hallManagerInfo";
    }

    @GetMapping("/test")
    public String test(){
        return "/test/test";
    }

    @GetMapping("/test2")
    public String test2(){
        return "/test/test2";
    }

    @GetMapping("/test3")
    public String test3(){
        return "/test/test3";
    }

    @GetMapping("/test4")
    public String test4(){
        return "/test/test4";
    }

    @GetMapping("/test5")
    public String test5(){
        return "/test/test5";
    }

    @GetMapping("/test6")
    public String test6(){
        return "/test/test6";
    }
}
