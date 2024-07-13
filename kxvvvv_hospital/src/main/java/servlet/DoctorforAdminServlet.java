package servlet;

import com.google.gson.Gson;
import com.google.gson.stream.JsonReader;
import mapper.DoctorMapper;
import org.apache.ibatis.session.SqlSession;
import pojo.Doctor;
import utils.MyBatisUtil;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/showdoctor")
public class DoctorforAdminServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("application/json; charset=utf-8");
        // 处理查询列表
        SqlSession sqlSession = MyBatisUtil.getSqlSession();
        DoctorMapper doctorMapper = sqlSession.getMapper(DoctorMapper.class);
        try {
            List<Doctor> doctors = doctorMapper.selectAllDoctors();
            Gson gson = new Gson();
            String jsonResponse = gson.toJson(doctors);
            resp.getWriter().write(jsonResponse);

        } finally {
            sqlSession.close();
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        SqlSession sqlSession = MyBatisUtil.getSqlSession();
        try {
            DoctorMapper doctorMapper = sqlSession.getMapper(DoctorMapper.class);
            String action = req.getParameter("action");
            System.out.println(action);

            req.setCharacterEncoding("UTF-8");
            resp.setCharacterEncoding("UTF-8");
            resp.setContentType("application/json; charset=utf-8");
            String docId = req.getParameter("docId");

            System.out.println(docId);
            Integer docId1 = null;
            docId1 = Integer.parseInt(docId); // 解析docId
            Gson gson = new Gson();
            System.out.println(docId1);

            String jsonResponse;
            switch (action) {
                case "delete":
                    doctorMapper.deleteDoctorById(docId1); // 不需要quantity参数
                    jsonResponse = gson.toJson("Doctor deleted successfully");
                    resp.getWriter().write(jsonResponse);
                    break;
                default:
                    jsonResponse = gson.toJson("Invalid action");
                    resp.getWriter().write(jsonResponse);
                    break;
            }
            sqlSession.commit(); // 提交事务
        } catch (Exception e) {
            e.printStackTrace();
            throw new ServletException("Error processing request", e);
        } finally {
            sqlSession.close();
        }
    }
}