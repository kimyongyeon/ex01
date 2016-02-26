package org.zerock.service;

import org.springframework.stereotype.Service;
import org.zerock.domain.Criteria;
import org.zerock.domain.ReplyVO;
import org.zerock.persistence.ReplyDAO;

import javax.inject.Inject;
import java.util.List;

/**
 * Created by yongyeonkim on 2016. 2. 24..
 */
@Service
public class ReplyServiceImpl implements ReplyService{

    @Inject
    private ReplyDAO dao;

    @Override
    public void addReply(ReplyVO vo) throws Exception {
        dao.createReply(vo);
    }

    @Override
    public List<ReplyVO> listReply(Integer bno) throws Exception {
        return dao.listReply(bno);
    }

    @Override
    public void modifyReply(ReplyVO vo) throws Exception {
        dao.updateReply(vo);
    }

    @Override
    public void removeReply(Integer rno) throws Exception {
        dao.deleteReply(rno);
    }

    @Override
    public List<ReplyVO> listReplyPage(Integer bno, Criteria cri) throws Exception {
        return dao.listPage(bno, cri);
    }

    @Override
    public int count(Integer bno) throws Exception {
        return dao.count(bno);
    }
}
