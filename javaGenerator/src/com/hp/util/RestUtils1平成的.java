package com.hp.util;

import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;

import java.io.*;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.Map;

public class RestUtils1平成的 {
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
	 	String[] targetObjectName = {"Admin","JiaoSe","JiaoseQuanxian","QuanXian","RenJiaoSe"};
		String[] targetVariable = {"admin","jiaoSe","jiaoseQuanxian","quanXian","renJiaoSe"};



		// 文件的编译路径
		String classPath = null;
		try {
			classPath = RestUtils1平成的.class.getClassLoader().getResource("").getPath();
			classPath= URLDecoder.decode(classPath, "UTF-8");
		} catch (Exception e) {
			e.printStackTrace();
		}
		Configuration cfg = new Configuration(Configuration.VERSION_2_3_25);
		File fold = new File(classPath+"com/hp/util");
		cfg.setDirectoryForTemplateLoading(fold);
		Template serviceTemplate = cfg.getTemplate("serviceTemplatep.ftl");
		Template serviceImplTemplate = cfg.getTemplate("serviceImplTemplatep.ftl");
		Template restAction = cfg.getTemplate("controllerTemplatep.ftl");



		// 封装变量
		Map root = new HashMap();
		root.put("packagePath", packagePath);

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





		}
	}



	public static void main(String[] args) throws IOException, TemplateException {
			  generateJavaFile();
			  System.out.println("刷新一下项目, 看是否生成成功");
	}
}
