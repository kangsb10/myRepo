package kr.or.ddit.vo;

import java.util.List;

public class CommunityVO {

	// 커뮤니티 
	private String rnum;
	private String cmmnty_no;
	private String mber_id;
	private String ctgry_gu;
	private String cmmnty_cafe_nm;
	private String cmmnty_estbl_de;
	private String cmmnty_cafe_adres;
	private String cmmnty_cafeinfo;
	// 커뮤니티 구분
	private String ctgry_nm;
	private String ctgry_mn;
	// 커뮤니티 회원관리
	private String cafe_mber_id;
	private String cafe_mber_ncnm;
	// 커뮤니티 게시판 추가
	private String bbs_creat_no;
	private String bbs_creat_sj;
	// 커뮤니티 게시판 글
	private String bbs_no;
	private String bbs_sj;
	private String bbs_cn;
	private String bbs_rdcnt;
	private String bbs_input_de;
	private List<BulletinBoardFileItemVO> items;
	private List<CommunityFileItemVO> itemss;
	
	public List<CommunityFileItemVO> getItemss() {
		return itemss;
	}
	public void setItemss(List<CommunityFileItemVO> itemss) {
		this.itemss = itemss;
	}
	public String getRnum() {
		return rnum;
	}
	public void setRnum(String rnum) {
		this.rnum = rnum;
	}
	public String getCtgry_mn() {
		return ctgry_mn;
	}
	public void setCtgry_mn(String ctgry_mn) {
		this.ctgry_mn = ctgry_mn;
	}
	public String getCtgry_nm() {
		return ctgry_nm;
	}
	public void setCtgry_nm(String ctgry_nm) {
		this.ctgry_nm = ctgry_nm;
	}
	public String getCmmnty_no() {
		return cmmnty_no;
	}
	public void setCmmnty_no(String cmmnty_no) {
		this.cmmnty_no = cmmnty_no;
	}
	public String getMber_id() {
		return mber_id;
	}
	public void setMber_id(String mber_id) {
		this.mber_id = mber_id;
	}
	public String getCtgry_gu() {
		return ctgry_gu;
	}
	public void setCtgry_gu(String ctgry_gu) {
		this.ctgry_gu = ctgry_gu;
	}
	public String getCmmnty_cafe_nm() {
		return cmmnty_cafe_nm;
	}
	public void setCmmnty_cafe_nm(String cmmnty_cafe_nm) {
		this.cmmnty_cafe_nm = cmmnty_cafe_nm;
	}
	public String getCmmnty_estbl_de() {
		return cmmnty_estbl_de;
	}
	public void setCmmnty_estbl_de(String cmmnty_estbl_de) {
		this.cmmnty_estbl_de = cmmnty_estbl_de;
	}
	public String getCmmnty_cafe_adres() {
		return cmmnty_cafe_adres;
	}
	public void setCmmnty_cafe_adres(String cmmnty_cafe_adres) {
		this.cmmnty_cafe_adres = cmmnty_cafe_adres;
	}
	public String getCmmnty_cafeinfo() {
		return cmmnty_cafeinfo;
	}
	public void setCmmnty_cafeinfo(String cmmnty_cafeinfo) {
		this.cmmnty_cafeinfo = cmmnty_cafeinfo;
	}
	public String getCafe_mber_id() {
		return cafe_mber_id;
	}
	public void setCafe_mber_id(String cafe_mber_id) {
		this.cafe_mber_id = cafe_mber_id;
	}
	public String getCafe_mber_ncnm() {
		return cafe_mber_ncnm;
	}
	public void setCafe_mber_ncnm(String cafe_mber_ncnm) {
		this.cafe_mber_ncnm = cafe_mber_ncnm;
	}
	public String getBbs_creat_no() {
		return bbs_creat_no;
	}
	public void setBbs_creat_no(String bbs_creat_no) {
		this.bbs_creat_no = bbs_creat_no;
	}
	public String getBbs_creat_sj() {
		return bbs_creat_sj;
	}
	public void setBbs_creat_sj(String bbs_creat_sj) {
		this.bbs_creat_sj = bbs_creat_sj;
	}
	public String getBbs_no() {
		return bbs_no;
	}
	public void setBbs_no(String bbs_no) {
		this.bbs_no = bbs_no;
	}
	public String getBbs_sj() {
		return bbs_sj;
	}
	public void setBbs_sj(String bbs_sj) {
		this.bbs_sj = bbs_sj;
	}
	public String getBbs_cn() {
		return bbs_cn;
	}
	public void setBbs_cn(String bbs_cn) {
		this.bbs_cn = bbs_cn;
	}
	public String getBbs_rdcnt() {
		return bbs_rdcnt;
	}
	public void setBbs_rdcnt(String bbs_rdcnt) {
		this.bbs_rdcnt = bbs_rdcnt;
	}
	public String getBbs_input_de() {
		return bbs_input_de;
	}
	public void setBbs_input_de(String bbs_input_de) {
		this.bbs_input_de = bbs_input_de;
	}
	public List<BulletinBoardFileItemVO> getItems() {
		return items;
	}
	public void setItems(List<BulletinBoardFileItemVO> items) {
		this.items = items;
	}
	
	
}
