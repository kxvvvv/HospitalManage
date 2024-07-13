package servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

import mapper.DoctorMapper; // 假设您有一个DoctorMapper接口
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
            doctor.setDocPwd(request.getParameter("docPwd"));
            doctor.setDocAcc(request.getParameter("docAcc"));
            doctor.setRole(Integer.parseInt(request.getParameter("role")));
            doctor.setSectionId(Integer.parseInt(request.getParameter("sectionId")));
            doctor.setPhone(request.getParameter("phone"));
            doctor.setMajor(request.getParameter("major"));
            doctor.setJob(request.getParameter("job"));
            doctor.setDegree(request.getParameter("degree"));

            // 插入医生数据到数据库
            doctorMapper.insertDoctor(doctor);

            sqlSession.commit();

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