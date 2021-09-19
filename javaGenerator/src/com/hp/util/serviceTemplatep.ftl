package ${packagePath}.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import ${packagePath}.bean.${uppercaseEnity}Example;
import ${packagePath}.bean.${uppercaseEnity};

public interface ${uppercaseEnity}Service {
   
    long countByExample(${uppercaseEnity}Example example);

    int deleteByExample(${uppercaseEnity}Example example);

    int deleteByPrimaryKey(Integer id);

    int insert(${uppercaseEnity} record);

    int insertSelective(${uppercaseEnity} record);

    List<${uppercaseEnity}> selectByExample(${uppercaseEnity}Example example);

    ${uppercaseEnity} selectByPrimaryKey(Integer id);
  
    int updateByExampleSelective(@Param("record") ${uppercaseEnity} record, @Param("example") ${uppercaseEnity}Example example);

    int updateByExample(@Param("record") ${uppercaseEnity} record, @Param("example") ${uppercaseEnity}Example example);

    int updateByPrimaryKeySelective(${uppercaseEnity} record);

    int updateByPrimaryKey(${uppercaseEnity} record);

}
