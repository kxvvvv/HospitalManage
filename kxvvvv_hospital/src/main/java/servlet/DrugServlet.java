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
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/drug")
public class DrugServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("application/json; charset=utf-8");
        SqlSession sqlSession = MyBatisUtil.getSqlSession();
        DrugMapper drugMapper=sqlSession.getMapper(DrugMapper.class);
        HttpSession httpSession= req.getSession();
        Integer role=(Integer) httpSession.getAttribute("role");
        ;
        try{
            if(role==null||role==1){
                System.out.println("++++++++role:"+role);
                List<Drug> drugs=drugMapper.selectAllDrugs();
                System.out.println("++++++++drugs:"+drugs);
                Gson gson = new Gson(); // 使用Gson库来转换对象为JSON
                String jsonResponse = gson.toJson(drugs);
                System.out.println("+++++++jsonDrug:"+jsonResponse);
                resp.getWriter().write(jsonResponse);
            }

        }finally {
            sqlSession.close();

        }

    }
}
