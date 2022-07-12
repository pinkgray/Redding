package com.kh.redding.common;

import java.io.File;
import java.sql.Date;
import java.text.SimpleDateFormat;

import com.oreilly.servlet.multipart.FileRenamePolicy;

public class MyFileRenamePolicy implements FileRenamePolicy{

	//FileRnamePolicy 를 상속받아서
	@Override
	public File rename(File oldFile) {
		System.out.println(oldFile);
		//파일이 넘어올때마다 현재 시간을 넘겨주고 
		long currentTime = System.currentTimeMillis();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		
		//여러개가 같이 올라갈수 있으므로 random으로 난수를 넣어준다.
		int randomNumber = (int)(Math.random() * 100000);
		
		String name = oldFile.getName(); //ex> flower1.png
		String body = null; //파일명
		String ext = null; //확장자
		int dot = name.lastIndexOf(".");
		if (dot != -1) {
			//확장자가 있을때
			body = name.substring(0, dot); //flower1
			ext = name.substring(dot);  //.PNG
			
		}else {
			//확장자가 없을때
			body = name;
			ext = "";
		}
		
		String fileName = sdf.format(new Date(currentTime)) + randomNumber + ext;
		
		//사진 경로를 가지고 파일을 만들때 이름을 지정해줄수 있는 것이다.
		File newFile = new File(oldFile.getParent(), fileName);
		
		return newFile;
	}

}
