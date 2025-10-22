package com.example.app.model;

import lombok.Getter;
import lombok.Setter;
import org.apache.ibatis.type.Alias;
import org.ocpsoft.prettytime.PrettyTime;

import java.time.LocalDateTime;
import java.util.Locale;

@Setter
@Getter

public class Article {
    int no;
    String writerId;
    String topic;
    String title;
    String content;
    LocalDateTime wroteAt;
    int viewCnt;
    int likeCnt;
    int commentCnt;

    public String getPrettyWroteAt( ) {
        PrettyTime p = new PrettyTime(Locale.KOREAN);
        return p.format(this.wroteAt);
    }
}
