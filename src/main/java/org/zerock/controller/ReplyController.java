package org.zerock.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.Criteria;
import org.zerock.domain.PageMaker;
import org.zerock.domain.ReplyVO;
import org.zerock.domain.SearchCriteria;
import org.zerock.service.ReplyService;

import javax.inject.Inject;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

/**
 * Created by yongyeonkim on 2016. 2. 24..
 */
@RestController
@RequestMapping("/replies")
public class ReplyController {

    @Inject
    private ReplyService service;

    private static final Logger logger = LoggerFactory.getLogger(ReplyController.class);

    @RequestMapping(value="register", method = RequestMethod.POST)
    public ResponseEntity<String> register(@RequestBody ReplyVO vo) {
        ResponseEntity<String> entity = null;
        try {
            logger.info(vo.toString());
            service.addReply(vo);
            entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();;
            entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
        }
        return entity;
    }

    /**
     * /게시물의번호/페이지번호
     * @param bno
     * @param page
     * @return
     */
    @RequestMapping(value="/{bno}/{page}", method = RequestMethod.GET)
    public ResponseEntity<Map<String, Object>> listPage(@PathVariable("bno") Integer bno,
                                                        @PathVariable("page") Integer page) {
        ResponseEntity<Map<String,Object>> entity = null;

        try {
            Criteria cri = new Criteria();

            cri.setPage(page);

            PageMaker pageMaker = new PageMaker();

            pageMaker.setCri(cri);

            Map<String, Object> map = new HashMap<String, Object>();

            List<ReplyVO> list = service.listReplyPage(bno, cri);

            map.put("list", list);

            int replyCount = service.count(bno);

            pageMaker.setTotalCount(replyCount);

            map.put("pageMaker", pageMaker);

            entity = new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);


        } catch (Exception e) {
            e.printStackTrace();

            entity = new ResponseEntity<Map<String, Object>>(HttpStatus.BAD_REQUEST);

        }
        return entity;
    }

    @RequestMapping(value = "/removePage", method = RequestMethod.POST)
    public String remove(@RequestParam("bno") int bno, SearchCriteria cri, RedirectAttributes rttr) throws Exception {
        return "";

    }


}
