package com.situ.crm.service;

import java.util.List;

import com.situ.crm.common.EasyUIDataGrideResult;
import com.situ.crm.pojo.CustomerLoss;
import com.situ.crm.vo.CustomerContribute;

public interface ICustomerService {
	/**
	 * 查询流失客户
	 */
	void checkCustomerLoss();


	EasyUIDataGrideResult findCustomerContribute(Integer page, Integer rows, CustomerContribute customerContribute);
}
