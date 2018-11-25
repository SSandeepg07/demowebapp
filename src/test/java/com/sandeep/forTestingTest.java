package com.sandeep;

import static org.junit.Assert.*;

import org.junit.Test;

public class forTestingTest {

	@Test
	public void isGreaterTest() {
		ForTesting ft= new ForTesting ();
	assertTrue(	"working with positive numbers",ft.isGreater(5,2));
	}

}
