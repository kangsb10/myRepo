package kr.or.ddit.utiles;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import kr.or.ddit.vo.BulletinBoardFileItemVO;
import kr.or.ddit.vo.CommunityFileItemVO;
import kr.or.ddit.vo.CultivationMethodFileItemVO;
import kr.or.ddit.vo.NoticeFileItemVO;
import kr.or.ddit.vo.FarmingFileItemVO;
import kr.or.ddit.vo.NongupinFileItemVO;
import kr.or.ddit.vo.ShoppingFileItemVO;

import org.apache.commons.io.FilenameUtils;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class AttachFileMapper {

   
   public List<CultivationMethodFileItemVO> mapping(MultipartFile[] items,
         String ctvt_mth_no){
   List<CultivationMethodFileItemVO> cultivationMethodFileItemList =new ArrayList<CultivationMethodFileItemVO>();
   
   if(items != null) {
	   CultivationMethodFileItemVO cultivationMethodFileItemInfo;
      for(MultipartFile item : items) {
         if(item.getSize() > 0){
        	 cultivationMethodFileItemInfo = new CultivationMethodFileItemVO();
        	 cultivationMethodFileItemInfo.setCtvt_mth_no(ctvt_mth_no);
            
            // file name
            // c:\temp\a.png [찾아보기] => c:\temp\a.png or a.png 
            // a.png 반환
            String ctvt_mth_file_name = FilenameUtils.getName(item.getOriginalFilename());
            // 업로드 실제 파일명
            cultivationMethodFileItemInfo.setCtvt_mth_file_name(ctvt_mth_file_name);
            
            // file_save_name
            // fileName = a.png
            // a
            String baseName = FilenameUtils.getBaseName(ctvt_mth_file_name);
            // png
            String extension = FilenameUtils.getExtension(ctvt_mth_file_name);
            // a57943846453123489798456.png
            //UUID(Univerally Unique Identifier) - 128bit 유일키 랜덤 설정
            String genID = UUID.randomUUID().toString().replace("-", "");
            // a57943846453123489798456.png
            String ctvt_mth_file_save_name= baseName + genID + "." + extension;
            cultivationMethodFileItemInfo.setCtvt_mth_file_save_name(ctvt_mth_file_save_name);
            
            cultivationMethodFileItemInfo.setCtvt_mth_file_content_type(item.getContentType());
            cultivationMethodFileItemInfo.setCtvt_mth_file_size(String.valueOf(item.getSize()));
            
            cultivationMethodFileItemList.add(cultivationMethodFileItemInfo);
            
            saveFile(ctvt_mth_file_save_name, item);
         }
      }
   }
   return cultivationMethodFileItemList;
}
   public List<ShoppingFileItemVO> mappings(MultipartFile[] items,
		   String goods_id){
	   List<ShoppingFileItemVO> shoppingFileItemList =new ArrayList<ShoppingFileItemVO>();
	   
	   if(items != null) {
		   ShoppingFileItemVO shoppingFileItemInfo;
		   for(MultipartFile item : items) {
			   if(item.getSize() > 0){
				   shoppingFileItemInfo = new ShoppingFileItemVO();
				   shoppingFileItemInfo.setGoods_id(goods_id);
				   
				   // file name
				   // c:\temp\a.png [찾아보기] => c:\temp\a.png or a.png 
				   // a.png 반환
				   String goods_file_name = FilenameUtils.getName(item.getOriginalFilename());
				   // 업로드 실제 파일명
				   shoppingFileItemInfo.setGoods_file_name(goods_file_name);
				   
				   // file_save_name
				   // fileName = a.png
				   // a
				   String baseName = FilenameUtils.getBaseName(goods_file_name);
				   // png
				   String extension = FilenameUtils.getExtension(goods_file_name);
				   // a57943846453123489798456.png
				   //UUID(Univerally Unique Identifier) - 128bit 유일키 랜덤 설정
				   String genID = UUID.randomUUID().toString().replace("-", "");
				   // a57943846453123489798456.png
				   String goods_file_save_name= baseName + genID + "." + extension;
				   shoppingFileItemInfo.setGoods_file_save_name(goods_file_save_name);
				   
				   shoppingFileItemInfo.setGoods_file_content_type(item.getContentType());
				   shoppingFileItemInfo.setGoods_file_size(String.valueOf(item.getSize()));
				   
				   shoppingFileItemList.add(shoppingFileItemInfo);
				   
				   saveFile(goods_file_save_name, item);
			   }
		   }
	   }
	   return shoppingFileItemList;
   }
   public List<NoticeFileItemVO> NoticeFileItemmapping(MultipartFile[] items,
		   String notice_no){
	   List<NoticeFileItemVO> noticeFileItemList =new ArrayList<NoticeFileItemVO>();
	   
	   if(items != null) {
		   NoticeFileItemVO noticeFileitemInfo;
		   for(MultipartFile item : items) {
			   if(item.getSize() > 0){
				   noticeFileitemInfo = new NoticeFileItemVO();
				   noticeFileitemInfo.setNotice_no(notice_no);
				   
				   // file name
				   // c:\temp\a.png [찾아보기] => c:\temp\a.png or a.png 
				   // a.png 반환
				   String cmmnty_file_name = FilenameUtils.getName(item.getOriginalFilename());
				   // 업로드 실제 파일명
				   noticeFileitemInfo.setCmmnty_file_name(cmmnty_file_name);
				   
				   // file_save_name
				   // fileName = a.png
				   // a
				   String baseName = FilenameUtils.getBaseName(cmmnty_file_name);
				   // png
				   String extension = FilenameUtils.getExtension(cmmnty_file_name);
				   // a57943846453123489798456.png
				   //UUID(Univerally Unique Identifier) - 128bit 유일키 랜덤 설정
				   String genID = UUID.randomUUID().toString().replace("-", "");
				   // a57943846453123489798456.png
				   String cmmnty_file_save_name= baseName + genID + "." + extension;
				   noticeFileitemInfo.setCmmnty_file_save_name(cmmnty_file_save_name);
				   
				   noticeFileitemInfo.setCmmnty_file_content_type(item.getContentType());
				   noticeFileitemInfo.setCmmnty_file_size(String.valueOf(item.getSize()));
				   
				   noticeFileItemList.add(noticeFileitemInfo);
				   
				   saveFile(cmmnty_file_save_name, item);
			   }
		   }
	   }
	   return noticeFileItemList;
   }
   
   public List<FarmingFileItemVO> mappingss(MultipartFile[] items,
	         String farm_diary_no){
	   List<FarmingFileItemVO> farmingFileItemList =new ArrayList<FarmingFileItemVO>();
	   
	   if(items != null) {
		   FarmingFileItemVO farmingFileItemInfo;
	      for(MultipartFile item : items) {
	         if(item.getSize() > 0){
	        	 farmingFileItemInfo = new FarmingFileItemVO();
	        	 farmingFileItemInfo.setFarm_diary_no(farm_diary_no);
	            
	            // file name
	            // c:\temp\a.png [찾아보기] => c:\temp\a.png or a.png 
	            // a.png 반환
	            String farm_diary_file_name = FilenameUtils.getName(item.getOriginalFilename());
	            // 업로드 실제 파일명
	            farmingFileItemInfo.setFarm_diary_file_name(farm_diary_file_name);
	            
	            // file_save_name
	            // fileName = a.png
	            // a
	            String baseName = FilenameUtils.getBaseName(farm_diary_file_name);
	            // png
	            String extension = FilenameUtils.getExtension(farm_diary_file_name);
	            // a57943846453123489798456.png
	            //UUID(Univerally Unique Identifier) - 128bit 유일키 랜덤 설정
	            String genID = UUID.randomUUID().toString().replace("-", "");
	            // a57943846453123489798456.png
	            String farm_diary_file_save_name= baseName + genID + "." + extension;
	            farmingFileItemInfo.setFarm_diary_file_save_name(farm_diary_file_save_name);
	            
	            farmingFileItemInfo.setFarm_diary_file_content_type(item.getContentType());
	            farmingFileItemInfo.setFarm_diary_file_size(String.valueOf(item.getSize()));
	            
	            farmingFileItemList.add(farmingFileItemInfo);
	            
	            saveFile(farm_diary_file_save_name, item);
	         }
	      }
	   }
	   return farmingFileItemList;
	}
   
   public List<BulletinBoardFileItemVO> mappingsss(MultipartFile[] items,
	         String bbs_no){
	   List<BulletinBoardFileItemVO> bulletinBoardFileItemList =new ArrayList<BulletinBoardFileItemVO>();
	   
	   if(items != null) {
		   BulletinBoardFileItemVO bulletinBoardFileItemInfo;
	      for(MultipartFile item : items) {
	         if(item.getSize() > 0){
	        	 bulletinBoardFileItemInfo = new BulletinBoardFileItemVO();
	        	 bulletinBoardFileItemInfo.setBbs_no(bbs_no);
	            
	            // file name
	            // c:\temp\a.png [찾아보기] => c:\temp\a.png or a.png 
	            // a.png 반환
	            String bbs_file_name = FilenameUtils.getName(item.getOriginalFilename());
	            // 업로드 실제 파일명
	            bulletinBoardFileItemInfo.setBbs_file_name(bbs_file_name);
	            
	            // file_save_name
	            // fileName = a.png
	            // a
	            String baseName = FilenameUtils.getBaseName(bbs_file_name);
	            // png
	            String extension = FilenameUtils.getExtension(bbs_file_name);
	            // a57943846453123489798456.png
	            //UUID(Univerally Unique Identifier) - 128bit 유일키 랜덤 설정
	            String genID = UUID.randomUUID().toString().replace("-", "");
	            // a57943846453123489798456.png
	            String bbs_file_save_name= baseName + genID + "." + extension;
	            bulletinBoardFileItemInfo.setBbs_file_save_name(bbs_file_save_name);
	            
	            bulletinBoardFileItemInfo.setBbs_file_content_type(item.getContentType());
	            bulletinBoardFileItemInfo.setBbs_file_size(String.valueOf(item.getSize()));
	            
	            bulletinBoardFileItemList.add(bulletinBoardFileItemInfo);
	            
	            saveFile(bbs_file_save_name, item);
	         }
	      }
	   }
	   return bulletinBoardFileItemList;
	}

   public List<CommunityFileItemVO> mappingssss(MultipartFile[] itemss,
		   String cmmnty_no){
	   List<CommunityFileItemVO> communityFileItemList =new ArrayList<CommunityFileItemVO>();
	   
	   if(itemss != null) {
		   CommunityFileItemVO communityFileItemInfo;
		   for(MultipartFile item : itemss) {
			   if(item.getSize() > 0){
				   communityFileItemInfo = new CommunityFileItemVO();
				   communityFileItemInfo.setCmmnty_no(cmmnty_no);
				   
				   // file name
				   // c:\temp\a.png [찾아보기] => c:\temp\a.png or a.png 
				   // a.png 반환
				   String cmmnty_file_name = FilenameUtils.getName(item.getOriginalFilename());
				   // 업로드 실제 파일명
				   communityFileItemInfo.setCmmnty_file_name(cmmnty_file_name);
				   
				   // file_save_name
				   // fileName = a.png
				   // a
				   String baseName = FilenameUtils.getBaseName(cmmnty_file_name);
				   // png
				   String extension = FilenameUtils.getExtension(cmmnty_file_name);
				   // a57943846453123489798456.png
				   //UUID(Univerally Unique Identifier) - 128bit 유일키 랜덤 설정
				   String genID = UUID.randomUUID().toString().replace("-", "");
				   // a57943846453123489798456.png
				   String cmmnty_file_save_name= baseName + genID + "." + extension;
				   communityFileItemInfo.setCmmnty_file_save_name(cmmnty_file_save_name);
				   
				   communityFileItemInfo.setCmmnty_file_content_type(item.getContentType());
				   communityFileItemInfo.setCmmnty_file_size(String.valueOf(item.getSize()));
				   
				   communityFileItemList.add(communityFileItemInfo);
				   
				   saveFile(cmmnty_file_save_name, item);
			   }
		   }
	   }
	   return communityFileItemList;
   }
   public List<NongupinFileItemVO> mappingsssss(MultipartFile[] items,
		   String farming_in_no){
	   List<NongupinFileItemVO> nongupinFileItemList =new ArrayList<NongupinFileItemVO>();
	   
	   if(items != null) {
		   NongupinFileItemVO nongupinFileItemInfo;
		   for(MultipartFile item : items) {
			   if(item.getSize() > 0){
				   nongupinFileItemInfo = new NongupinFileItemVO();
				   nongupinFileItemInfo.setFarming_in_no(farming_in_no);
				   
				   // file name
				   // c:\temp\a.png [찾아보기] => c:\temp\a.png or a.png 
				   // a.png 반환
				   String farming_in_file_name = FilenameUtils.getName(item.getOriginalFilename());
				   // 업로드 실제 파일명
				   nongupinFileItemInfo.setFarming_in_file_name(farming_in_file_name);
				   
				   // file_save_name
				   // fileName = a.png
				   // a
				   String baseName = FilenameUtils.getBaseName(farming_in_file_name);
				   // png
				   String extension = FilenameUtils.getExtension(farming_in_file_name);
				   // a57943846453123489798456.png
				   //UUID(Univerally Unique Identifier) - 128bit 유일키 랜덤 설정
				   String genID = UUID.randomUUID().toString().replace("-", "");
				   // a57943846453123489798456.png
				   String farming_in_file_save_name= baseName + genID + "." + extension;
				   nongupinFileItemInfo.setFarming_in_file_save_name(farming_in_file_save_name);
				   
				   nongupinFileItemInfo.setFarming_in_file_content_type(item.getContentType());
				   nongupinFileItemInfo.setFarming_in_file_size(String.valueOf(item.getSize()));
				   
				   nongupinFileItemList.add(nongupinFileItemInfo);
				   
				   saveFile(farming_in_file_save_name, item);
			   }
		   }
	   }
	   return nongupinFileItemList;
   }
   
private static void saveFile(String saveFileName, MultipartFile item) {
   File saveFile = new File(GlobalConstant.FILE_PATH, saveFileName);
   
   try {
      item.transferTo(saveFile);
   } catch (Exception e) {
      e.printStackTrace();
   }
}





}
