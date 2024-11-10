package com.daowen.service;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.junit.Test;

import com.daowen.entity.Users;

public class JdbcTest {

	@Test
	public void test4() {

		// 第一步：创建queryRunner对象，用来操作sql语句

		QueryRunner qr = new QueryRunner();

		// 第二步：创建sql语句

		String sql = "select * from users";

		// 第三步：执行sql语句,params:是sql语句的参数

		// 注意，给sql语句设置参数的时候，按照user表中字段的顺序
//
//		try {
//
		//	List<Users> list = qr.query(sql, new MyHandler());
//
//			//System.out.println(list);
//
//		} catch (SQLException e) {
//
//			e.printStackTrace();
//
//		}

	}
}
