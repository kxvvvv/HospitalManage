package servlet;

import mapper.RegisteredMapper;
import org.apache.ibatis.session.SqlSession;
import utils.MyBatisUtil;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.Instant;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/registered")
public class RegisteredServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=UTF-8");
        SqlSession sqlSession= MyBatisUtil.getSqlSession();
        RegisteredMapper registeredMapper=sqlSession.getMapper(RegisteredMapper.class);
        Date appointmentDate=null;
        String dateStr = req.getParameter("appointmentDate");
        System.out.println("dateStr++++++"+dateStr);
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        try {
            // 确保 dateStr 不是 null 或空字符串
            if (dateStr != null && !dateStr.isEmpty()) {
                appointmentDate = formatter.parse(dateStr);
            } else {
                // 处理无效的 dateStr
                throw new IllegalArgumentException("Invalid date string: " + dateStr);
            }
        } catch (ParseException e) {
            // 处理日期格式错误的情况
            throw new RuntimeException("Invalid date format: " + dateStr, e);
        } catch (IllegalArgumentException e) {
            // 处理无效的日期字符串
            throw new RuntimeException("Invalid date string: " + dateStr, e);
        }
        Instant instant = appointmentDate.toInstant();

        // 使用系统默认时区将Instant转换为LocalDate
        LocalDate appointmentDate1 = instant.atZone(ZoneId.systemDefault()).toLocalDate();
        System.out.println("+++++++++date="+appointmentDate1);
//        Timestamp registrationDate = new Timestamp(System.currentTimeMillis());
        LocalDateTime registrationDate=LocalDateTime.now();
        String test=req.getParameter("RegisteredDoctor");
        System.out.println("doctor+++++++++"+req.getParameter("RegisteredDoctor"));
        int  DoctorId=Integer.parseInt(req.getParameter("RegisteredDoctor"));
        int timeFrame=Integer.parseInt(req.getParameter("timeframe"));
        HttpSession session = req.getSession();

        // 从session获取patient登录时存进来的patId
        Integer patientId = (Integer) session.getAttribute("patientId");
        if(patientId == null){//未登录直接挂号的话给跳回登录界面
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/login.jsp");
            if (dispatcher != null) {
                try {
                    dispatcher.forward(req, resp);
                } catch (ServletException | IOException e) {
                    e.printStackTrace();
                }
            } else {
                resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error page not found");
            }
        }else {
        Integer peopleBefore=registeredMapper.countRegister(DoctorId,appointmentDate1,timeFrame);
////////////////////////////////////////////////////////////////////////////////////////////////////////////
        if(peopleBefore>=2){//测试:一个时段一个医生最多两人
            System.out.println("当前时段人数过多");
            String errorMessage = "当前时段人数过多!";
            req.setAttribute("errorMessage", errorMessage);
            // 转发到错误页面
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/error.jsp");
            if (dispatcher != null) {
                try {
                    dispatcher.forward(req, resp);
                } catch (ServletException | IOException e) {
                    e.printStackTrace();
                }
            } else {
                resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error page not found");
            }
        }else {
            Map<String,Object> map=new HashMap<>();
            map.put("doc_id",DoctorId);
            map.put("patient_id",patientId);
            map.put("fee",25);//默认挂号费用为25
            map.put("registration_time",registrationDate);
            map.put("appointment_date",appointmentDate1);
            map.put("timeframe",timeFrame);
            System.out.println("------------一次挂号结束");
            int r=registeredMapper.insertRegistration(map);

            RequestDispatcher dispatcher1 = getServletContext().getRequestDispatcher("/index.jsp");

            if (dispatcher1 != null) {
                try {
                    System.out.println("跳转至index");
                    dispatcher1.forward(req, resp);
                } catch (ServletException | IOException e) {
                    e.printStackTrace();
                }
            } else {
                System.out.println("dispatcher1=null");
                resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error page not found");
            }
            System.out.println("========REGISTEREDcommit");
            sqlSession.commit();
        }
    }}
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=UTF-8");
        SqlSession sqlSession= MyBatisUtil.getSqlSession();
        RegisteredMapper registeredMapper=sqlSession.getMapper(RegisteredMapper.class);
        int regId=Integer.parseInt(req.getParameter("registrationId"));
        registeredMapper.changeStatusByDoctor1(regId);
        System.out.println("========已修改状态:"+regId);
        sqlSession.commit();
    }
}
