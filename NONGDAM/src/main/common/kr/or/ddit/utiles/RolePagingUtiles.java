package kr.or.ddit.utiles;

import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;

public class RolePagingUtiles {

   private int currentPage;            	// 현재 페이지
   private int totalCount;              // 전체 게시글의 갯수
   private int totalPage;               // 전체 페이지 갯수
   private int blockCount = 10;         // 각 페이지별 출력될 게시글의 갯수 
   private int blockPage = 5;           // 페이지네이션 내 출력될 전체 페이지 갯수
   private int startPage;               // 출력되는 페이지네이션 내 시작 페이지 번호
   private int endPage;               	// 출력되는 페이지네이션 내 끝 페이지 번호
   private int startCount;              // 해당 페이지에 출력될 시작 게시글 번호
   private int endCount;               	// 해당 페이지에 출력될 끝 게시글 번호

   //   /12/freeboard/freeboardList.jsp?currentPage=2&search_keycode=데헷&search_keyword=힝
   private String params = "";          // 리스트 출력 jsp에 전달될 기존 쿼리스트링 저장
   private StringBuffer pageHtmls;      // 문자열 기반 페이지네이션 컨텐츠 저장
   private HttpServletRequest request;  //
   
   public RolePagingUtiles(int currentPage, int totalCount, HttpServletRequest request) {
      this.currentPage = currentPage;
      this.totalCount = totalCount;
      this.request = request;
      
      pageHtmls = new StringBuffer();
      
      makePagenation();
      
   }

   private void makePagenation() {
      // 1. 전체 페이지 수
      this.totalPage = (int) Math.ceil(this.totalCount / (double)this.blockCount);
      if(this.totalPage == 0){
         this.totalPage = 1;
      }
      
      // 2. 해당 페이지의 시작 게시글 번호
      //    해당 페이지의 끝 게시글 번호
      this.startCount = this.totalCount - (this.currentPage - 1) * this.blockCount;
      this.endCount = this.startCount - this.blockCount + 1;
      if(this.endCount < 0){
         this.endCount = 1;
      }
      
      // 이전|1|2|3|4|5|다음
      this.startPage = ((this.currentPage - 1) / this.blockPage * this.blockPage) + 1;
      this.endPage = this.startPage + this.blockPage - 1;
      if(this.endPage > this.totalPage){
         this.endPage = this.totalPage;
      }
      
      String requestURI = request.getRequestURI();
      
      Enumeration<String> keys = request.getParameterNames();
      while(keys.hasMoreElements()){
         // freeboardList.jsp?search_keycode=1&search_keyword=!@# 
         String key = keys.nextElement();
         if("currentPage".intern() != key.intern()){
            String[] values = request.getParameterValues(key);
            for(String value : values){
               this.params += key + "=" + value + "&";
            }
         }
      }
      
      this.pageHtmls.append("<div class='text-center'>");
      this.pageHtmls.append("<ul class='pagination mtm mbm'>");
      
      // 이전|1|2|3|4|5|다음
      
      // 이전
      if((this.currentPage - 1) == 0){
         this.pageHtmls.append("<li class='disabled'><a href='#'>&laquo;</a></li>");
      }else{                     //   /12/main.jsp?search_keycode=a&search_keyword=2&currentPage=1
         this.pageHtmls.append("<li><a href='" + requestURI + "?" + params + "currentPage=" +
                                       (this.currentPage - 1) + "'>&laquo;</a></li>");
      }
      
      // |1|2|3|4|5|
      for(int i = this.startPage; i <= this.endPage; i++){
         if(this.currentPage == i){
            this.pageHtmls.append("<li class='active'><a href='#'>" + i + "</a></li>");
         }else{
            this.pageHtmls.append("<li><a href='" + requestURI + "?" + params + "currentPage=" +
                  i + "'>" + i + "</a></li>");
         }
      }
      
      // 다음
      if(this.currentPage < this.totalPage){
         this.pageHtmls.append("<li><a href='" + requestURI + "?" + params + "currentPage=" +
               (this.currentPage + 1) + "'>&raquo;</a></li>");
      }else{                     
         this.pageHtmls.append("<li class='disabled'><a href='#'>&raquo;</a></li>");
      }
      
      this.pageHtmls.append("</url>");
      this.pageHtmls.append("</div>");
      
   }

   public String getStartCount() {
      return String.valueOf(startCount);
   }

   public String getEndCount() {
      return String.valueOf(endCount);
   }

   public String getPageHtmls() {
      return pageHtmls.toString();
   }
   
   
   
   
}