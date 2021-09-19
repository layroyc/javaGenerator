package com.hp.util;

import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;

import java.io.*;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.Map;

public class RestUtils多对1 {
    /**
     * @throws IOException
     * @throws TemplateException void 返回类型
     * @Title: generateJavaFile
     * @Description: TODO(生成service和restAction)
     * @author hp
     * @version V1.0
     */
    public static void generateJavaFile() throws IOException, TemplateException {
        // 文件生成 路径
        String generatePath = "src/com/hp";
        // 包信息
        String packagePath = "com.hp";
        // 对象名称  多 的1方
        String[] targetObjectName = {"Student"};
        String[] targetVariable = {"student"};
        // 1的1方的 类名
        String oneEntityUpper = "Clss";
        String oneEntityLower = "clss";
        // 文件的编译路径
        String classPath = null;
        try {
            classPath = RestUtils多对1.class.getClassLoader().getResource("").getPath();
            classPath = URLDecoder.decode(classPath, "UTF-8");
        } catch (Exception e) {
            e.printStackTrace();
        }
        Configuration cfg = new Configuration(Configuration.VERSION_2_3_25);
        File fold = new File(classPath + "com/hp/util");
        cfg.setDirectoryForTemplateLoading(fold);

        // 1 对 多封装
        Template oneToMore = cfg.getTemplate("moreToOne.ftl");


        // 封装变量
        Map root = new HashMap();
        root.put("packagePath", packagePath);
        root.put("oneEntityUpper", oneEntityUpper);
        root.put("oneEntityLower", oneEntityLower);

        root.put("uppercaseEnity", targetObjectName[0]);
        root.put("lowcaseEnity", targetVariable[0]);

        // 1 对多

        File moreToOneFile = new File(generatePath + "/controllerMore/" + targetObjectName[0] + "DAO.xml");
        if (!moreToOneFile.exists()) {
            moreToOneFile.createNewFile();
        }

        OutputStream oneToMoreTemplateOut = new FileOutputStream(moreToOneFile);
        OutputStreamWriter oneToMoreTemplateOutWriter = new OutputStreamWriter(oneToMoreTemplateOut);
        BufferedWriter moreOneWriter = new BufferedWriter(oneToMoreTemplateOutWriter);
        oneToMore.process(root, moreOneWriter);
        moreOneWriter.close();

    }


    public static void main(String[] args) throws IOException, TemplateException {
        generateJavaFile();
        System.out.println("刷新一下项目, 看是否生成成功");
    }
}
