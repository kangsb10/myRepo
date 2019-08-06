package kr.or.ddit.user.cultivationmethod;

import java.util.List;

import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.service.cultivation.ICultivationMethodService;
import kr.or.ddit.utiles.RolePagingUtiles;
import kr.or.ddit.vo.CultivationMethodVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

// 재배방법 게시판 컨드롤러

@Controller
@RequestMapping("/user/cultivationmethod/")
public class CultivationMethodController {
   
   @Autowired 
   private ICultivationMethodService service;
   
   // 리스트 출력
   @RequestMapping("cultivationMethodList")
   public Model cultivationmethodList(Model model
                            , Map<String, String> params
                            , HttpServletRequest request
                            , String search_keyword
                            , String search_keycode
                            , String currentPage
                             ) throws Exception {
      currentPage = request.getParameter("currentPage");
      if(currentPage==null){
         currentPage = "1";
      }
      
      params.put("search_keyword", search_keyword);
       params.put("search_keycode", search_keycode);
         
      int totalCount = service.totalCount(params);
      RolePagingUtiles pagingUtiles = new RolePagingUtiles(Integer.parseInt(currentPage), totalCount, request);
      params.put("startCount", pagingUtiles.getStartCount());
      params.put("endCount", pagingUtiles.getEndCount());
      
      List<CultivationMethodVO> cultivationmethodList = this.service.cultivationMethodList(params);
      
      model.addAttribute("cultivationmethodList",cultivationmethodList);
      model.addAttribute("pagingHtmls", pagingUtiles.getPageHtmls());
      model.addAttribute("search_keyword", search_keyword);
      model.addAttribute("search_keycode", search_keycode);
      model.addAttribute("currentPage", currentPage);
      
      return model;
   }
   
   //뷰
//   @RequestMapping("cultivationMethodView")
//   public ModelAndView cultivationMethodView(@RequestParam String ctvt_mth_no,
//                                    Map<String, String> params,
//                                    ModelAndView andView ) throws Exception{
//      CultivationMethodVO cultivationMethodInfo = this.service.cultivationMethodInfo(params);
//      
//      andView.addObject("cultivationMethodInfo", cultivationMethodInfo);
//      andView.setViewName("user/cultivationmethod/cultivationMethodView");
//      
//      return andView;
//   }
   
   //뷰
   @RequestMapping("cultivationMethodView")
   public ModelMap cultivationMethodView(ModelMap modelMap,
                                @RequestParam String ctvt_mth_no,
                                Map<String, String> params,
                                HttpServletRequest request,
 							   	HttpServletResponse response, 
 							   	String search_keyword, 
 							   	String search_keycode, 
 							   	String currentPage) throws Exception{
      params.put("ctvt_mth_no", ctvt_mth_no);
      
      CultivationMethodVO cultivationMethodInfo = this.service.cultivationMethodInfo(params);
      
      Cookie[] cookie = request.getCookies();
      
      Cookie viewCookie = null;
      
      if(cookie != null && cookie.length>0){
    	  for(int i=0; i<cookie.length; i++){
    		  if(cookie[i].getName().equals("cookiecultivation" + cultivationMethodInfo.getCtvt_mth_no())){
    			  viewCookie = cookie[i]; 
    		  }
    	  }
      }
      
      if(viewCookie == null){
    	  Cookie newCookie = new Cookie("cookiecultivation" + cultivationMethodInfo.getCtvt_mth_no(), "|" + cultivationMethodInfo.getCtvt_mth_no() + "|");
    	  response.addCookie(newCookie);
    	  service.updateHit(params);
      }else{
    	  String value = viewCookie.getValue();
    	  System.out.println("cookie = " + value);
      }
      
      
      modelMap.addAttribute("cultivationMethodInfo", cultivationMethodInfo);
      modelMap.addAttribute("search_keyword", search_keyword);
      modelMap.addAttribute("search_keycode", search_keycode);
      modelMap.addAttribute("currentPage", currentPage);
      return modelMap;
   }
   
   @RequestMapping("cultivationMethodForm")
   public void cultivationMethodForm() throws Exception{}
   
   @RequestMapping("insertCultivationMethod")
   public String insertCultivationMethod(CultivationMethodVO cultivationMethodInfo
                                , @RequestParam("files") MultipartFile[] items
                                , RedirectAttributes redirectAttribute) throws Exception{
      this.service.insertCultivationMethodInfo(cultivationMethodInfo, items);
      
      redirectAttribute.addFlashAttribute("message","게시물이 등록되었습니다.");
      
      return "redirect:/user/cultivationmethod/cultivationMethodList.do";
   }
   
   @RequestMapping("deleteCultivationMethod")
   public String deleteCultivationMethod(@RequestParam String ctvt_mth_no
                                , Map<String, String> params) throws Exception{
      params.put("ctvt_mth_no", ctvt_mth_no);
      
      this.service.deleteCultivationMethodInfo(params);
      
      return "redirect:/user/cultivationmethod/cultivationMethodList.do";
   }
   
   @RequestMapping("updateCultivationMethodForm")
   public ModelMap updateCultivationMethodForm(ModelMap modelMap,
                                    @RequestParam String ctvt_mth_no,
                                    HttpServletRequest request,
                                    Map<String, String> params,
                                    CultivationMethodVO cultivationMethodInfo,
                                    @RequestParam String search_keyword, 
                                    @RequestParam String search_keycode, 
     							    @RequestParam String currentPage) throws Exception{
      ctvt_mth_no = request.getParameter("ctvt_mth_no");
      params.put("ctvt_mth_no", ctvt_mth_no);
      
      cultivationMethodInfo = this.service.upCultivationMethodInfo(params);
      
      modelMap.addAttribute("cultivationMethodInfo", cultivationMethodInfo);
      modelMap.addAttribute("ctvt_mth_no", ctvt_mth_no);
      modelMap.addAttribute("search_keyword", search_keyword);
      modelMap.addAttribute("search_keycode", search_keycode);
      modelMap.addAttribute("currentPage", currentPage);
      return modelMap;
   }

   @RequestMapping("updateCultivationMethod")
   public String updateCultivationMethod(CultivationMethodVO cultivationMethodInfo) throws Exception{
      
      this.service.updateCultivationMethodInfo(cultivationMethodInfo);
      return "redirect:/user/cultivationmethod/cultivationMethodList.do";
   }
}