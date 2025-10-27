package com.example.app;


import com.example.app.model.Member;
import com.example.app.util.MyBatisUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.apache.ibatis.session.SqlSession;

import java.io.IOException;

@WebServlet("/setting/profile")
public class SettingProfileServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 인증 유무
        Member logonUser =(Member)req.getSession().getAttribute("logonUser");
        if(logonUser == null) {
            resp.sendRedirect("/login");
            return;
        }
        // 수정폼으로 넘겨서 화면을 만들어서 전송
        // 기존 정보를 가지고 와서 미리 보여줄 필요가 있음
        SqlSession sqlSession = MyBatisUtil.build().openSession(true);
        Member found = sqlSession.selectOne("mappers.MemberMapper.selectById", logonUser.getId());
        // 굳이 DB에서 다시 안불러와도, session 에 로그인 과정에서 정보를 넣어두니까 그걸 사용해도 같을 것 같다.
         req.setAttribute("member", found);
//        req.setAttribute("member", logonUser);
        sqlSession.close();
        req.getRequestDispatcher("/setting/profile.jsp").forward(req, resp);
    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Member logonUser =(Member)req.getSession().getAttribute("logonUser");
        String name =req.getParameter("name");
        String nickname = req.getParameter("nickname");
        String email = req.getParameter("email");
        String interest = req.getParameter("interest");

        Member p = new Member();
        p.setNickname(nickname);
        p.setName(name);
        p.setEmail(email);
        p.setInterest(interest);
        p.setId(logonUser.getId());

        SqlSession sqlSession = MyBatisUtil.build().openSession(true);

        int r = sqlSession.update("mappers.MemberMapper.updateOne", p);

        resp.sendRedirect("/setting/profile");





    }
}
