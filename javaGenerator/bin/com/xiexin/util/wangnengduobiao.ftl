<!-- 不要忘记 dao 层写方法哦 -->

<select id="select${uppercaseEnity}With表1表2表3..." parameterType="传一个dto" resultType="map">
    select * from 表1 b1
    join 表2 b2 on b1.主键id = b2.主键id
    join 表3 b3 on b2.主键id = b3.主键id
    join 表4 b4 on b3.主键id = b4.主键id
    join..........自己根据需求加吧 , 下面 if 判断就是 controller中map的key
    where 1=1

    <if test="studentName != null and studentName!='' ">and b1.student_name = #{studentName}</if>


</select>