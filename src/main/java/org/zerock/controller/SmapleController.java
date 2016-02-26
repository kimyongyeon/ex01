package org.zerock.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.zerock.domain.SampleVO;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by yongyeonkim on 2016. 2. 24..
 */
@RestController
@RequestMapping("/sample")
public class SmapleController {

    @RequestMapping("/hello")
    public String sayHello(){
        return "hello world";
    }

    @RequestMapping("/sendVO")
    public SampleVO sendVO(){
        SampleVO vo = new SampleVO();
        vo.setFirstName("홍");
        vo.setLastName("길동");
        vo.setMno(123);
        return vo;
    }

    @RequestMapping("sendList")
    public List<SampleVO> sendList() {
        List<SampleVO> list = new ArrayList<>();
        for(int i=0; i<10; i++){
            SampleVO vo = new SampleVO();
            vo.setFirstName("길동");
            vo.setLastName("홍");
            vo.setMno(i);
            list.add(vo);
        }
        return list;
    }

    @RequestMapping("/sendErrorAuth")
    public ResponseEntity<Void> sendListAuth() {
        return new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
    }

    @RequestMapping("/sendErrorNot")
    public ResponseEntity<List<SampleVO>> sendListNot() {
        List<SampleVO> list = new ArrayList<>();
        for(int i=0; i<10; i++){
            SampleVO vo = new SampleVO();
            vo.setFirstName("길동");
            vo.setLastName("홍");
            vo.setMno(i);
            list.add(vo);
        }
        return new ResponseEntity<>(list, HttpStatus.NOT_FOUND);
    }
}
