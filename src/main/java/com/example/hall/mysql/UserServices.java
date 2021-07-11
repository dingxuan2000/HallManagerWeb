package com.example.hall.mysql;

import com.example.hall.services.Services;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@AllArgsConstructor
@Service
@Transactional
public class UserServices implements Services<User> {

    @Autowired
    UserDao userDao;

    @Override
    public User save(User user) {
        userDao.save(user);
        return user;
    }

    @Override
    public User deleteById(Integer id){
        User user = userDao.getById(id);
        userDao.deleteById(id);
        return user;
    }

    @Override
    public User updateById(Integer anId, User anObj) {
        return null;
    }

}
