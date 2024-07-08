package servlet;

import mapper.PatientMapper;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import mapper.*;
import pojo.*;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import utils.MyBatisUtil;
import utils.MyBatisUtil;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    @Override
    protected  void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
        SqlSession sqlSession= MyBatisUtil.getSqlSession();
        PatientMapper patientMapper=sqlSession.getMapper(PatientMapper.class);
        String inAcc=req.getParameter("inAcc");
        String inPwd=req.getParameter("inPwd");
        Map<String,Object> map=new HashMap<>();
        map.put("patAcc",inAcc);
        map.put("patPwd",inPwd);
        int role=patientMapper.patientLogin(map);
        System.out.println("+++++++++++testLogin="+role);
    }
}
