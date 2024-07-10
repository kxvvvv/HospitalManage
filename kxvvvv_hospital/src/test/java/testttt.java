//import mapper.*;
//import org.apache.ibatis.io.Resources;
//import org.apache.ibatis.session.SqlSessionFactory;
//import org.apache.ibatis.session.SqlSessionFactoryBuilder;
//import pojo.*;
//import org.apache.ibatis.session.SqlSession;
//import org.junit.Test;
//import utils.MyBatisUtil;
//
//import java.io.IOException;
//import java.io.InputStream;
//import java.time.LocalDate;
//import java.time.LocalDateTime;
//import java.util.HashMap;
//import java.util.List;
//import java.util.Map;
//public class testttt {
//    @Test
//    public void test1() {
//        SqlSession sqlSession = MyBatisUtil.getSqlSession();
//    }
//
//    @Test
//    public void test2() {
//        SqlSession sqlSession = MyBatisUtil.getSqlSession();
//
//        System.out.println(1145919810);
//    }
//
//    @Test
//    public void test3() {
//        //验证查病历
//        SqlSession sqlSession = MyBatisUtil.getSqlSession();
//        medRecordMapper mapper = sqlSession.getMapper(medRecordMapper.class);
//        Integer pid = 1;
//        List<medRecord> records = mapper.selectMedRecordByPid(pid);
//// 输出结果
//        for (medRecord record : records) {
//            System.out.println("Medical Record ID: " + record.getMedical_record_id());
//            System.out.println("Patient ID: " + record.getPatient_id());
//            System.out.println("Doctor ID: " + record.getDoctor_id());
//            System.out.println("Gender: " + record.getGender());
//            System.out.println("Age: " + record.getAge());
//            System.out.println("Treatment Plan: " + record.getTreatment_plan());
//            System.out.println("Create Time: " + record.getCreate_time());
//            System.out.println("Registration ID: " + record.getReg_id());
//            System.out.println("------------------------------");
//        }
//    }
//
//    @Test
//    public void test4() {
//        //验证插入病历
//        SqlSession sqlSession = MyBatisUtil.getSqlSession();
//        medRecordMapper mapper = sqlSession.getMapper(medRecordMapper.class);
//        medRecord record = new medRecord(12, 1, 1, "man", 30, "Take medication twice a day", LocalDateTime.now(), 2);
//// 使用 SqlSession 的 update 方法来执行插入操作
//        sqlSession.update("insertMedRecord", record);
//
//// 提交事务，如果需要的话
//        sqlSession.commit();
//
//// 关闭 SqlSession
//        sqlSession.close();
//    }
//
//    @Test
//    public void test5() {
//        SqlSession sqlSession = MyBatisUtil.getSqlSession();
//        RegisteredMapper mapper = sqlSession.getMapper(RegisteredMapper.class);
////        Registered reg = new Registered(1,LocalDate.now(), 1);
////        int count= mapper.countRegister(1,LocalDate.now(), 1);
//        LocalDate appointment_date = LocalDate.now();
//        int count;
//        count = mapper.countRegister(1, appointment_date, 1);
//        System.out.println(count);
//    }
//
////    @Test
////    public void test6() {
////        SqlSession sqlSession = MyBatisUtil.getSqlSession();
////        RegisteredMapper mapper = sqlSession.getMapper(RegisteredMapper.class);
////        Registered registration = new Registered(
////                null, // registration_id 由数据库自动生成
////                1, // doc_id
////                1, // patient_id
////                "10", // fee
////                0, // status
////                LocalDateTime.now(), // registration_time
////                LocalDate.now(), // appointment_date
////                1 // timeframe
////        );
////        mapper.insertRegistration(registration);
////        sqlSession.commit();
////        int count = mapper.countRegister(1, LocalDate.now(), 1);
////        System.out.println("挂号成功数量: " + count);
////        sqlSession.close();
////    }
////
////    @Test
////    public void test7() {
////        SqlSession sqlSession = MyBatisUtil.getSqlSession();
////        RegisteredMapper mapper = sqlSession.getMapper(RegisteredMapper.class);
////
////        int registration_id = 1; // 假设存在registration_id为1的记录
////
////        mapper.changeStatusByDoctor1(registration_id);
////        sqlSession.commit();
////        sqlSession.close();
////    }
////
////    @Test
////    public void test8() {
////        SqlSession sqlSession = MyBatisUtil.getSqlSession();
////        RegisteredMapper mapper = sqlSession.getMapper(RegisteredMapper.class);
////
////        int registration_id = 1; // 假设存在registration_id为1的记录
////
////        mapper.changeStatusByDoctor2(registration_id);
////        sqlSession.commit();
////        sqlSession.close();
////    }
//
//    @Test
//    public void test9() {
//        SqlSession sqlSession = MyBatisUtil.getSqlSession();
//        medRecord_DrugMapper mapper = sqlSession.getMapper(medRecord_DrugMapper.class);
//        Integer mid = 1;
//        List<medRecord_Drug> medRecord_drug = mapper.selectpatientdrugByMid(mid);
//// 输出结果
//        for (medRecord_Drug recordDrug : medRecord_drug) {
//            System.out.println("Medical Record ID: " + recordDrug.getMedical_record_id());
//            System.out.println("Drud ID: " + recordDrug.getDrug_id());
//            System.out.println("------------------------------");
//        }
//    }
//
//
//    @Test
//    public void test10() {
//        SqlSession sqlSession = MyBatisUtil.getSqlSession();
//        medRecord_DrugMapper mapper = sqlSession.getMapper(medRecord_DrugMapper.class);
//        medRecord_Drug medRecord_drug = new medRecord_Drug(3,2);
//        mapper.insertpatientanddrug(medRecord_drug);
//        sqlSession.commit();
//        //测试是否插入成功
//        Integer mid = 3;
//        List<medRecord_Drug> medRecord_drug2 = mapper.selectpatientdrugByMid(mid);
//// 输出结果
//        for (medRecord_Drug recordDrug : medRecord_drug2) {
//            System.out.println("Medical Record ID: " + recordDrug.getMedical_record_id());
//            System.out.println("Drud ID: " + recordDrug.getDrug_id());
//            System.out.println("------------------------------");
//        }
//        sqlSession.close();
//    }
//
//
//
//}