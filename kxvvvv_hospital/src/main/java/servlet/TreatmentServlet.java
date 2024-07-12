package servlet;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import mapper.RegisteredMapper;
import org.apache.ibatis.session.SqlSession;
import pojo.Registered;
import utils.MyBatisUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

@WebServlet("/treatment")
public class TreatmentServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("application/json; charset=utf-8");
        SqlSession sqlSession = MyBatisUtil.getSqlSession();
        RegisteredMapper registeredMapper=sqlSession.getMapper(RegisteredMapper.class);
        HttpSession httpSession=req.getSession();
        Integer role=(Integer) httpSession.getAttribute("role");
        Integer docId=(Integer) httpSession.getAttribute("id");
        try{
            List<Registered> registereds=registeredMapper.selectRegisteredByDocId(docId);
            System.out.println("++++++++"+docId+"+++++"+registereds);
            Gson gson = new GsonBuilder()
                    .registerTypeAdapter(LocalDateTime.class, new Registered.LocalDateTimeTypeAdapter())
                    .registerTypeAdapter(LocalDate.class, new Registered.LocalDateTypeAdapter())
                    .create();
            String jsonResponse = gson.toJson(registereds);
            System.out.println("+++++++json:"+jsonResponse);
            resp.getWriter().write(jsonResponse);
        }finally {
            sqlSession.close();
        }


    }
}
