package servlet;

import com.google.gson.Gson;
import com.google.gson.stream.JsonReader;
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
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/showdrug")
public class DrugforAdminServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //防止中文乱码
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=UTF-8");
        // 处理查询药品列表和查询单个药品的请求
        resp.setContentType("application/json");
        SqlSession sqlSession = MyBatisUtil.getSqlSession();
        DrugMapper drugMapper = sqlSession.getMapper(DrugMapper.class);
        try {
            List<Drug> drugs = drugMapper.selectAllDrugs();
            Gson gson = new Gson();
            String jsonResponse = gson.toJson(drugs);
            resp.getWriter().write(jsonResponse);
        } finally {
            sqlSession.close();
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=UTF-8");
        SqlSession sqlSession = MyBatisUtil.getSqlSession();
        try {
            DrugMapper drugMapper = sqlSession.getMapper(DrugMapper.class);
            String action = req.getParameter("action");
            System.out.println(action);

            req.setCharacterEncoding("UTF-8");
            resp.setCharacterEncoding("UTF-8");
            String drugId = req.getParameter("drugId");
            String quantity;

            System.out.println(drugId);

            Integer drugId1 = null;
            Integer quantity1 = null;
            if (!"delete".equals(action)) {
                quantity = req.getParameter("quantity");
                System.out.println("01"+quantity);
                System.out.println("02");
                System.out.println(quantity);
                drugId1 = Integer.parseInt(drugId);
                quantity1 = Integer.parseInt(quantity);
            } else {
                drugId1 = Integer.parseInt(drugId); // 仅解析drugId
            }
            System.out.println("555555555555555555555");

            Gson gson = new Gson();
            System.out.println(drugId1);
            if (quantity1 != null) {
                System.out.println(quantity1);
            }

            String jsonResponse;
            switch (action) {
                case "increase":
                    if (quantity1 != null) { // 确保quantity1已解析
                        drugMapper.increaseStockQuantity(drugId1, quantity1);
                        jsonResponse = gson.toJson("Stock increased successfully");
                    } else {
                        jsonResponse = gson.toJson("Quantity parameter is missing");
                    }
                    resp.getWriter().write(jsonResponse);
                    break;
                case "decrease":
                    if (quantity1 != null) {
                        drugMapper.decreaseStockQuantity(drugId1, quantity1);
                        jsonResponse = gson.toJson("Stock decreased successfully");
                    } else {
                        jsonResponse = gson.toJson("Quantity parameter is missing");
                    }
                    resp.getWriter().write(jsonResponse);
                    break;
                case "delete":
                    drugMapper.deleteDrugById(drugId1); // 不需要quantity参数
                    jsonResponse = gson.toJson("Drug deleted successfully");
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