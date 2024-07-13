package servlet;

import com.google.gson.Gson;
import mapper.DrugMapper;
import org.apache.ibatis.session.SqlSession;
import pojo.Drug;
import utils.MyBatisUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/drugSearch")
public class drugSearchServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=UTF-8");
        String term = req.getParameter("term"); // 获取搜索关键字
        // 对 term 进行模糊搜索的 SQL 查询
        SqlSession sqlSession = MyBatisUtil.getSqlSession();
        DrugMapper drugMapper = sqlSession.getMapper(DrugMapper.class);
        List<Drug> drugs = drugMapper.searchDrugsByDrugName(term);
        Gson gson = new Gson();
        String jsonResponse = gson.toJson(drugs);
        System.out.println("++++++++"+jsonResponse);
        resp.getWriter().write(jsonResponse);
    }
}
