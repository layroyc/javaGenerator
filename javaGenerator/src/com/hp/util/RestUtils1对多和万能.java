package com.hp.util;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.Map;



import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;

public class RestUtils1对多和万能 {
	/**
	 * @Title: generateJavaFile
	 * @Description: TODO(生成service和restAction)
	 * @throws IOException
	 * @throws TemplateException  void 返回类型
	 * @author hp
	 * @version V1.0
	 */
	public  static void generateJavaFile() throws IOException, TemplateException{
		// 文件生成 路径
		String generatePath = "src/com/hp";
		// 包信息
		String packagePath = "com.hp";
		// 对象名称  1 的1方
	 	String[] targetObjectName = {"Person"};
		String[] targetVariable = {"person"};


		// 多的1方的 类名  万能查 下面不用改
		String moreEntityUpper="Orders";
		String moreEntityLower="orders";
		// 文件的编译路径
		String classPath = null;
		try {
			classPath = RestUtils1对多和万能.class.getClassLoader().getResource("").getPath();
			classPath= URLDecoder.decode(classPath, "UTF-8");
		} catch (Exception e) {
			e.printStackTrace();
		}
		Configuration cfg = new Configuration(Configuration.VERSION_2_3_25);
		File fold = new File(classPath+"com/hp/util");
		cfg.setDirectoryForTemplateLoading(fold);
		Template serviceTemplate = cfg.getTemplate("serviceTemplate.ftl");
		Template serviceImplTemplate = cfg.getTemplate("serviceImplTemplate.ftl");
		Template restAction = cfg.getTemplate("controllerTemplate.ftl");
		// 1 对 多封装
		Template oneToMore = cfg.getTemplate("oneToMore.ftl");


		// 封装变量
		Map root = new HashMap();
		root.put("packagePath", packagePath);
		root.put("moreEntityUpper",moreEntityUpper);
		root.put("moreEntityLower",moreEntityLower);
		for(int i=0;i<targetObjectName.length;i++){
			root.put("uppercaseEnity", targetObjectName[i]);
			root.put("lowcaseEnity", targetVariable[i]);
			// service接口
			File serviceFolder = new File(generatePath+"/service/");
			if(!serviceFolder.exists()  && !serviceFolder.isDirectory()){
				serviceFolder.mkdirs();
			}
			File serviceFile = new File(generatePath+"/service/"+targetObjectName[i]+"Service.java");
			if (!serviceFile.exists()) {
				serviceFile.createNewFile();
			}
			OutputStream serviceTemplateOut = new FileOutputStream(serviceFile);
			OutputStreamWriter serviceTemplateWriter = new OutputStreamWriter(serviceTemplateOut);
			BufferedWriter serviceWriter = new BufferedWriter(serviceTemplateWriter);
			serviceTemplate.process(root, serviceWriter);
			serviceWriter.close();
			// service实现类
			File serviceImplFile = new File(generatePath+"/service/"+targetObjectName[i]+"ServiceImpl.java");
			if (!serviceImplFile.exists()) {
				serviceImplFile.createNewFile();
			}
			OutputStream serviceImplTemplateOut = new FileOutputStream(serviceImplFile);
			OutputStreamWriter serviceImplTemplateWriter = new OutputStreamWriter(serviceImplTemplateOut);
			BufferedWriter serviceImplWriter = new BufferedWriter(serviceImplTemplateWriter);
			serviceImplTemplate.process(root, serviceImplWriter);
			serviceImplWriter.close();
			// rest
			File restFolder = new File(generatePath+"/controller/");
			if(!restFolder.exists()  && !restFolder.isDirectory()){
				restFolder.mkdirs();
			}
			File restFile = new File(generatePath+"/controller/"+targetObjectName[i]+"Controller.java");
			if (!restFile.exists()) {
				restFile.createNewFile();
			}

			OutputStream restTemplateOut = new FileOutputStream(restFile);
			OutputStreamWriter restTemplateWriter = new OutputStreamWriter(restTemplateOut);
			BufferedWriter restWriter = new BufferedWriter(restTemplateWriter);
			restAction.process(root, restWriter);
			restWriter.close();
			// 1 对多

			File oneToMoreFile = new File(generatePath+"/controller/"+targetObjectName[i]+"DAO.xml");
			if (!oneToMoreFile.exists()) {
				oneToMoreFile.createNewFile();
			}

			OutputStream oneToMoreTemplateOut = new FileOutputStream(oneToMoreFile);
			OutputStreamWriter oneToMoreTemplateOutWriter = new OutputStreamWriter(oneToMoreTemplateOut);
			BufferedWriter onemoreWriter = new BufferedWriter(oneToMoreTemplateOutWriter);
			oneToMore.process(root,onemoreWriter);
			restWriter.close();




		}
	}



	public static void main(String[] args) throws IOException, TemplateException {
			  generateJavaFile();
			  System.out.println("刷新一下项目, 看是否生成成功");
	}
}
