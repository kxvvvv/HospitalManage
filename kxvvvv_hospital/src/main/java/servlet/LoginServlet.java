package servlet;

import mapper.PatientMapper;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
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
import com.fasterxml.jackson.databind.ObjectMapper;
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
        String identity=req.getParameter("identity");

        map.put("inAcc",inAcc);
        map.put("inPwd",inPwd);
        Integer role = null;
        if ("patient".equals(identity)) {
            role = patientMapper.patientLogin(map);
            System.out.println("+++++++++++patientLoginExecute");
        } else if ("doctor".equals(identity)) {
            role = patientMapper.doctorLogin(map);
        } else if ("admin".equals(identity)) {
            role = patientMapper.adminLogin(map);
        }
        System.out.println("+++++++++++testLogin="+role);
        System.out.println("+++++++++++identity="+identity);

        if (role == null || role == -1) {
            String errorMessage = "账号或密码错误，请重新输入！";
            req.setAttribute("errorMessage", errorMessage);
            // 转发到错误页面
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/error.jsp");
            if (dispatcher != null) {
                try {
                    dispatcher.forward(req, resp);
                } catch (ServletException | IOException e) {
                    e.printStackTrace();
                }
            } else {
                resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error page not found");
            }
        } else if (role==0) {//管理员登录

        }
        //登录成功，跳转主页,存储session
        else {
            req.getSession().setAttribute("role",role);
            if("patient".equals(identity)){
                Patient patient=new Patient();
                patient=patientMapper.selectByAcc(inAcc);

                String patientName = patient.getName(); // 假设patient对象已经获取到
                req.getSession().setAttribute("patName", patient.getName()); // 存储到Session
                req.getSession().setAttribute("patId", patient.getId());//身份证
                req.getSession().setAttribute("patientId", patient.getPatient_id());//id
                System.out.println("========patientId:"+patient.getPatient_id());
                req.getSession().setAttribute("patPhone", patient.getPhone());
                req.getSession().setAttribute("patName", patient.getName());
//            System.out.println("++++++++Patient:"+patientJson);
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



    }
}
