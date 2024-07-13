package servlet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

import mapper.DoctorMapper; // 假设您有一个DoctorMapper接口
import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;
import pojo.Doctor; // 假设您有一个Doctor类
import utils.MyBatisUtil;

@WebServlet("/addDoctor")
public class AdddoctorServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json; charset=utf-8");

        try (SqlSession sqlSession = MyBatisUtil.getSqlSession()) {
            DoctorMapper doctorMapper = sqlSession.getMapper(DoctorMapper.class);
            Doctor doctor = new Doctor();

            // 从请求中获取表单数据
            doctor.setName(request.getParameter("name"));
            System.out.println(request.getParameter("name"));

            doctor.setDocPwd(request.getParameter("docPwd"));
            System.out.println("request.getParameter(\"docPwd\")"+request.getParameter("docPwd"));

            doctor.setDocAcc(request.getParameter("docAcc"));
            System.out.println("request.getParameter(\"docAcc\")"+request.getParameter("docAcc"));

            doctor.setRole(Integer.parseInt(request.getParameter("role")));
            System.out.println("Integer.parseInt(request.getParameter(\"role\"))"+Integer.parseInt(request.getParameter("role")));

            doctor.setSectionId(Integer.parseInt(request.getParameter("sectionId")));
            System.out.println("Integer.parseInt(request.getParameter(\"sectionId\"))"+Integer.parseInt(request.getParameter("sectionId")));

            doctor.setPhone(request.getParameter("phone"));
            System.out.println("request.getParameter(\"phone\")"+request.getParameter("phone"));

            doctor.setMajor(request.getParameter("major"));
            System.out.println("request.getParameter(\"major\")"+request.getParameter("major"));

            doctor.setJob(request.getParameter("job"));
            System.out.println("request.getParameter(\"job\")"+request.getParameter("job"));

            doctor.setDegree(request.getParameter("degree"));
            System.out.println("request.getParameter(\"degree\")"+request.getParameter("degree"));

            System.out.println(doctor);
            // 插入医生数据到数据库
//            doctorMapper.insertDoctor(doctor);
            try {
                System.out.println("testHHHHHHHHHHHHere");
                doctorMapper.insertDoctor(doctor);
            }catch (PersistenceException e){
                e.printStackTrace();

                String errorMessage = "已存在的账号！";
                System.out.println("======================"+errorMessage);
                request.setAttribute("errorMessage", errorMessage);
                // 转发到错误页面
                RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/error.jsp");
                dispatcher.forward(request, response);
            }finally {
                sqlSession.commit();
                sqlSession.close();
            }

//            sqlSession.commit();

            // 重定向到医生列表页面
            response.sendRedirect("showdoctor.jsp"); // 确保这是正确的重定向页面
        } catch (NumberFormatException e) {
            // 处理可能的数字格式异常
            response.getWriter().write("Error: " + e.getMessage());
        } catch (Exception e) {
            // 其他异常处理
            e.printStackTrace();
            response.getWriter().write("Error: " + e.getMessage());
        }
    }
}