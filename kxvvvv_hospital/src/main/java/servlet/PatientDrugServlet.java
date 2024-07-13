package servlet;

import mapper.DoctorMapper;
import mapper.DrugMapper;
import mapper.medRecordMapper;
import mapper.medRecord_DrugMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.SqlSession;
import pojo.Drug;
import pojo.medRecord_Drug;
import utils.MyBatisUtil;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@WebServlet("/patientdrug")
public class PatientDrugServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //在患者看病历时出现查看开的药品的按钮，按下后运行这个，出现药品
        //先根据病历号查到药品号
        //再根据查到的药品号查药品
        SqlSession sqlSession = MyBatisUtil.getSqlSession();
        medRecord_DrugMapper medRecord_drugMapper = sqlSession.getMapper(medRecord_DrugMapper.class);

        //得到病历号
        String medRecord = req.getParameter("medRecord_id");


        List<medRecord_Drug> medRecordDrugs = medRecord_drugMapper.selectpatientdrugByMid(Integer.valueOf(medRecord));

        List<Integer> drugIds = medRecordDrugs.stream()
                .map(medRecord_Drug::getDrug_id) // 假设 getDrugId() 是返回 drug_id 的方法
                .collect(Collectors.toList());

        List<Drug> drugs = new ArrayList<>();

        DrugMapper drugMapper = sqlSession.getMapper(DrugMapper.class);

        for (Integer drugId : drugIds) {
            Drug drug = drugMapper.selectDrugById(drugId); // 假设 selectDrugById 是根据 drug_id 查询药品的方法
            drugs.add(drug);
        }

        req.setAttribute("drugs", drugs);

        RequestDispatcher dispatcher = req.getRequestDispatcher("/patientdrug.jsp");
        dispatcher.forward(req, resp);
    }
}
