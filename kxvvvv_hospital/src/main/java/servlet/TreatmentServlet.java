package servlet;

import com.google.gson.*;
import com.google.gson.reflect.TypeToken;
import mapper.RegisteredMapper;
import mapper.medRecordMapper;
import mapper.medRecord_DrugMapper;
import org.apache.ibatis.session.SqlSession;
import pojo.Registered;
import pojo.medRecord_Drug;
import utils.MyBatisUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.lang.reflect.Type;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/treatment")
public class TreatmentServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
        req.setCharacterEncoding("UTF-8");
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
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=UTF-8");
        SqlSession sqlSession = MyBatisUtil.getSqlSession();
        medRecordMapper medMapper=sqlSession.getMapper(mapper.medRecordMapper.class);
        medRecord_DrugMapper medDrugMapper=sqlSession.getMapper(mapper.medRecord_DrugMapper.class);
        String patientName = req.getParameter("patientName");

        Integer patientId= Integer.valueOf(req.getParameter("patientId"));
        Integer docId = Integer.valueOf(req.getParameter("docId"));
//        int registrationId= Integer.parseInt(req.getParameter("registrationId"));
//        String regIdStr = req.getParameter("regId");
//        System.out.println(req.getParameter("patientId")+"+++++++++++++++++++"+req.getParameter("regId"));
//        http://localhost:8080/medRecord.jsp?patientName=%E4%BD%95%E7%91%9E&regId=15&patientId=2&docId=1
//        if (regIdStr != null) {
//            regId = Integer.parseInt(regIdStr);
//            System.out.println("-----------------");
//        } else {
//            // 处理 null 的情况，例如设置默认值或记录错误
//            System.out.println("NNNNNNNNNNNNNNNNNNNNuUUlll");
//        }
        //        Integer regId = Integer.valueOf(req.getParameter("registeredId"));
        System.out.println("======================="+req.getParameter("regId"));

        Date now = new Date();

        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

        String dateNow = dateFormat.format(now);
        String treat=req.getParameter("treatmentPlan");
        System.out.println("++++++++treatment:"+treat);
        String gender = req.getParameter("gender");
        String age = req.getParameter("age");
        Map<String,Object> map=new HashMap<>();
        map.put("patient_id",patientId);
        map.put("doctor_id",docId);
//        map.put("reg_id",registrationId);
        map.put("gender",gender);
        map.put("age",age);
        map.put("treatment_plan",treat);
        map.put("create_time",dateNow);
//        map.put("reg_id",registeredId);
        System.out.println("++++++++map:"+map);

        medMapper.insertMedRecord(map);
//        Map<String, Object> params = new HashMap<>();
        System.out.println("++++++++MEDICALRECORDID"+map.get("medical_record_id"));
//        Integer medicalRecordId = (Integer) map.get("medical_record_id");
        try {
            Gson gson = new Gson();
            String selectedDrugsJson = req.getParameter("selectedDrugsJson");
            System.out.println("++++++++StringJSON:"+selectedDrugsJson);
            System.out.println("++++++++JSON:"+req.getParameter("selectedDrugsJson"));


            // 读取JSON字符串
            if (selectedDrugsJson.startsWith("[")) {
                Type listType = new TypeToken<List<Integer>>(){}.getType(); // 替换 YourType 为相应的类型
                List<Integer> selectedDrugs = gson.fromJson(selectedDrugsJson, listType);
                for(Integer drugid:selectedDrugs){
                    Map<String,Object> map1=new HashMap<>();
                    map1.put("medical_record_id",map.get("medical_record_id"));
                    map1.put("drug_id",drugid);
                    medDrugMapper.insertpatientanddrug(map1);
                }
            } else if (selectedDrugsJson.startsWith("{")) {
                // 预期 JSON 是一个对象
                JsonObject jsonObject = gson.fromJson(selectedDrugsJson, JsonObject.class);
                System.out.println("++++++++JsonObject"+jsonObject);
                int id = jsonObject.get("drugId").getAsInt();
                JsonElement jsonElement = gson.fromJson(selectedDrugsJson, JsonElement.class);
                Map<String,Object> map1=new HashMap<>();
                map1.put("medical_record_id",map.get("medical_record_id"));
                map1.put("drug_id",id);
                medDrugMapper.insertpatientanddrug(map1);
                // 从 jsonObject 中提取数据
            } else {
                System.out.println("没插入药品");
            }// 设置响应内容类型和编码
            resp.setContentType("text/html;charset=UTF-8");

        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println("med commit+");
        resp.sendRedirect("/treatment.jsp");
        sqlSession.commit();

    }
}
