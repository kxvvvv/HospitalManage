package servlet;

import mapper.PatientMapper;
import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;
import utils.MyBatisUtil;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/reg")
public class RegServlet extends HttpServlet {
    @Override
    protected  void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=UTF-8");
//        切换账号
        SqlSession sqlSession= MyBatisUtil.getSqlSession();
        PatientMapper patientMapper=sqlSession.getMapper(PatientMapper.class);
        String regAcc=req.getParameter("regAcc");
        String regPwd=req.getParameter("regPwd");
        String name=req.getParameter("name");
        String id=req.getParameter("id");
        String phone=req.getParameter("phone");
        String address=req.getParameter("address");
        int age= Integer.parseInt(req.getParameter("age"));
        Integer patientId=null;
        Map<String,Object> map=new HashMap<>();
        map.put("patAcc",regAcc);
        map.put("patPwd",regPwd);
        map.put("age",age);
        map.put("name",name);
        map.put("id",id);
        map.put("phone",phone);
        map.put("address",address);
        map.put("balance",0);

        try {
            patientMapper.patientRegister(map);
        }catch (PersistenceException e){
            e.printStackTrace();

            String errorMessage = "已存在的账号！";
            System.out.println("======================"+errorMessage);
            req.setAttribute("errorMessage", errorMessage);
            // 转发到错误页面
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/error.jsp");
            dispatcher.forward(req, resp);
        }finally {
            sqlSession.commit();
            sqlSession.close();
        }
//        patientId=(Integer)map.get("patient_id");
        System.out.println("+++++++++++testLogin="+map.get("patient_id"));
//        sqlSession.commit();
        req.getSession().setAttribute("role",2);//存放权限
        req.getSession().setAttribute("id",map.get("patient_id"));//存放登录id
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/index.jsp");
        if (dispatcher != null) {
            try {
                dispatcher.forward(req, resp);
            } catch (ServletException | IOException e) {
                e.printStackTrace();
            }
        } else {
            resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error page not found");
        }
    }
}
