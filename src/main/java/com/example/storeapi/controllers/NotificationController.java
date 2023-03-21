
    package com.example.storeapi.controllers;

import com.example.storeapi.models.Notification;
import com.example.storeapi.services.NotificationService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.security.Principal;

    @Controller
    @RequiredArgsConstructor
    public class NotificationController {
        private final NotificationService notificationService;

        @GetMapping("/notifications")
        public String notifications(@RequestParam(name = "title", required = false) String title, Principal principal, Model model){
            model.addAttribute("notification", notificationService.listNotifications(title));
            model.addAttribute("user", notificationService.getUserByPrincipal(principal));
            return "notifications";
        }

        @GetMapping("/notification/{id}")
        public String notificationInfo(@PathVariable Long id, Model model) {
            Notification notification = notificationService.getNotificationById(id);
            model.addAttribute("notification", notification);
            return "notifications-info";
        }

        @PostMapping("/notification/create")
        public String createNotification(Notification notification) {
            notificationService.saveNotification(notification);
            return "redirect:/";
        }


        @PostMapping("/notification/delete/{id}")
        public String deleteProduct(@PathVariable Long id) {
            notificationService.deleteNotification(id);
            return "redirect:/";
        }

}
