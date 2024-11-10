package com.daowen.service;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.daowen.jdbc.simplecrud.ResultHandler;


public class RecordcountHandler  implements ResultHandler<Integer> {

	@Override
	public Integer handle(ResultSet rs) throws SQLException {
		int count=0;
		while (rs.next()) {
			count=rs.getInt(1);
		}
		return count;
	}

}
