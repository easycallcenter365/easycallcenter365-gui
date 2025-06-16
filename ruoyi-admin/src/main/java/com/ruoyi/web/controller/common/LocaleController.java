package com.ruoyi.web.controller.common;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.Locale;

@Controller
public class LocaleController {
    @GetMapping("/changeLang")
    public String changeLang(@RequestParam String lang, HttpServletRequest request) {
        Locale locale = new Locale(lang);
        request.getSession().setAttribute("org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE", locale);
        return "redirect:" + request.getHeader("Referer");
    }
}
