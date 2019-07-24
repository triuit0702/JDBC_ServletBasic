package com.laptrinhjavaweb.constant;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

public class Demo {

	private int count = 0;
	public int numberFolder(File pathFolder) {
		if (pathFolder.isDirectory()) {
			count++;
			System.out.println(pathFolder.getAbsolutePath());
			File[] list = pathFolder.listFiles();
			
			for (File file : list) {
				numberFolder(file);
			}
		}
		return 0;
	}
	
	
	
	private Object t;

	public Object get() {
		return t;
	}

	public void set(Object t) {
		this.t = t;
	}
	
	
	@SuppressWarnings("unchecked")
	public static void main(String[] args) {
		// TODO Auto-generated method stub

//		Demo test = new Demo();
//		File f = new File("D:\\a");
//		test.numberFolder(f);
//		System.out.println("test test: " + test.count);
		
		Demo type = new Demo();
		type.set(5); 
		type.set("test"); 

	}

}
