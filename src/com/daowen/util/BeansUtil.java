package com.daowen.util;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.daowen.jdbc.simplecrud.Adapter;
import com.daowen.jdbc.simplecrud.MybatisAdapter;
import com.daowen.jdbc.simplecrud.SimpleJdbc;

public class BeansUtil {

	private static ApplicationContext ctx=null;
	static{
		ctx=new ClassPathXmlApplicationContext("applicationContext.xml");
	}
	public static <T> T getBean(String name,Class<T> clz){
	   
//		WebApplicationContext ctx = ContextLoader.getCurrentWebApplicationContext();
//		if(ctx==null)
//			return null;
		Object obj= ctx.getBean(name);
		
	   if(clz.isInstance(obj)){
	        return clz.cast(obj);
	    }
	    return null;
		
	}

	public static SimpleJdbc  getSimpleJdbcBean(){
		Adapter adapter=new MybatisAdapter("applicationContext.xml", "sqlSessionFactoryBean");
	    return new SimpleJdbc(adapter);
	}
	
	
}
