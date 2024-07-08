import mapper.*;
import pojo.*;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import utils.MyBatisUtil;
import utils.MyBatisUtil;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

public class testttt {
    @Test
    public void testPatReg(){
        SqlSession sqlSession= MyBatisUtil.getSqlSession();
        PatientMapper patientMapper=sqlSession.getMapper(PatientMapper.class);
        Map<String, Object> map=new HashMap<>();
        map.put("patAcc","acc1forTest");
        map.put("patPwd","pwd1forTest");
        map.put("name","测试1");
        map.put("address","MistyLake");
        map.put("phone","999999");
        map.put("id","3713999");
        map.put("balance",0);
        map.put("age",9);
        int res=patientMapper.patientRegister(map);
        sqlSession.commit();
    }
    @Test
    public void testPatLogin(){
        SqlSession sqlSession= MyBatisUtil.getSqlSession();
        PatientMapper patientMapper=sqlSession.getMapper(PatientMapper.class);
        Map<String ,Object> map=new HashMap<>();
        map.put("patAcc","acc1forTest");
        map.put("patPwd","pwd1forTest");
        int res=patientMapper.patientLogin(map);
        System.out.println("======result:"+res);
        sqlSession.commit();
    }
}
