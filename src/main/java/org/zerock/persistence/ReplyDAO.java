package org.zerock.persistence;

import org.zerock.domain.Criteria;
import org.zerock.domain.ReplyVO;

import java.util.List;

/**
 * Created by yongyeonkim on 2016. 2. 24..
 */
public interface ReplyDAO {

    public List<ReplyVO> listReply(Integer bno) throws Exception;

    public void createReply(ReplyVO vo) throws Exception;

    public void updateReply(ReplyVO vo) throws Exception;

    public void deleteReply(Integer rno) throws Exception;

    public List<ReplyVO> listPage(Integer bno, Criteria cri) throws Exception;

    public int count(Integer bno) throws Exception;

}
