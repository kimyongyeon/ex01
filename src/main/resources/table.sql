CREATE TABLE `tbl_board` (
  `bno` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `content` text,
  `writer` varchar(50) NOT NULL,
  `regdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `viewcnt` int(11) DEFAULT '0',
  PRIMARY KEY (`bno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tbl_member` (
  `userid` varchar(50) NOT NULL,
  `userpw` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `regdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table tbl_reply (
  rno int NOT NULL AUTO_INCREMENT,
  bno int NOT NULL default 0,
  replytext varchar(1000) not null,
  replayer varchar(50) not null,
  regdate TIMESTAMP NOT NULL default now(),
  updatedate timestamp not null default now(),
  primary key(rno)
);

alter table tbl_reply add constraint fk_board FOREIGN KEY (bno) REFERENCES tbl_board (bno);
