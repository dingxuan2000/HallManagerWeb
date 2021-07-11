package com.example.hall.freemarker;

import com.example.hall.chargetype.ChargeType;
import com.example.hall.chargetype.ChargeTypeDao;

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
    private ChargeTypeDao chargeTypeDao;

    @Autowired
    private HouseManagerDao houseManagerDao;


    @GetMapping("/index")
    public String index(ModelMap map){
        List<User> userList = userDao.findAll();
        map.put("userList1", userList);
        return "/index/index";
    }

    @GetMapping("/commManager")
    public String index2(ModelMap map){
        List<User> userList2 = userDao.findAll();
        map.put("userList2", userList2);
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
        List<HouseManager> houseManagerList = houseManagerDao.findAll();
        map.put("houseManagerTypeList", houseManagerList);
        return "/index/houseManager";
    }




//    ModelAndView page1(){
//        ModelAndView mv = new ModelAndView();
//        mv.addObject("title","子页面标题");
//        mv.setViewName("index/com.example.hall.commManager");
//        return mv;
//    }

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
}
