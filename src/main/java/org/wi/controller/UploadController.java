package org.wi.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.UUID;

import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.wi.model.AttachFileDTO;

import net.coobird.thumbnailator.Thumbnailator;





@Controller
public class UploadController {
	
	
	@RequestMapping(value="/uploadForm", method=RequestMethod.GET)
	public void uploadForm() {
		
	}
	@RequestMapping(value="/uploadFormAction", method=RequestMethod.POST)
	public void uploadFormPost(MultipartFile[] uploadFile) {
		
		// 폴더 경로
		String uploadFolder="D:\\upload";
		
		// for(배열명 : 변수명)
		
		for(MultipartFile multipartFile : uploadFile ) {
		System.out.println(multipartFile.getOriginalFilename());
		System.out.println(multipartFile.getSize());
		
		
		// 파일 저장
		// 						   어느폴더에(D:\\upload) 		어떤파일이름으로(지정된 파일의 명)	   
		File saveFile = new File(uploadFolder,multipartFile.getOriginalFilename());
		
		// 						D:\\upload\사진명에 파일을 전송(transferTo )
		try {// transferTo() 메소드에 예외가 있으면
 		multipartFile.transferTo(saveFile);
			
		}catch(Exception e) {// 예외처리
			System.out.println(e.getMessage());
		}
		}
	}
	@RequestMapping(value="/uploadAjax", method=RequestMethod.GET)
	public void uploadAjax() {
	}
	// 년/월/일 폴더 생성하는 메서드
	private String getFolder() {
		
		// 현재 날짜 추출(Thu Aug 24 09:23:12 KST 2022)
		Date date = new Date();
		System.out.println("No Format 현재날짜 :" + date);
		// Thu Aug 24 09:23:12 KST 2022 -> 2022-08-24
		SimpleDateFormat sdf= new SimpleDateFormat("yyyy-MM-dd");
		// 현재 날짜와 날짜형식을 연결.
		String str = sdf.format(date); // 2022-08-24
		System.out.println("Format 적용 현재날짜 :" + str);
		// 2022-08-24 -> 2022\08\24
		return str.replace("-", "\\");
		
	}
	// 내가 올리고자 하는 파일이 이미지 파일인지 아닌지 구분하는 메서드 선언
	//      반환타입 		메서드명              타입 변수명
	private boolean checkImageType(File file) {
		try {
			// probeContentType(파일경로) : 파일경로에 있는 파일타입을 알아내는 메서드
			String contentType = Files.probeContentType(file.toPath());
			System.out.println("contentType="+contentType);
			// 파일타입이 image 이면 true, 그 이외에는 false
			return contentType.startsWith("image");
			
		}catch(IOException e) {
			e.printStackTrace();
			
		}
		return false;
		
	}
	
	@RequestMapping(value="/uploadAjaxAction", method=RequestMethod.POST)
	public ResponseEntity<ArrayList<AttachFileDTO>> uploadAjaxPost(MultipartFile[] uploadFile) {
		
		// AttachFileDTO 클래스 포함
		ArrayList<AttachFileDTO> list = new ArrayList<>();
		// 폴더 경로
		String uploadFolder="D:\\upload";
		
		// 서버 업로드 경로와 getFolder 메서드의 날짜 문자열을 이어서 하나의 폴더 생성
		File uploadPath = new File(uploadFolder , getFolder());
		
		// 폴더 생성(D:\\upload\\현재날짜)
		if(uploadPath.exists() == false) {// uploadPath가 존재하지 않으면.
			
			uploadPath.mkdirs();
		}
		// for(배열명 : 변수명)
		
		for(MultipartFile multipartFile : uploadFile ) {
			
			// AttachFileDTO 클랴스의 새로운 주소를 반복적으로 생성하여
			// ArratList에 저장
			AttachFileDTO attachVo = new AttachFileDTO();
			
			System.out.println(multipartFile.getOriginalFilename());
			System.out.println(multipartFile.getSize());
			
			// 실제 파일명(multipartFile.getOriginalFilename())
			// UUID 적용(UUID_multipartFile.getOriginalFilename());
			UUID uuid = UUID.randomUUID();
			System.out.println("UUID="+uuid.toString());
			
			// AttachfileDTO의 uploadPath 변수에 저장()
			attachVo.setUploadPath(getFolder());
			// AttachfileDTO의 fileName 변수에 저장()
			attachVo.setFileName(multipartFile.getOriginalFilename());
			// AttachfileDTO의 uuid 변수에 저장()
			attachVo.setUuid(uuid.toString());
			
			
			// 파일 저장
			// 						   어느폴더에(D:\\upload\\현재날짜), 어떤파일이름으로(지정된 파일의 명)	   
			File saveFile = new File(uploadPath,uuid.toString()+"_"+multipartFile.getOriginalFilename());
			
			// 						D:\\upload\사진명에 파일을 전송(transferTo)
			try {// transferTo() 메소드에 예외가 있으면
				
	 		multipartFile.transferTo(saveFile); // 서버로 원본파일 전송
	 		
	 		
	 		// 내가 서버에 올리고자 하는 파일이 이미지이면,
	 		if(checkImageType(saveFile)) {
	 			
	 			// AttachfileDTO의 img 변수에 저장()
				attachVo.setImage(true);
	 			// 파일 생성
	 			FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath,"s_"+uuid.toString()+"_"+multipartFile.getOriginalFilename()));
	 		
	 			// 섬네일 형식의 파일 생성
	 			Thumbnailator.createThumbnail(multipartFile.getInputStream(),thumbnail,100,100);
	 			
	 			thumbnail.close();
	 			
	 			
	 		}//  checkImageType 메서드 끝
	 		// AttachfileVo에 저장된 데이터를 배열에 추가(add메소드)
	 		list.add(attachVo);
			}catch(Exception e) {// 예외처리
				System.out.println(e.getMessage());
			}
		}
		System.out.println(list);
		return new ResponseEntity<>(list,HttpStatus.OK);
		
		
	}// Ajax 끝
	// 이미지 주소 생성
	@RequestMapping(value="/display", method=RequestMethod.GET)
	public ResponseEntity<byte[]> getFile(String fileName){
		
		File file = new File("D:\\upload\\"+fileName);
		
		ResponseEntity<byte[]> result = null;
		
		HttpHeaders headers = new  HttpHeaders();
		
		try {
			
			headers.add("Content-Type",Files.probeContentType(file.toPath()));
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file),
					headers,HttpStatus.OK);
		
		} catch (Exception e) {

			e.printStackTrace();
		}
		
		return result;
	}// getFile 메서드  끝
	// 다운로드 주소 생성
	@RequestMapping(value="/download", method=RequestMethod.GET)
	public ResponseEntity<Resource>	downloadFile(String fileName){
		
		Resource resource = new FileSystemResource("D:\\upload\\"+fileName);
		
		// 다운로드 시 파일의 이름을 처리 
		String resourceName =resource.getFilename();
		
		HttpHeaders headers = new  HttpHeaders();
		try {
			// 다운로드 파일이름 한글일 때, 깨지지 않게 하기 위한 설정
			headers.add("Content-Disposition","attachment;filename="
			+new String(resourceName.getBytes("utf-8"),"ISO-8859-1"));
		}catch(UnsupportedEncodingException e) {
			e.printStackTrace();
		}
			
		return new ResponseEntity<Resource>(resource,headers,HttpStatus.OK);
	}

	
}