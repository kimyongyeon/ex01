package org.zerock.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.*;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

    @RequestMapping(value = "/test" , method = RequestMethod.GET)
    public String ajaxText() {

        logger.trace("This is TRACE Log!");
        logger.debug("This is DEBUG Log!");
        logger.info("This is INFO Log!");
        logger.warn("This is WARN Log!");
        logger.error("This is ERROR Log!");

        return "/test";

    }

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {


		logger.info("Welcome home! The client locale is {}.", locale);

        model.addAttribute("status", "NORMAL");
        Map<String, Object> map = new HashMap<>();
        List<Map> list = new ArrayList<>();

        for(int i = 0; i< 10; i++){
            map = new HashMap<>();
            map.put("name", "kim" + i);
            map.put("comment", "comment memo my name is ... 010-1234-1234" + i);
            if(i % 2 == 0) {
                map.put("status", "NORMAL");
            }else {
                map.put("status", "RENTNOW");
            }
            if(i == 9) {
                map.put("status", "HI~");
            }

            list.add(map);
        }
        model.addAttribute("list", list);
        model.addAttribute("myDate", "20151112");

		return "/home";
	}

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(Locale locale, Model model) {
        return "/login";
    }



    /**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main(Locale locale, Model model) {


		logger.info("Welcome main! The client locale is {}.", locale);

        model.addAttribute("status", "NORMAL");
        Map<String, Object> map = new HashMap<>();
        List<Map> list = new ArrayList<>();

        for(int i = 0; i< 10; i++){
            map = new HashMap<>();
            map.put("name", "main - kim" + i);
            map.put("comment", "main memo my name is ... 010-1234-1234" + i);
            if(i % 2 == 0) {
                map.put("status", "NORMAL");
            }else {
                map.put("status", "RENTNOW");
            }
            list.add(map);
        }
        model.addAttribute("list", list);

		return "/main";
	}

}
