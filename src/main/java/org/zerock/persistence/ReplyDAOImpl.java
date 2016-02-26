package org.zerock.persistence;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.zerock.domain.Criteria;
import org.zerock.domain.ReplyVO;

import javax.inject.Inject;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by yongyeonkim on 2016. 2. 24..
 */
@Repository
public class ReplyDAOImpl implements ReplyDAO {

    @Inject
    private SqlSession session;

    private static String namespace = "org.zerock.mapper.ReplyMapper";


    @Override
    public List<ReplyVO> listReply(Integer bno) throws Exception {
        return session.selectList(namespace + ".listReply", bno);
    }

    @Override
    public void createReply(ReplyVO vo) throws Exception {
        session.insert(namespace + ".createReply", vo);
    }

    @Override
    public void updateReply(ReplyVO vo) throws Exception {
        session.update(namespace + ".updateReply", vo);
    }

    @Override
    public void deleteReply(Integer rno) throws Exception {
        session.delete(namespace + ".deleteReply", rno);
    }

    @Override
    public List<ReplyVO> listPage(Integer bno, Criteria cri) throws Exception {
        Map<String, Object> paramMap = new HashMap<>();

        paramMap.put("bno" , bno);
        paramMap.put("cri", cri);

        return session.selectList(namespace + ".listPage", paramMap);

    }

    @Override
    public int count(Integer bno) throws Exception {
        return session.selectOne(namespace + ".count", bno);
    }


}
