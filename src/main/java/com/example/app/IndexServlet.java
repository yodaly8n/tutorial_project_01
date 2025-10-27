package com.example.app;

import com.example.app.util.MyBatisUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebListener;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.ocpsoft.prettytime.PrettyTime;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.Locale;

@WebServlet("/index")
public class IndexServlet extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if(req.getSession() != null) {

        }

        req.getSession();
        req.setAttribute("msg", "MESSAGE");

        req.getRequestDispatcher("/index.jsp").forward(req, resp);
    }
}
