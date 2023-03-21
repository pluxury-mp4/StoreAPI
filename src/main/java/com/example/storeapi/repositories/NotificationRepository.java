package com.example.storeapi.repositories;

import com.example.storeapi.models.Notification;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

    public interface NotificationRepository extends JpaRepository<Notification, Long> {

        List<Notification> findByTitle(String title);
    }
