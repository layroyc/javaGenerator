package ${packagePath}.controller;

import ${packagePath}.bean.${uppercaseEnity};
import ${packagePath}.bean.${uppercaseEnity}Example;
import ${packagePath}.service.${uppercaseEnity}Service;
import ${packagePath}.util.Msg;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

@RestController
@RequestMapping("/${lowcaseEnity}")
public class ${uppercaseEnity}Controller{
    @Autowired
   private ${uppercaseEnity}Service ${lowcaseEnity}Service;

    //查全
    @RequestMapping(value="/countByExample",method= RequestMethod.GET)
    public Msg countByExample(@ModelAttribute ${uppercaseEnity} ${lowcaseEnity}){
                 ${uppercaseEnity}Example example = new ${uppercaseEnity}Example();
                 long l = ${lowcaseEnity}Service.countByExample(example);
                return Msg.success().add("data",l);


    }
/*    @RequestMapping(value="/deleteByExample",method=RequestMethod.DELETE)
    public Msg deleteByExample(@ModelAttribute ${uppercaseEnity} ${lowcaseEnity}){

        ${uppercaseEnity}Example example = new ${uppercaseEnity}Example();


        Integer count = ${lowcaseEnity}Service.deleteByExample(example);

        return Msg.success().add("data",count);
    }*/

    @RequestMapping(value="/deleteByPrimaryKey",method=RequestMethod.DELETE)
    public Msg deleteByPrimaryKey(Integer id){

          Integer count = ${lowcaseEnity}Service.deleteByPrimaryKey(id);

            return Msg.success().add("data",count);
    }

   /* @RequestMapping(value="/insert",method=RequestMethod.POST)
    public Msg insert(@ModelAttribute ${uppercaseEnity} ${lowcaseEnity}){
        Integer count = ${lowcaseEnity}Service.insert(${lowcaseEnity});
        return Msg.success().add("data",count);

    }*/

    @RequestMapping(value="/insertSelective",method=RequestMethod.POST)
    public Msg insertSelective(@ModelAttribute ${uppercaseEnity} ${lowcaseEnity}){
        Integer count = ${lowcaseEnity}Service.insertSelective(${lowcaseEnity});
        return Msg.success().add("data",count);
    }

    @RequestMapping(value="/selectByExample",method=RequestMethod.GET)
    public Msg selectByExample(@ModelAttribute ${uppercaseEnity} ${lowcaseEnity}){
        ${uppercaseEnity}Example example = new ${uppercaseEnity}Example();
        List<${uppercaseEnity}> list = ${lowcaseEnity}Service.selectByExample(example);
        return Msg.success().add("data",list);
    }




    @RequestMapping(value="/selectByPrimaryKey",method=RequestMethod.GET)
    public Msg selectByPrimaryKey(Integer id){
        ${uppercaseEnity} ${lowcaseEnity} = ${lowcaseEnity}Service.selectByPrimaryKey(id);
        return Msg.success().add("data",${lowcaseEnity});
    }

    @RequestMapping(value="/updateByPrimaryKey",method=RequestMethod.PUT)
    public Msg updateByPrimaryKey(@ModelAttribute  ${uppercaseEnity} record){
        Integer updateId = ${lowcaseEnity}Service.updateByPrimaryKey(record);

        return  Msg.success().add("data",updateId);
    }
    @RequestMapping(value="/updateByExampleSelective",method=RequestMethod.PUT)
    public Msg updateByExampleSelective(@ModelAttribute ${uppercaseEnity} ${lowcaseEnity}){
        ${uppercaseEnity}Example example = new ${uppercaseEnity}Example();

        Integer updateId = ${lowcaseEnity}Service.updateByExampleSelective(${lowcaseEnity},example);
        return  Msg.success().add("data",updateId);
    }
    @RequestMapping(value="/updateByPrimaryKeySelective",method=RequestMethod.PUT)
    public Msg updateByPrimaryKeySelective(@ModelAttribute ${uppercaseEnity} ${lowcaseEnity}){
        Integer updateId = ${lowcaseEnity}Service.updateByPrimaryKeySelective(${lowcaseEnity});
        return Msg.success().add("data",updateId);
    }
    @RequestMapping(value="/updateByExample",method=RequestMethod.PUT)
    public Msg updateByExample(@ModelAttribute ${uppercaseEnity} ${lowcaseEnity}){
        ${uppercaseEnity}Example example = new ${uppercaseEnity}Example();

        Integer updateId = ${lowcaseEnity}Service.updateByExample(${lowcaseEnity},example);
        return Msg.success().add("data",updateId);
    }


}
