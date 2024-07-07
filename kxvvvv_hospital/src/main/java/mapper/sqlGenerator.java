package mapper;

import org.apache.ibatis.jdbc.SQL;

public class sqlGenerator {
    public String selectByState(int arg0) {
        return new SQL(){{
            SELECT("user_name,id");
            FROM("user");
            WHERE("state = #{arg0}");
        }}.toString();
    }//*/
}
