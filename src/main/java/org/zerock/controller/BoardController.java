package org.zerock.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.cache.config.CacheManagementConfigUtils;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.PageMaker;
import org.zerock.service.BoardService;
import sun.jvm.hotspot.debugger.Page;

import javax.inject.Inject;
import javax.validation.Valid;

@Controller
@RequestMapping("/board")
public class BoardController {

    @Inject
    private BoardService service;

    private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public void registerGET(@ModelAttribute("commandNameBoard") BoardVO board) throws Exception {

        logger.info("register get ....");
    }

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String registerPOST(@Valid @ModelAttribute("commandNameBoard") BoardVO board, BindingResult result, ModelMap model
            , RedirectAttributes rttr
            ) throws Exception {

        logger.info("register post.....");

        logger.info("1.title : {}", board.getTitle());
        logger.info("2.content : {}", board.getContent());
        logger.info("3.writer : {}", board.getWriter());

        if (result.hasErrors()) {
            return "/board/register";
        }

        logger.info(board.toString());

        service.regist(board);

//        model.addAttribute("result", "success");

//		return "/board/success";
        rttr.addFlashAttribute("msg", "success");
        return "redirect:/board/listAll";
    }

    @RequestMapping(value = "/listAll", method = RequestMethod.GET)
    public void listAll(Model model) throws Exception {
        logger.info("show all list.....");
        model.addAttribute("list", service.listAll());
    }

    @RequestMapping(value = "/read", method = RequestMethod.GET)
    public void read(@RequestParam("bno") int bno, ModelMap model) throws Exception {
        model.addAttribute(service.read(bno));
    }

    @RequestMapping(value = "/readPage", method = RequestMethod.GET)
    public void readPage(@RequestParam("bno") int bno
                         , @ModelAttribute("cri") Criteria cri
            , ModelMap model) throws Exception {
        model.addAttribute(service.read(bno));
    }

    @RequestMapping(value = "/remove", method = RequestMethod.POST)
    public String remove(@RequestParam("bno") int bno, RedirectAttributes rttr) throws Exception {
        service.remove(bno);
        rttr.addFlashAttribute("msg", "success");
        return "redirect:/board/listAll";
    }

    @RequestMapping(value = "/modify", method = RequestMethod.GET)
    public void modifyGET(int bno, Model model) throws Exception {
        model.addAttribute(service.read(bno));
    }

    @RequestMapping(value = "/modify", method = RequestMethod.POST)
    public String modifyPOST(BoardVO board, RedirectAttributes rttr, Errors errors) throws Exception {

        if (errors.hasErrors()) {
            return "/register";
        }

        logger.info("mod post.....");
        service.modify(board);
        rttr.addFlashAttribute("msg", "success");
        return "redirect:/board/listAll";
    }

    @RequestMapping(value = "listCri", method = RequestMethod.GET)
    public void listCri(Criteria cri, Model model) throws Exception{
        logger.info("show list Page with Criteria....................");

        model.addAttribute("list", service.listCriteria(cri));
    }

    @RequestMapping(value = "listPage", method = RequestMethod.GET)
    public void listPage(Criteria cri, Model model) throws Exception{
        logger.info(cri.toString());

        model.addAttribute("list", service.listCriteria(cri));
        PageMaker pageMaker = new PageMaker();
        pageMaker.setCri(cri);
        //pageMaker.setTotalCount(131);
        pageMaker.setTotalCount(service.listCountCriteria(cri));

        model.addAttribute("pageMaker", pageMaker);
    }


}
