package org.zerock.domain;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import org.hibernate.validator.constraints.NotEmpty;

import javax.validation.constraints.NotNull;

@Getter
@Setter
public class BoardVO {

	private Integer bno;

	@NotEmpty
	private String title;

    @NotEmpty
	private String content;

    @NotEmpty
	private String writer;
	
	private Date regdate;
	
	private int viewcnt;



}
