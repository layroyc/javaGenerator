package ${packagePath}.controller;


import java.util.List;
import java.util.HashMap;
import java.util.Map;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
 
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
 
 

import ${packagePath}.bean.${uppercaseEnity};
 

import ${packagePath}.service.${uppercaseEnity}Service;

@RestController
@RequestMapping("/${lowcaseEnity}")
public class ${uppercaseEnity}Controller {
	@Autowired
	private ${uppercaseEnity}Service ${lowcaseEnity}Service;
	
    @RequestMapping(value="/countByExample",method=RequestMethod.GET)
	public ResponseEntity<Map> countByExample(@ModelAttribute ${uppercaseEnity} ${lowcaseEnity}){
        ${uppercaseEnity}Example example = new ${uppercaseEnity}Example();
    	Long count = ${lowcaseEnity}Service.countByExample(example);
        Map map = new HashMap();
		map.put(HttpResponseKeys.RETURN_CODE, HttpResponseKeys.RETURN_OK);
		map.put(HttpResponseKeys.RETURN_DATA,count);
    	return new ResponseEntity<Map>(map, HttpStatus.CREATED);
    }
    @RequestMapping(value="/deleteByExample",method=RequestMethod.DELETE)
	public ResponseEntity<Map> deleteByExample(@ModelAttribute ${uppercaseEnity} ${lowcaseEnity}){
		HttpHeaders responseHeaders = new HttpHeaders();
        ${uppercaseEnity}Example example = new ${uppercaseEnity}Example();
        if(null!=${lowcaseEnity}){
        	List<Criterion> criteria = example.createCriteria().getAllCriteria();
        }
        Integer count = ${lowcaseEnity}Service.deleteByExample(example);
        Map map = new HashMap();
		map.put(HttpResponseKeys.RETURN_CODE, HttpResponseKeys.RETURN_OK);
		map.put(HttpResponseKeys.RETURN_DATA,count);
    	return new ResponseEntity<Map>(map, HttpStatus.CREATED);
    }
    @RequestMapping(value="/deleteByPrimaryKey",method=RequestMethod.DELETE)
	public ResponseEntity<Map> deleteByPrimaryKey(String id){
        Integer count = ${lowcaseEnity}Service.deleteByPrimaryKey(id);
        Map map = new HashMap();
		map.put(HttpResponseKeys.RETURN_CODE, HttpResponseKeys.RETURN_OK);
		map.put(HttpResponseKeys.RETURN_DATA,count);
    	return new ResponseEntity<Map>(map, HttpStatus.CREATED);
    }
    @RequestMapping(value="/insert",method=RequestMethod.POST)
	public ResponseEntity<Map> insert(@ModelAttribute ${uppercaseEnity} ${lowcaseEnity}){
        Integer count = ${lowcaseEnity}Service.insert(${lowcaseEnity});
        Map map = new HashMap();
		map.put(HttpResponseKeys.RETURN_CODE, HttpResponseKeys.RETURN_OK);
		map.put(HttpResponseKeys.RETURN_DATA,count);
    	return new ResponseEntity<Map>(map, HttpStatus.CREATED);
    }
    @RequestMapping(value="/insertSelective",method=RequestMethod.POST)
	public ResponseEntity<Map> insertSelective(@ModelAttribute ${uppercaseEnity} ${lowcaseEnity}){
        Integer count = ${lowcaseEnity}Service.insertSelective(${lowcaseEnity});
        Map map = new HashMap();
		map.put(HttpResponseKeys.RETURN_CODE, HttpResponseKeys.RETURN_OK);
		map.put(HttpResponseKeys.RETURN_DATA,count);
    	return new ResponseEntity<Map>(map, HttpStatus.CREATED);
    }
    @RequestMapping(value="/selectByExample",method=RequestMethod.GET)
	public ResponseEntity<Map> selectByExample(@ModelAttribute ${uppercaseEnity} ${lowcaseEnity}){
        ${uppercaseEnity}Example example = new ${uppercaseEnity}Example();
        if(${lowcaseEnity}!=null){
        	List<Criterion> criteria = example.createCriteria().getAllCriteria();
        }
        List<${uppercaseEnity}> list = ${lowcaseEnity}Service.selectByExample(example);
    	Map map = new HashMap();
		map.put(HttpResponseKeys.RETURN_CODE, HttpResponseKeys.RETURN_OK);
		map.put(HttpResponseKeys.RETURN_DATA,list);
    	return new ResponseEntity<Map>(map, HttpStatus.CREATED);
    }
    @RequestMapping(value="/selectByPrimaryKey",method=RequestMethod.GET)
	public ResponseEntity<Map> selectByPrimaryKey(String id){
		${uppercaseEnity} ${lowcaseEnity} = ${lowcaseEnity}Service.selectByPrimaryKey(id);
    	Map map = new HashMap();
		map.put(HttpResponseKeys.RETURN_CODE, HttpResponseKeys.RETURN_OK);
		map.put(HttpResponseKeys.RETURN_DATA,${lowcaseEnity});
    	return new ResponseEntity<Map>(map, HttpStatus.CREATED);
    }
  
