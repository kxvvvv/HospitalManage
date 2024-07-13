package servlet;

import mapper.PatientMapper;
import org.apache.ibatis.session.SqlSession;
import utils.MyBatisUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/reg")
public class RegServlet extends HttpServlet {
    @Override
    protected  void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=UTF-8");
        SqlSession sqlSession= MyBatisUtil.getSqlSession();
        PatientMapper patientMapper=sqlSession.getMapper(PatientMapper.class);
        String regAcc=req.getParameter("regAcc");
        String regPwd=req.getParameter("regPwd");
        String name=req.getParameter("name");
        String id=req.getParameter("id");
        String phone=req.getParameter("phone");
        String address=req.getParameter("address");
        int age= Integer.parseInt(req.getParameter("age"));
        Map<String,Object> map=new HashMap<>();
        map.put("patAcc",regAcc);
        map.put("patPwd",regPwd);
        map.put("age",age);
        map.put("name",name);
        map.put("id",id);
        map.put("phone",phone);
        map.put("address",address);
        map.put("balance",0);
        int res=patientMapper.patientRegister(map);
        System.out.println("+++++++++++testLogin="+res);
        sqlSession.commit();
    }
}
