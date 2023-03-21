package com.example.storeapi.services;

import com.example.storeapi.models.Notification;
import com.example.storeapi.models.User;
import com.example.storeapi.repositories.NotificationRepository;
import com.example.storeapi.repositories.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.security.Principal;
import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
public class NotificationService {
    private final NotificationRepository notificationRepository;
    private final UserRepository userRepository;

    public List<Notification> listNotifications(String title) {
        if (title != null) return notificationRepository.findByTitle(title);
        return notificationRepository.findAll();
    }


    public void saveNotification(Notification notification) {
        log.info("Saving new Notification. Title: {};", notification.getTitle());
        notificationRepository.save(notification);
    }

    public User getUserByPrincipal(Principal principal) {
        if (principal == null) return new User();
        return userRepository.findByEmail(principal.getName());
    }

    public void deleteNotification(Long id) {
        notificationRepository.deleteById(id);
    }

    public Notification getNotificationById(Long id) {
        return notificationRepository.findById(id).orElse(null);
    }

}
