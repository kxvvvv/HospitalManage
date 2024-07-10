package mapper;

import java.util.List;
import pojo.Section;

public interface SectionMapper {
    int insertSection(Section section);

    int deleteSectionById(Integer id);

    List<Section> selectAllSections();

    int updateSectionById(Section section);
}