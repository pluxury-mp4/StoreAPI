package com.example.storeapi.repositories;

import com.example.storeapi.models.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository <User,Long>{
User findByEmail(String email);
}
