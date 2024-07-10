package mapper;

import java.util.List;
import pojo.Rate;

public interface RateMapper {
    int insertRate(Rate rate);

    List<Rate> selectRatesByDoctorId(Integer doctorId);

    int updateRateStateTo1(Integer rateId);

    int updateRateStateTo2(Integer rateId);
}