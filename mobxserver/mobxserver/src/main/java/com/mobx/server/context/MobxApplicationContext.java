package com.mobx.server.context;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class MobxApplicationContext {
	private static ApplicationContext context = null;
	
	public static void initialize() {
        context = new ClassPathXmlApplicationContext(
    	        new String[] {"appContext.xml"});
        
    	// initialize the data source
    	context.getBean("dataSource");
	}
	
	public static ApplicationContext getApplicationContext() {
		return context;
	}
}
