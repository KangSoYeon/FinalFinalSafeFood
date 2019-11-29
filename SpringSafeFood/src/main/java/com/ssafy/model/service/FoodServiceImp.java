package com.ssafy.model.service;

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.ssafy.model.dao.FoodDAO;
import com.ssafy.model.dto.Food;
import com.ssafy.model.dto.FoodException;

@Service
public class FoodServiceImp implements FoodService {
	
	@Autowired
	private FoodDAO dao;
	@Override
	public Food search(String code) {
		try {
			Food food = dao.search(code);
			if(food == null) {
				throw new FoodException("등록되지 않은 식품입니다.");
			} else {
				return food;
			}
			
		}catch (Exception e) {
			e.printStackTrace();
			throw new FoodException();
		}
	}

	@Override
	public List<Food> searchAll() {
		try {
			return dao.searchAll();
		} catch (Exception e) {
			e.printStackTrace();
			throw new FoodException();
		}
	}
	@Override
	public List<Food> searchAllName(String name) {
		try {
			return dao.searchAllName(name);
		} catch (Exception e) {
			e.printStackTrace();
			throw new FoodException();
		}
	}

	@Override
	public List<Food> searchAllMaker(String maker) {
		try {
			return dao.searchAllMaker(maker);
		} catch (Exception e) {
			e.printStackTrace();
			throw new FoodException();
		}
	}

	@Override
	public List<Food> searchAllMaterial(String material) {
		try {
			return dao.searchAllMaterial(material);
		} catch (Exception e) {
			e.printStackTrace();
			throw new FoodException();
		}
	}

	@Override
	public void insert(Food food) {
		File realFile = null;
		String imglo ="";
		try {
			MultipartFile fileup = food.getFileup();
			if(food==null) throw new FoodException("추가할 상품 정보를 전부 입력하세요.");
			if(fileup !=null) {
				String rfileName = fileup.getOriginalFilename();
				String sfileName = String.format("%d%s",System.currentTimeMillis(),rfileName);
				String savePath = String.format("%s/img/%s",food.getDir(),sfileName);
				imglo = String.format("img/%s",rfileName);
				realFile = new File(savePath);
				fileup.transferTo(realFile);
			}
			
			food.setImg(imglo);
			dao.insert(food);
		} catch(FoodException e) {
			throw e;
		} catch (Exception e) {
			if(realFile !=null) {
				if(realFile.exists()) realFile.delete();
			}
			e.printStackTrace();
			throw new FoodException();
		}
		
	}
	
	@Override
	public void update(Food food) {				// 주석 부분은 파일 업로드 필요시 주석 풀어 쓸것
//		File realFile = null;
		String imglo = "";
		
		try {
			MultipartFile fileup = food.getFileup();
			if(food==null) { throw new FoodException("수정할 상품 정보를 전부 입력하세요."); }
			if(fileup !=null) {
				String rfileName = fileup.getOriginalFilename();
				String sfileName = String.format("%d%s",System.currentTimeMillis(),rfileName);
//				String savePath = String.format("%s/img/%s",food.getDir(),sfileName);
				imglo = String.format("img/%s",rfileName);
//				realFile = new File(savePath);
//				fileup.transferTo(realFile);
				if(!rfileName.equals("")) food.setImg(imglo);
			}
			dao.update(food);
		} catch(FoodException e) {
			throw e;
		} catch (Exception e) {
//			if(realFile !=null) {
//				if(realFile.exists()) realFile.delete();
//			}
			e.printStackTrace();
			throw new FoodException();
		}
	}
	
	@Override
	public void delete(String code) {
		try {
			if(code==null) throw new FoodException("상품 삭제 중 에러 발생");
			dao.delete_cart(code);
			dao.delete_mydiet(code);
			dao.delete(code);
		} catch (FoodException e) {
			throw e;
		} 
		catch (Exception e) {
			e.printStackTrace();
			throw new FoodException();
		}
		
	}

	

}
