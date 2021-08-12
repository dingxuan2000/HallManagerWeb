package com.example.hall.joinHallManagerInfo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class JoinService {

    @Autowired
    private JoinRepository joinRepository;

    public List<JoinDto> innerJoinData(){
        return joinRepository.fetchByQuery();
    }


}
