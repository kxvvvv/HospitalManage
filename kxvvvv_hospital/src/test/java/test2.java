import mapper.*;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import pojo.*;
import utils.MyBatisUtil;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

public class test2 {

    @Test
    public void testInsertDrug() {
        SqlSession sqlSession = MyBatisUtil.getSqlSession();
        DrugMapper mapper = sqlSession.getMapper(DrugMapper.class);
        Drug drug = new Drug(null, "Aspirin", "Pain Relief", "10.50", LocalDate.now(), LocalDate.now().plusYears(1), "100", "Daily");
        mapper.insertDrug(drug);
        sqlSession.commit();
        sqlSession.close();
    }

    @Test
    public void testDeleteDrugById() {
        SqlSession sqlSession = MyBatisUtil.getSqlSession();
        DrugMapper mapper = sqlSession.getMapper(DrugMapper.class);
        int result = mapper.deleteDrugById(1); // 使用实际的药品ID
        sqlSession.commit();
        sqlSession.close();
        System.out.println("Deleted: " + result);
    }

    @Test
    public void testIncreaseStockQuantity() {
        SqlSession sqlSession = MyBatisUtil.getSqlSession();
        DrugMapper mapper = sqlSession.getMapper(DrugMapper.class);
        mapper.increaseStockQuantity(1, 10); // 使用实际的药品ID和增加数量
        sqlSession.commit();
        sqlSession.close();
    }

    @Test
    public void testDecreaseStockQuantity() {
        SqlSession sqlSession = MyBatisUtil.getSqlSession();
        DrugMapper mapper = sqlSession.getMapper(DrugMapper.class);
        mapper.decreaseStockQuantity(1, 5); // 使用实际的药品ID和减少数量
        sqlSession.commit();
        sqlSession.close();
    }

    @Test
    public void testSelectDrugById() {
        SqlSession sqlSession = MyBatisUtil.getSqlSession();
        DrugMapper mapper = sqlSession.getMapper(DrugMapper.class);
        Drug drug = mapper.selectDrugById(1); // 使用实际的药品ID
        sqlSession.close();
        System.out.println(drug);
    }

    @Test
    public void testSelectAllDrugs() {
        SqlSession sqlSession = MyBatisUtil.getSqlSession();
        DrugMapper mapper = sqlSession.getMapper(DrugMapper.class);
        List<Drug> drugs = mapper.selectAllDrugs();
        sqlSession.close();
        for (Drug drug : drugs) {
            System.out.println(drug);
        }
    }

    @Test
    public void testInsertSection() {
        SqlSession sqlSession = MyBatisUtil.getSqlSession();
        SectionMapper mapper = sqlSession.getMapper(SectionMapper.class);
        Section section = new Section(null, 1, "Cardiology", "Heart related issues");
        mapper.insertSection(section);
        sqlSession.commit();
        sqlSession.close();
    }

    @Test
    public void testDeleteSectionById() {
        SqlSession sqlSession = MyBatisUtil.getSqlSession();
        SectionMapper mapper = sqlSession.getMapper(SectionMapper.class);
        int result = mapper.deleteSectionById(1); // 使用实际的科室ID
        sqlSession.commit();
        sqlSession.close();
        System.out.println("Deleted: " + result);
    }

    @Test
    public void testSelectAllSections() {
        SqlSession sqlSession = MyBatisUtil.getSqlSession();
        SectionMapper mapper = sqlSession.getMapper(SectionMapper.class);
        List<Section> sections = mapper.selectAllSections();
        sqlSession.close();
        for (Section section : sections) {
            System.out.println(section);
        }
    }

    @Test
    public void testUpdateSectionById() {
        SqlSession sqlSession = MyBatisUtil.getSqlSession();
        SectionMapper mapper = sqlSession.getMapper(SectionMapper.class);
        Section section = new Section(1, 1, "Updated Cardiology", "Updated information"); // 使用实际的科室ID
        int result = mapper.updateSectionById(section);
        sqlSession.commit();
        sqlSession.close();
        System.out.println("Updated: " + result);
    }

    @Test
    public void testInsertRate() {
        SqlSession sqlSession = MyBatisUtil.getSqlSession();
        RateMapper mapper = sqlSession.getMapper(RateMapper.class);
        Rate rate = new Rate(null, new BigDecimal("4.5"), "Good doctor", 1, 1, 0, LocalDateTime.now());
        mapper.insertRate(rate);
        sqlSession.commit();
        sqlSession.close();
    }

    @Test
    public void testSelectRatesByDoctorId() {
        SqlSession sqlSession = MyBatisUtil.getSqlSession();
        RateMapper mapper = sqlSession.getMapper(RateMapper.class);
        List<Rate> rates = mapper.selectRatesByDoctorId(1); // 使用实际的医生ID
        sqlSession.close();
        for (Rate rate : rates) {
            System.out.println(rate);
        }
    }

    @Test
    public void testUpdateRateStateTo1() {
        SqlSession sqlSession = MyBatisUtil.getSqlSession();
        RateMapper mapper = sqlSession.getMapper(RateMapper.class);
        int result = mapper.updateRateStateTo1(1); // 使用实际的评价ID
        sqlSession.commit();
        sqlSession.close();
        System.out.println("Rate state updated to 1: " + result);
    }

    @Test
    public void testUpdateRateStateTo2() {
        SqlSession sqlSession = MyBatisUtil.getSqlSession();
        RateMapper mapper = sqlSession.getMapper(RateMapper.class);
        int result = mapper.updateRateStateTo2(1); // 使用实际的评价ID
        sqlSession.commit();
        sqlSession.close();
        System.out.println("Rate state updated to 2: " + result);
    }
}
