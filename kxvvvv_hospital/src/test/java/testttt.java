import mapper.*;
import pojo.*;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import utils.MyBatisUtil;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
public class testttt {
    @Test
    public void test1(){
        SqlSession sqlSession= MyBatisUtil.getSqlSession();
    }
}
