package servlet;

import com.google.gson.Gson;
import mapper.DoctorMapper;
import mapper.PatientMapper;
import org.apache.ibatis.session.SqlSession;
import pojo.Doctor;
import utils.MyBatisUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;


@WebServlet("/showData")
public class ShowDataServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("application/json; charset=utf-8");
        SqlSession sqlSession = MyBatisUtil.getSqlSession();
        try {
            DoctorMapper doctorMapper = sqlSession.getMapper(DoctorMapper.class);
            PatientMapper patientMapper=sqlSession.getMapper(PatientMapper.class);
            List<Integer> docIds=doctorMapper.selectAllDoctorId();
            List<Doctor> doctors=doctorMapper.selectById(docIds);
            System.out.println("++++++++doctors:"+doctors);
            Gson gson = new Gson(); // 使用Gson库来转换对象为JSON
            String jsonResponse = gson.toJson(doctors);
            System.out.println("+++++++jsonDoctor:"+jsonResponse);
            resp.getWriter().write(jsonResponse);
        } finally {
            sqlSession.close();
        }
    }
}
