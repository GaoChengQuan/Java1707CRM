package com.situ.crm.service.impl;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.situ.crm.common.EasyUIDataGrideResult;
import com.situ.crm.common.ServerResponse;
import com.situ.crm.dao.CustomerLossMapper;
import com.situ.crm.pojo.CustomerLoss;
import com.situ.crm.pojo.CustomerLossExample;
import com.situ.crm.pojo.CustomerLoss;
import com.situ.crm.pojo.CustomerLossExample;
import com.situ.crm.pojo.CustomerLossExample.Criteria;
import com.situ.crm.service.ICustomerLossService;
import com.situ.crm.util.Util;

@Service
public class CustomerLossServiceImpl implements ICustomerLossService{
	@Autowired
	private CustomerLossMapper customerLossMapper;

	@Override
	public EasyUIDataGrideResult findAll(Integer page, Integer rows, CustomerLoss customerLoss) {
		EasyUIDataGrideResult result = new EasyUIDataGrideResult();
		CustomerLossExample customerLossExample = new CustomerLossExample();
		//1、设置分页 
		PageHelper.startPage(page, rows);
		//2、执行查询
		//rows(分页之后的数据)
		Criteria createCriteria = customerLossExample.createCriteria();
		if (StringUtils.isNotEmpty(customerLoss.getCustomerName())) {
			createCriteria.andCustomerNameLike(Util.formatLike(customerLoss.getCustomerName()));
		}
		if (StringUtils.isNotEmpty(customerLoss.getCustomerManager())) {
			createCriteria.andCustomerManagerLike(Util.formatLike(customerLoss.getCustomerManager()));
		}
		if (customerLoss.getStatus() != null) {
			createCriteria.andStatusEqualTo(customerLoss.getStatus());
		}
		List<CustomerLoss> customerLossList = customerLossMapper.selectByExample(customerLossExample);
		//total
		PageInfo<CustomerLoss> pageInfo = new PageInfo<>(customerLossList);
		int total = (int)pageInfo.getTotal();
		
		result.setTotal(total);
		result.setRows(customerLossList);
		return result;
	}

	@Override
	public ServerResponse delete(String ids) {
		String[] idArray = ids.split(",");
		for (String id : idArray) {
			customerLossMapper.deleteByPrimaryKey(Integer.parseInt(id));
		}
		return ServerResponse.createSuccess("数据已经成功删除");
	}
	
	@Override
	public ServerResponse deleteById(Integer id) {
		if (customerLossMapper.deleteByPrimaryKey(id) > 0) {
			return ServerResponse.createSuccess("删除数据成功 ");
		}
		return ServerResponse.createSuccess("数据已经成功删除");
	}

	@Override
	public ServerResponse add(CustomerLoss customerLoss) {
		if (customerLossMapper.insert(customerLoss) > 0) {
			return ServerResponse.createSuccess("添加成功! ");
		}
		return ServerResponse.createError("添加失败!");
	}

	@Override
	public ServerResponse update(CustomerLoss customerLoss) {
		if (customerLossMapper.updateByPrimaryKey(customerLoss) > 0) {
			return ServerResponse.createSuccess("修改成功! ");
		}
		return ServerResponse.createError("修改失败!");
	}

}