    @RequestMapping(value="/updateByPrimaryKey",method=RequestMethod.PUT)
	public ResponseEntity<Map> updateByPrimaryKey(@ModelAttribute ${uppercaseEnity} record){
		Integer updateId = ${lowcaseEnity}Service.updateByPrimaryKey(record);
		Map map = new HashMap();
		map.put(HttpResponseKeys.RETURN_CODE, HttpResponseKeys.RETURN_OK);
		map.put(HttpResponseKeys.RETURN_DATA,updateId);
    	return new ResponseEntity<Map>(map, HttpStatus.CREATED); 
    }
    @RequestMapping(value="/updateByExampleSelective",method=RequestMethod.PUT)
    public ResponseEntity<Map> updateByExampleSelective(@ModelAttribute ${uppercaseEnity} ${lowcaseEnity}){
        ${uppercaseEnity}Example example = new ${uppercaseEnity}Example();
        if(${lowcaseEnity}!=null){
			List<Criterion> criteria = example.createCriteria().getAllCriteria();
        }
        Integer updateId = ${lowcaseEnity}Service.updateByExampleSelective(${lowcaseEnity},example);
    	Map map = new HashMap();
		map.put(HttpResponseKeys.RETURN_CODE, HttpResponseKeys.RETURN_OK);
		map.put(HttpResponseKeys.RETURN_DATA,updateId);
    	return new ResponseEntity<Map>(map, HttpStatus.CREATED);
    }
    @RequestMapping(value="/updateByPrimaryKeySelective",method=RequestMethod.PUT)
    public ResponseEntity<Map> updateByPrimaryKeySelective(@ModelAttribute ${uppercaseEnity} ${lowcaseEnity}){
        Integer updateId = ${lowcaseEnity}Service.updateByPrimaryKeySelective(${lowcaseEnity});
    	Map map = new HashMap();
		map.put(HttpResponseKeys.RETURN_CODE, HttpResponseKeys.RETURN_OK);
		map.put(HttpResponseKeys.RETURN_DATA,updateId);
    	return new ResponseEntity<Map>(map, HttpStatus.CREATED);
    }
    @RequestMapping(value="/updateByExample",method=RequestMethod.PUT)
    public ResponseEntity<Map> updateByExample(@ModelAttribute ${uppercaseEnity} ${lowcaseEnity}){
        ${uppercaseEnity}Example example = new ${uppercaseEnity}Example();
        if(${lowcaseEnity}!=null){
        	List<Criterion> criteria = example.createCriteria().getAllCriteria();
        }
        Integer updateId = ${lowcaseEnity}Service.updateByExample(${lowcaseEnity},example);
    	Map map = new HashMap();
		map.put(HttpResponseKeys.RETURN_CODE, HttpResponseKeys.RETURN_OK);
		map.put(HttpResponseKeys.RETURN_DATA,updateId);
    	return new ResponseEntity<Map>(map, HttpStatus.CREATED);
    }
}