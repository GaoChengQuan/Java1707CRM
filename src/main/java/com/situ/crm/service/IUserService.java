package com.situ.crm.service;

import com.situ.crm.common.EasyUIDataGrideResult;

public interface IUserService {
	/**
	 * 根据分页信息返回所有数据
	 * @param page 当前页
	 * @param rows 一页多少数据
	 * @return
	 */
	EasyUIDataGrideResult findAll(Integer page, Integer rows);
}
