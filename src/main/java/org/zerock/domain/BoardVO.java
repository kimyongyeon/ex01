package org.zerock.domain;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import org.hibernate.validator.constraints.NotEmpty;

@Getter
@Setter
public class BoardVO {

	private Integer bno;
	
	@NotEmpty
	private String title;
	
	private String content;
	
	private String writer;
	
	private Date regdate;
	
	private int viewcnt;
	
}
