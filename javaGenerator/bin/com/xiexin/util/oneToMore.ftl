
<!--1对多拷贝到 1 方的  xml 中  别忘了 再 1方的实体类 写集合啊!!!  变量命名格式: xxxList
            private  List<${moreEntityUpper}>  ${moreEntityLower}List;
-->
<resultMap id="select${uppercaseEnity}And${moreEntityUpper}RM" type="com.xiexin.bean.${uppercaseEnity}" extends="BaseResultMap">
    <collection property="${moreEntityLower}List" ofType="com.xiexin.bean.${moreEntityUpper}">
        <!-- 自己拷贝多方的  头过来  -->
    </collection>
</resultMap>
<select id="select${uppercaseEnity}And${moreEntityUpper}" resultMap="select${uppercaseEnity}And${moreEntityUpper}RM" parameterType="com.xiexin.bean.${uppercaseEnity}">
    select  * from  ${lowcaseEnity} yi  join ${moreEntityLower} duo on  yi.${lowcaseEnity}一方的主键id = duo.${lowcaseEnity}多的外建
    <where>
        <if test="${lowcaseEnity}Id !=null">
           and ${lowcaseEnity}_id=# {xxxxxxxxxxxxxxxxxxxxxxxxx}
        </if>
        <if test="${lowcaseEnity}Name !=null">
            and  ${lowcaseEnity}_name=# {xxxxxxxxxxxxxxxxxxxxxxxxxxx}
        </if>
    </where>
</select>


万能查

<select id="select${uppercaseEnity}With表1表2表3..." parameterType="传一个dto" resultType="map">
    select * from 表1 b1
    join 表2 b2 on b1.主键id = b2.主键id
    join 表3 b3 on b2.主键id = b3.主键id
    join 表4 b4 on b3.主键id = b4.主键id
    join..........自己根据需求加吧 , 下面 if 判断就是 controller中map的key
    where 1=1

    <if test="studentName改掉 != null and studentName改掉啊!='' ">and b1.student_name改掉啊 = # { }</if>


</select>