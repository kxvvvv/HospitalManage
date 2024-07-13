package servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

import mapper.DrugMapper;
import org.apache.ibatis.session.SqlSession;
import pojo.Drug;
import utils.MyBatisUtil;

@WebServlet("/addDrug")
public class AdddrugServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //防止中文乱码
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("application/json; charset=utf-8");
        try (SqlSession sqlSession = MyBatisUtil.getSqlSession()) {
            DrugMapper drugMapper = sqlSession.getMapper(DrugMapper.class);
            Drug drug = new Drug();
            String drugName = req.getParameter("drugName");
            String function = req.getParameter("function");
            double drugPrice = Double.parseDouble(req.getParameter("drugPrice"));
            String inboundDate = req.getParameter("inboundDate");
            String expirationDate = req.getParameter("expirationDate");
            int stockQuantity = Integer.parseInt(req.getParameter("stockQuantity"));

            drug.setDrugName(drugName);
            drug.setFunction(function);
            drug.setDrugPrice(String.valueOf(drugPrice));
            drug.setInboundDate(inboundDate);
            drug.setExpirationDate(expirationDate);
            drug.setStockQuantity(stockQuantity);

            drugMapper.insertDrug(drug);

            resp.sendRedirect("/showdrug.jsp");

            sqlSession.commit();


        } catch (Exception e) {
            e.printStackTrace();
            // Handle exception, e.g., by showing an error page or message
        }
    }
}