package utils;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.IOException;
import java.io.InputStream;
public class MyBatisUtil {
    private static SqlSessionFactory factory = null;
    static {
        try {
            // 1、定义 mybatis 主配置文件的位置， 从类路径开始的相对路径 */
            String configXml = "mybatis-config.xml";
            //2、读取主配置文件，使用 mybatis 框架中的 Resources 类 */
            InputStream inputStream = Resources.getResourceAsStream(configXml);
            //3、创建 SqlSessionFactory 对象，使用 SqlSessionFactoryBuilder 类
            factory = new SqlSessionFactoryBuilder().build(inputStream);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    /**
     * 获取 SqlSession 的静态方法
     * @return
     */
    public static SqlSession getSqlSession(){
        SqlSession sqlSession = null;
        if(null != factory){
            sqlSession = factory.openSession();
        }
        return sqlSession;
    }
}
