package org.zerock.controller;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.ReplyVO;
import org.zerock.persistence.BoardDAO;
import org.zerock.persistence.BoardDAO;
import org.zerock.persistence.ReplyDAO;
import org.zerock.service.ReplyService;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class BoardDAOTest {

	private static final Logger logger = LoggerFactory.getLogger(BoardDAOTest.class);

	@Inject
	private BoardDAO dao;

    @Inject
    private ReplyDAO rdao;

    @Inject
    private ReplyService service;

    @Test
    public void testURI() throws Exception {
        UriComponents uriComponents = UriComponentsBuilder.newInstance()
                .path("/board/read")
                .queryParam("bno", 12)
                .queryParam("perPageNum", 20)
                .build();

        logger.info("/board/read?bno=12&PageNum=20");
        logger.info(uriComponents.toString());
    }

    @Test
    public void testListPage() throws Exception {
        int page = 3;
        List<BoardVO> list = dao.listPage(page);

        for (BoardVO boardVO : list) {
            logger.info(boardVO.getBno() + ":" + boardVO.getTitle());
        }
    }

    @Test
    public void testListCriteria() throws Exception {
        Criteria cri = new Criteria();
        cri.setPage(2);
        cri.setPerPageNum(20);
        List<BoardVO> list = dao.listCriteria(cri);

        for(BoardVO boardVO : list) {
            logger.info(boardVO.getBno() + ":" + boardVO.getTitle());
        }
    }

	@Test
	public void testCreate() throws Exception {
		BoardVO board = new BoardVO();
		board.setTitle("새로운 글을 넣습니다.");
		board.setContent("새로운 내용을 넣습니다.");
		board.setWriter("user00");
//		dao.create(board);
	}

	@Test
	public void testRead() throws Exception {
//		logger.info(dao.read(1).toString());
	}

	@Test
	public void testUpdate() throws Exception {
		BoardVO board = new BoardVO();
		board.setBno(1);
		board.setTitle("수정된 글입니다.");
		board.setContent("수정 테스트.");
//		dao.update(board);
	}

	@Test
	public void testDelete() throws Exception {
		//dao.delete(1);
	}

    @Test
    public void testInsert() throws Exception {
        ResponseEntity<String> entity = null;
        try {
            ReplyVO vo = new ReplyVO();
            vo.setBno(2);
            vo.setReplayer("user01");
            vo.setReplytext("test");
            rdao.createReply(vo);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Test
    public void testControllerTest() throws Exception {
        ResponseEntity<String> entity = null;
        try {
            ReplyVO vo = new ReplyVO();
            vo.setBno(4);
            vo.setReplayer("userkim");
            vo.setReplytext("test....");
            service.addReply(vo);
            entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();;
            entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
        }
    }

}
