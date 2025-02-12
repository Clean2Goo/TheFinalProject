package com.mySpring.myapp.notice.vo;

import java.sql.Date;

public class NoticeVO {
    private int noticeno;
    private String id;
    private String title;
    private String content;
    private Date writedate;
    private String imagefilename;

	private String userName; // 작성자 이름

    // Getter and Setter
    public int getNoticeno() {
        return noticeno;
    }

    public void setNoticeno(int noticeno) {
        this.noticeno = noticeno;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getWritedate() {
        return writedate;
    }

    public void setWritedate(Date writedate) {
        this.writedate = writedate;
    }

    public String getImagefilename() {
        return imagefilename;
    }

    public void setImagefilename(String imagefilename) {
        this.imagefilename = imagefilename;
    }


    @Override
    public String toString() {
        return "NoticeVO{" +
                "noticeno=" + noticeno +
                ", id='" + id + '\'' +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                ", writedate=" + writedate +
                ", imagefilename='" + imagefilename + '\'' +
                '}';
    }

	public String getUserName() {
		return userName;
	}

	public void setUserhName(String userName) {
		this.userName = userName;
	}
}
