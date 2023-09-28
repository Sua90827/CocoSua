package com.suamall.project.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.suamall.project.dto.ReviewDTO;
import com.suamall.project.repository.ReviewRepository;

@Service
public class ReviewService {
@Autowired ReviewRepository repo;

public String reviewSave(ReviewDTO dto) {
	if( dto.getFile().isEmpty()) {
		dto.setImage_file_name("nan");
	}else {
		dto.setImage_file_name(saveFile(dto.getFile()));
	}
	int result = repo.saveReview(dto);
	String msg = "", url="";
	if(result ==1) {
		msg = "리뷰 작성이 완료되었습니다.";
		url = "/orderList";
	}else {
		msg="문제가 발생했습니다";
		url = "window.history.back()";
		return getAlertHistoryBack(msg, url);
	}
	
	return getAlertLocation(msg, url);
	
}

public List<ReviewDTO> getAllReview(int prdt_id) {
	List<ReviewDTO> result = repo.getAllReview(prdt_id);
	return result;
}
public String IMAGE_REPO = "D:/cocosua/project/project/src/main/webapp/resources/reviewImg";

public String saveFile(MultipartFile image_file_name) {
	SimpleDateFormat fo=new SimpleDateFormat("yyyyMMddHHmmss-");
	String sysFileName = fo.format(new Date());
	sysFileName = sysFileName + image_file_name.getOriginalFilename();
	File saveFile = new File(IMAGE_REPO+"/"+sysFileName);
	try {
		image_file_name.transferTo(saveFile);
	}catch (Exception e) {
		e.printStackTrace();
	}
	return sysFileName;
}

public String getAlertHistoryBack(String msg, String url) {
	String message = "<script>alert('" + msg + "');";
	message += url + "</script>";
	return message;
}

public String getAlertLocation(String msg, String url) {
	String message = "<script>alert('" + msg + "');";
	message += "location.href='" +url + "';</script>";
	return message;
}

public void deleteImage(String fileName) {
	File file = new File(IMAGE_REPO+"/"+fileName);
	file.delete();
}

public String deleteReview(int review_no) {
	int result = repo.deleteReview(review_no);
	System.out.println("여기는 review_no. ====>"+review_no);
	deletePic(review_no);
	String msg = "", url="";
	if(result ==1) {
		msg = "리뷰가 삭제되었습니다.";
		url = "history.back()";
	}else {
		msg="문제가 발생했습니다";
		url = "window.history.back()";
	}
	
	return getAlertHistoryBack(msg, url);
}

//	private String image_file_name;
//	private MultipartFile file;
private void deletePic(int review_no) {
	System.out.println("여기는 deletePic 넘어온 review_no.======>"+review_no);
	ReviewDTO db = repo.getReviewDTO(review_no);
	System.out.println("pathOfPic=>>>>>>>>>>>>>>>>>>>"+ db.getImage_file_name());
	//여기 위에줄에서 걸림... ㅠㅠ
	
}

public ReviewDTO getReviewDTO(int review_no) {
	ReviewDTO result = repo.getReviewDTO(review_no);
	return result;
}

public String SaveModifiedReview(ReviewDTO dto) {
	ReviewDTO db = new ReviewDTO();
	if( dto.getFile().isEmpty()) {
		dto.setImage_file_name("nan");
	}else {
		if(db.getFile().equals(dto.getFile())){
			
		}
		dto.setImage_file_name(saveFile(dto.getFile()));
	}
	int result = repo.saveReview(dto);
	String msg = "", url="";
	if(result ==1) {
		msg = "리뷰 작성이 완료되었습니다.";
		url = "/orderList";
	}else {
		msg="문제가 발생했습니다";
		url = "window.history.back()";
		return getAlertHistoryBack(msg, url);
	}
	
	return getAlertLocation(msg, url);
	

}
}
