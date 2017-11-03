package com.situ.crm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.situ.crm.dao.CustomerLossMapper;
import com.situ.crm.dao.CustomerMapper;
import com.situ.crm.dao.CustomerOrderMapper;
import com.situ.crm.pojo.Customer;
import com.situ.crm.pojo.CustomerLoss;
import com.situ.crm.pojo.CustomerOrder;
import com.situ.crm.service.ICustomerService;
@Service
public class CustomerServiceImpl implements ICustomerService{
	@Autowired
	private CustomerMapper customerMapper;
	
	@Autowired
	private CustomerOrderMapper customerOrderMapper;
	
	@Autowired
	private CustomerLossMapper customerLossMapper;

	@Override
	public void checkCustomerLoss() {
		System.out.println("CustomerServiceImpl.checkCustomerLoss()");
		//1. 查找流失客户
		List<Customer> customerList = customerMapper.findLossCustomer();
		for (Customer customer : customerList) {
			//2. 实例化CustomerLoss
			CustomerLoss customerLoss = new CustomerLoss();
			customerLoss.setCustomerNo(customer.getNum());//客户编号
			customerLoss.setCustomerName(customer.getName());//客户名称
			customerLoss.setCustomerManager(customer.getManagerName());//客户经理
			//3.查找指定客户最近的一次订单
			CustomerOrder customerOrder = customerOrderMapper.findLastOrderByCustomerId(customer.getId());
			if (customerOrder == null) {
				customerLoss.setLastOrderTime(null);
			} else {
				customerLoss.setLastOrderTime(customerOrder.getOrderDate());
			}
			//4.添加到客户流失表里面
			customerLossMapper.insert(customerLoss);
			//5、客户表中客户状态修改为1：流失状态
			customer.setStatus(1);
			customerMapper.updateByPrimaryKeySelective(customer);
		}
	}

}
