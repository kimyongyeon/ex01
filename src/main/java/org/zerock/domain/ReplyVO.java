package org.zerock.domain;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

/**
 * Created by yongyeonkim on 2016. 2. 24..
 */
@Setter
@Getter
public class ReplyVO {

    private Integer rno;
    private Integer bno;
    private String replytext;
    private String replayer;
    private Date regdate;
    private Date updatedate;

    @Override
    public String toString() {
        return "rno : " + rno + ", bno : " + bno + ", replytext : " + replytext + ", replayer : " + replayer;
    }

}
