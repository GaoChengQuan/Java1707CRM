package com.situ.crm.test;

import org.apache.log4j.Logger;
import org.junit.Test;

public class Log4jTest {

	@Test
	public void test() {
		Logger logger = Logger.getLogger(Log4jTest.class);
		logger.error("Error");
		logger.warn("Warn");
		logger.info("Info");
		logger.debug("Debug");
	}
}
