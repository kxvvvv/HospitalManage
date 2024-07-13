package servlet;

import mapper.RegisteredMapper;
import org.apache.ibatis.session.SqlSession;
import utils.MyBatisUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/updateRegStatus1")
public class updateRegStatus extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=UTF-8");
        SqlSession sqlSession= MyBatisUtil.getSqlSession();
        RegisteredMapper registeredMapper=sqlSession.getMapper(RegisteredMapper.class);
        int regId=Integer.parseInt(req.getParameter("registrationId"));
        registeredMapper.changeStatusByDoctor1(regId);
        System.out.println("========已修改状态:"+regId);
        sqlSession.commit();
    }
}
