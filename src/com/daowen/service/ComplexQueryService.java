package com.daowen.service;

import java.sql.SQLException;
import java.text.MessageFormat;

import org.springframework.stereotype.Service;

import com.daowen.jdbc.simplecrud.DataTable;
import com.daowen.jdbc.simplecrud.SimpleJdbc;
import com.daowen.util.BeansUtil;

public class ComplexQueryService {

	private SimpleJdbc jdbc=null;
	public ComplexQueryService(){
		jdbc=BeansUtil.getSimpleJdbcBean();
	}
	/**
	 * 查询记录集合
	 * @param nativeSql
	 * @param pageIndex
	 * @param pageSize
	 * @return
	 */
	public DataTable query(String nativeSql,int pageIndex,int pageSize){
	
		String limitSql=MessageFormat.format(" limit {0} ,{1} ",(pageIndex-1)*pageSize,pageSize);
		String allSql=nativeSql+limitSql;
		System.out.println("allSql="+allSql);
		DataTable dt=null;
		try {
			dt = jdbc.query(allSql, null);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return dt;
		
	}
	
	
	/**
	 * 查询记录数目
	 * @param nativeSql
	 * @return
	 */
	public int queryRecordCount(String nativeSql){
		
		String recordcountsql=MessageFormat.format("select count(*) from ({0} ) temp  ",nativeSql);
		System.out.println("recordcountsql="+recordcountsql);
		
		int count=0;
		try {
			count = jdbc.query(nativeSql, new RecordcountHandler());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return count;
	}
	 
	
	
	
}
