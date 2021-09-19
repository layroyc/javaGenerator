<!--多对一-->
<resultMap id="select${uppercaseEnity}With${oneEntityUpper}RM" type="com.hp.bean.${uppercaseEnity}" extends="BaseResultMap">
    <association property="${oneEntityLower}" javaType="com.hp.bean.${oneEntityUpper}">
           拷贝...........................  1 的 1 方
    </association>
</resultMap>
<select id="select${uppercaseEnity}With${oneEntityUpper}" resultMap="select${uppercaseEnity}With${oneEntityUpper}RM" parameterType="com.hp.bean.${uppercaseEnity}">
    select * from ${lowcaseEnity} duo
    join ${oneEntityLower} yi on duo.的外建id =yi.的主键id
    <where>
        <if test="${lowcaseEnity}Id !=null">
            and ${lowcaseEnity}_id=# {--------------}
        </if>
        <if test="${lowcaseEnity}Name !=null">
            and ${lowcaseEnity}_name=# {------------}
        </if>
    </where>
</select>

// 多的一方  在多(  ${uppercaseEnity}  )的一方的实体类中写 一方的 实体类
private ${oneEntityUpper} ${oneEntityLower};

public ${oneEntityUpper} get${oneEntityUpper}() {
return ${oneEntityLower};
}

public void set${oneEntityUpper}(${oneEntityUpper} ${oneEntityLower}) {
this.${oneEntityLower} = ${oneEntityLower};
}

DAO 层 加上

// 多对一
List<${uppercaseEnity}>  select${uppercaseEnity}With${oneEntityUpper}(${uppercaseEnity} ${lowcaseEnity});


service 层 是实现类 加
public List<${uppercaseEnity}>  select${uppercaseEnity}With${oneEntityUpper}(${uppercaseEnity} ${lowcaseEnity}){
return ${lowcaseEnity}DAO.select${uppercaseEnity}With${oneEntityUpper}(${lowcaseEnity});
};

// controller 层
// 多对一
@RequestMapping("/select${uppercaseEnity}With${oneEntityUpper}")
public Map select${uppercaseEnity}With${oneEntityUpper}(${uppercaseEnity}  ${lowcaseEnity}) {
Map resultMap = new HashMap<>();
List<${uppercaseEnity}> result${uppercaseEnity} = ${lowcaseEnity}Service.select${uppercaseEnity}With${oneEntityUpper}(${lowcaseEnity});
resultMap.put("result${uppercaseEnity}", result${uppercaseEnity});
resultMap.put("code", 200);
resultMap.put("msg", "请求成功");
return resultMap;
}