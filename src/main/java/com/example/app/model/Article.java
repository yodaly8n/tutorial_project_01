package com.example.app.model;

import lombok.Getter;
import lombok.Setter;
import org.apache.ibatis.type.Alias;

import java.time.LocalDateTime;

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
}
