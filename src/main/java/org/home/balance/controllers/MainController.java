package org.home.balance.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.Map;

@Controller
public class MainController {

    @GetMapping("/")
    String home(Map<String, Object> model) {
        model.put("name", "World");
        return "welcome";
    }

    @GetMapping("/income")
    String income() {
        return "income";
    }

}
