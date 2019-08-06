package kr.or.ddit.utiles;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.ibatis.sqlmap.engine.mapping.parameter.ParameterMap;

// 클라이언트가 파일 업로드 시 폼필드, 파일을 보다 쉽게 활용할수있는
// 활용 패턴을 제공.
public class FileUploadRequestWrapper extends HttpServletRequestWrapper {
   private boolean multipartFlag = false;
   
   // 폼필드만 저장.   
   private Map<String, String[]> parameterMap;
   
   // 파일만 저장
   private Map<String, FileItem[]> fileItemMap;
   
   public FileUploadRequestWrapper(HttpServletRequest request) {
      this(request, -1, -1);
   }
   
   // 임시 저장소 파일 사이즈 제한 : default -1(무제한)
   // 실제 저장소 파일 사이즈 제한 : default -1(무제한)
   public FileUploadRequestWrapper(HttpServletRequest request, int threshold, int sizeMax) {
      super(request);
      // 파일 업로드 파싱
      parsing(request, threshold, sizeMax);
   }

   private void parsing(HttpServletRequest request, int threshold, int sizeMax) {
      this.multipartFlag =  ServletFileUpload.isMultipartContent(request);
      if(multipartFlag){
         this.parameterMap = new HashMap<String, String[]>();
         this.fileItemMap = new HashMap<String, FileItem[]>();
         
         DiskFileItemFactory factory = new DiskFileItemFactory();
         factory.setSizeThreshold(threshold);
//         factory.setRepository(new File(GlobalConstant.FILE_PATH)); upload__d929634_16abacd80ce__7ffd_00000028.tmp 없앨려고
         
         ServletFileUpload realFactory = new ServletFileUpload(factory);
         realFactory.setSizeMax(sizeMax);
         
         try {
            List<FileItem> items = realFactory.parseRequest(request);
            
            for(FileItem item : items){
               String fieldName = item.getFieldName();
               if(item.isFormField()){
                  // 폼필드
                  String value =item.getString("UTF-8");
                  // mem_id=a001&mem_id=b001
                  String[] values = this.parameterMap.get(fieldName);
                  if(values == null){
                     // parameterMap에 최초 저장
                     values = new String[]{ value };
                  }else{
                     // parameterMap에 동일한 키로 기 저장된 값 존재 추가
                     String[] temp = new String[values.length+1];
                     // 1. 원본 values
                     // 2. 원본 배열의 복사 시작 인덱스
                     // 3. 복사대상 배열
                     // 4. 복사 시작 인덱스
                     // 5. 복사할 원본배열의 마지막 인덱스
                     // 복사 temp
                     System.arraycopy(values, 0, temp, 0, values.length);
                     
                     temp[temp.length-1] = value;
                     
                     values = temp;
                     
                  }
                  this.parameterMap.put(fieldName, values);
               }else{
                  // 파일
                  if(item.getSize() > 0){
                     FileItem[] values = this.fileItemMap.get(fieldName);
                     if(values == null){
                        values = new FileItem[]{ item };
                     }else{
                        FileItem[] temp = new FileItem[values.length+1];
                        System.arraycopy(values, 0, temp, 0, values.length);
                        
                        temp[temp.length-1] = item;
                        
                        values = temp;
                     }
                     this.fileItemMap.put(fieldName, values);
                  }
               }
            }
         } catch (FileUploadException e) {
            e.printStackTrace();
         } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
         }
      }
   }
   
   // 파일업로드 시에도 request.getParameter("mem_id");
   @Override
   public String getParameter(String name) {
      if(this.multipartFlag){
         String[] params = this.parameterMap.get(name);
         if(params == null){
            return null;
         }else{
            return params[0];
         }
      }else{
         return super.getParameter(name);
      }
   }

   @Override
   public Map<String, String[]> getParameterMap() {
	   if(this.multipartFlag){
		   return this.parameterMap;
	   }else {
		   return super.getParameterMap();
	   }
   }

   @Override
   public Enumeration<String> getParameterNames() {
	   if(this.multipartFlag){
		   return new Enumeration<String>() {
			 Iterator<String> keys = parameterMap.keySet().iterator();
			@Override
			public boolean hasMoreElements() {
				return keys.hasNext();
			}
			
			@Override
			public String nextElement() {
				return keys.next();
			}
		};
	   }else {
		   return super.getParameterNames();
	   }
   }

   @Override
   public String[] getParameterValues(String name) {
	   if(this.multipartFlag) {
		   return this.parameterMap.get(name);
	   }else {
		   return super.getParameterValues(name);
	   }
   }
   
   // 파일 업로드 시 request.getFileItem("files")
   public FileItem getFileItem(String name){
	      if(this.multipartFlag){
	         FileItem[] items = this.fileItemMap.get(name);
	         if(items == null){
	            return null;
	         }else{
	            return items[0];
	         }
	      }else{
	         return null;
	      }
   }

   public FileItem[] getFileItemValues(String name){
	   if(this.multipartFlag){
		   return this.fileItemMap.get(name);
	   }else{
		   return null;
	   }
   }
   
   public Map<String, FileItem[]> getFileItemMap() {
	   if(this.multipartFlag){
		   return this.fileItemMap;
	   }else{
		   return null;
	   }
   }
   
}