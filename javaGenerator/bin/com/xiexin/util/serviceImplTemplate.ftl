package ${packagePath}.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ${packagePath}.bean.${uppercaseEnity}Example;
import ${packagePath}.bean.${uppercaseEnity};
import ${packagePath}.dao.${uppercaseEnity}DAO;
@Service("${lowcaseEnity}Service")
public class ${uppercaseEnity}ServiceImpl implements ${uppercaseEnity}Service{
	@Autowired(required = false)
	private ${uppercaseEnity}DAO ${lowcaseEnity}DAO;
	public long countByExample(${uppercaseEnity}Example example){
    	return ${lowcaseEnity}DAO.countByExample(example);
    }

	public int deleteByExample(${uppercaseEnity}Example example){
    	return ${lowcaseEnity}DAO.deleteByExample(example);
    }

	public int deleteByPrimaryKey(Integer id){
    	return ${lowcaseEnity}DAO.deleteByPrimaryKey(id);
    }

	public int insert(${uppercaseEnity} record){
    	return ${lowcaseEnity}DAO.insert(record);
    }

	public int insertSelective(${uppercaseEnity} record){
    	return ${lowcaseEnity}DAO.insertSelective(record);
    }

	public List<${uppercaseEnity}> selectByExample(${uppercaseEnity}Example example){
    	return ${lowcaseEnity}DAO.selectByExample(example);
    }

	public ${uppercaseEnity} selectByPrimaryKey(Integer id){
    	return ${lowcaseEnity}DAO.selectByPrimaryKey(id);
    }
  
	public int updateByExampleSelective(${uppercaseEnity} record, ${uppercaseEnity}Example example){
    	return ${lowcaseEnity}DAO.updateByExampleSelective(record, example);
    }

	public int updateByExample(${uppercaseEnity} record, ${uppercaseEnity}Example example){
    	return ${lowcaseEnity}DAO.updateByExample(record, example);
    }

	public int updateByPrimaryKeySelective(${uppercaseEnity} record){
    	return ${lowcaseEnity}DAO.updateByPrimaryKeySelective(record);
    }

	public int updateByPrimaryKey(${uppercaseEnity} record){
    	return ${lowcaseEnity}DAO.updateByPrimaryKey(record);
    }

	// 1对多
	public List<${uppercaseEnity}>  select${uppercaseEnity}And${moreEntityUpper}(${uppercaseEnity}   ${lowcaseEnity}){
		return 	${lowcaseEnity}DAO.select${uppercaseEnity}And${moreEntityUpper}(${lowcaseEnity});
	}
}
