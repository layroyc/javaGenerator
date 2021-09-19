package ${packagePath}.controller;

import ${packagePath}.bean.${uppercaseEnity};
import ${packagePath}.bean.${uppercaseEnity}Example;
import ${packagePath}.service.${uppercaseEnity}Service;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

@Controller
@RequestMapping("/${lowcaseEnity}")
public class ${uppercaseEnity}Controller{
@Autowired(required = false)
private ${uppercaseEnity}Service ${lowcaseEnity}Service;




// 登录的功能!!!
@RequestMapping("/login")
public String login (${uppercaseEnity} ${lowcaseEnity}, HttpSession session ,  ModelMap modelMap){

${uppercaseEnity}Example example = new ${uppercaseEnity}Example();
${uppercaseEnity}Example.Criteria criteria = example.createCriteria();
criteria.and自己找账号EqualTo(${lowcaseEnity}.get自己找账号());
criteria.and自己写密码EqualTo(${lowcaseEnity}.get自己写密码());

List<${uppercaseEnity}> userList = ${lowcaseEnity}Service.selectByExample(example);
    if (userList.size() ==1) {
    //登录正确
${uppercaseEnity} loginUser= userList.get(0);
    session.setAttribute("loginUser",loginUser);
   // 如果要 跳转到jsp 的列表页面, 一定要查询全部, 使用 ModelMap 带到前端.
List<${uppercaseEnity}> ${lowcaseEnity}list = ${lowcaseEnity}Service.selectByExample(null);

modelMap.put("${lowcaseEnity}list",${lowcaseEnity}list);
return "${lowcaseEnity}_list_ui";
    }else{
    //密码不对
    return "登录的错误的jsp名称";
    }

    };


  // 对应的 登录 页面   login_ui.jsp

  //         用户名:  <input type="text"      name="改成你的用户实体的名字属性"> <br/>
  //         密码:    <input type="password" name="改成你的用户实体的密码属性"> <br/>
  //             <input type="submit" value="登录">





// 按 主键id 查询单个对象
@RequestMapping("/findOne")  // 前端必须传id
public String selectByPrimaryKey(Integer id ,  ModelMap modelMap ){
${uppercaseEnity} ${lowcaseEnity} = ${lowcaseEnity}Service.selectByPrimaryKey(id);
    // 查询单个 可以 放入到  单个修改的 界面
modelMap.put("${lowcaseEnity}",${lowcaseEnity});
return "${lowcaseEnity}_one_ui";
}




// 带参数全查
@RequestMapping("/selectAll")
public String selectAll(ModelMap modelMap , ${uppercaseEnity}  ${lowcaseEnity} ){
${uppercaseEnity}Example example = new  ${uppercaseEnity}Example();
${uppercaseEnity}Example.Criteria criteria = example.createCriteria();



if (null!=${lowcaseEnity}.getYYYYYYYY()&&!"".equals(${lowcaseEnity}.getYYYYYYY())){
criteria.andXXXXX(${lowcaseEnity}.getXXXXX());
}// 根据 前面的数据查询. 比如 姓名, 如果没有. 就 删除这个判断


List<${uppercaseEnity}> ${lowcaseEnity}list = ${lowcaseEnity}Service.selectByExample(example);

    modelMap.put("${lowcaseEnity}list",${lowcaseEnity}list);
    return "${lowcaseEnity}_list_ui";
    }


//
//         对应的 list 页面
//
// <%@ page contentType="text/html;charset=UTF-8" language="java" %>
// <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
// <html>
// <head>
//     <title>班级的全查</title>
// </head>
// <body>
// <div>
//     <div>新增</div>
//     <div>
//         <table>
//             <tr>
//                 <th>班级名称</th>
//                 <th>班级人数</th>
//                 <th>创建时间</th>
//                 <th>操作</th>
//             </tr>
//             <%--注意: 开头要引入   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
//             <c:forEach  items="$删掉我{写后台的modelMap带的值}" var="随便起名sb">
//                 <tr>
//                     <td>$删掉我{sb.该类的属性}</td>
//                     <td>$删掉我{sb.该类的属性}</td>
//                     <td>$删掉我{sb.该类的属性}</td>
//                     <td>$删掉我{sb.该类的属性}</td>
//                 </tr>
//             </c:forEach>
//         </table>
//     </div>
// </div>
// </body>
// </html>
//




//增
@RequestMapping("/insert")
public String insert(${uppercaseEnity} ${lowcaseEnity}){

int i =  ${lowcaseEnity}Service.insertSelective(${lowcaseEnity});
if(i==1){
// 添加成功后, 跳转到 增加成功后的界面
return "add_ok_ui";
}else{

return "add_error_ui";
}
}

/**
自己创建  2个  jsp 就可以了.
*/


// 删
// 删除订单  根据 主键 id 删除
@RequestMapping("/deleteById")
public String deleteById(@RequestParam(value = "id") Integer id) {

int i = ${lowcaseEnity}Service.deleteByPrimaryKey(id);
if (i == 1) {
//删除成功
return "del_ok_ui";
} else {
 //删除失败
return "del_error_ui";
}
}

// 批量删除
@RequestMapping("/deleteBatch")
public String deleteBatch(@RequestParam(value = "idList[]") List<Integer> idList) {
    for (Integer integer : idList) {
    this.deleteById(integer);
    }
    //删除成功
    return "del_ok_ui";
    }


    // 改

    @RequestMapping("/update")
    public String update( ${uppercaseEnity}  ${lowcaseEnity}) {

    int i = ${lowcaseEnity}Service.updateByPrimaryKeySelective( ${lowcaseEnity});
    if (i ==1 ) {
        //修改成功
    return "${lowcaseEnity})_list_ui";
    } else {
    // 修改失败 ;
    return "update_error_ui";
    }
    }

    // 退出
    @RequestMapping("/logOut")
    public String logOut( HttpSession session) {
                    session.invalidate();
        return "登录的的jsp的名称";
    }



    }
