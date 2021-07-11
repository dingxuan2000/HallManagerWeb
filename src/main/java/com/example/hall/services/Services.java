package com.example.hall.services;

public interface Services<T> {
    T save(T anObj);
    T deleteById(Integer anId);
    T updateById(Integer anId, T anObj);


}
