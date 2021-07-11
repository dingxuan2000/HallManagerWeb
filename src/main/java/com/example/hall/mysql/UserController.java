package com.example.hall.mysql;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
public class UserController {

    @Autowired
    UserDao userDao;

    @Autowired
    private UserServices UserServices;

//    http://localhost:8080/getAll

//    public List getAll(){
//        List all = userDao.findAll();
//        map.put("code", 0);
//        map.put("count", userDao.countAll());select count(*) from xxx
//        map.put("data", all);
//        map.put("msg", "query OK!");
//        map.put("msg", "query error!");
//        return all;
//    }

    @GetMapping("/getAll")
    public Map<String, Object> getAll() {
        List all = userDao.findAll();
//        JSONObject result = new JSONObject();
        Map<String, Object> result = new HashMap<>();
        try {
            System.out.println("data: " + all);
            result.put("code", "0");
            result.put("count", userDao.count());
            result.put("data", all);
            result.put("msg", "Query OK!");
        } catch (Exception e) {
            result.put("code", "500");
            result.put("msg", "Query error!");
        }
        return result;
    }


//    http://localhost:8080/add?name=asdasd&age=13  用postman测试
    @GetMapping("/add")
    public User add(@RequestParam("name") String name, @RequestParam("age") int age){
        User user =new User();
        user.setName(name);
        user.setAge(age);

        User save = userDao.save(user);
        return save;
    }

    //    http://localhost:8080/deleteOne?id=1  用postman测试
    @DeleteMapping("/deleteOne")
    public String deleteOne(@RequestParam("id") int id){
        userDao.deleteById(id);
        return "delete";
    }

//    @GetMapping("/deleteAll")
//    public String deleteAll(){
//        userDao.deleteAll();
//        return "delete All";
//    }


    @PostMapping(path="/addAll", produces = "application/json")
    public ResponseEntity<User> addUser(@Valid @RequestBody User user){
        System.out.println("[add one user]");
        return new ResponseEntity<>(UserServices.save(user), HttpStatus.CREATED);
    }

//    @DeleteMapping(path="/deletebyid/{id}", produces = "application/json")
//    public ResponseEntity<User> deleteUserById(@PathVariable Integer id){
//        System.out.println("[delete one user]");
//        return new ResponseEntity<>(UserServices.deleteById(id), HttpStatus.OK);
//    }


//    @RequestMapping(value = "/addAll", method = RequestMethod.POST)
//    public String addUser(User user){
//
//        UserServices.save(user);
//        return "success";
//    }
}
