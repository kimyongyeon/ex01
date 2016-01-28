package org.zerock.domain;

import java.util.Date;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BoardVO {

	private Integer bno;
	
	@NotNull
	@Size(min=1, max=50)
	private String title;
	
	@NotNull
	private String content;
	
	@NotNull
	private String writer;
	
	@NotNull
	private Date regdate;
	
	@NotNull
	private int viewcnt;
	
}
