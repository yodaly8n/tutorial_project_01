package com.example.app;


import com.example.app.model.LikedArticle;
import com.example.app.model.Member;
import com.example.app.util.MyBatisUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.apache.ibatis.session.SqlSession;

import java.io.IOException;
import java.util.List;

@WebServlet("/user/liked")
public class UserLikedServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Member logonUser =(Member)req.getSession().getAttribute("logonUser");
        if(logonUser == null) {
            resp.sendRedirect("/login");
            return;
        }
        SqlSession sqlSession = MyBatisUtil.build().openSession(true);
        List<LikedArticle> likedArticleList =
                sqlSession.selectList("mappers.ArticleLikeMapper.selectLikedArticlesByMemberId", logonUser.getId());


        req.setAttribute("likedArticleList", likedArticleList);
        req.getRequestDispatcher("/user/liked.jsp").forward(req, resp);
    }
}
