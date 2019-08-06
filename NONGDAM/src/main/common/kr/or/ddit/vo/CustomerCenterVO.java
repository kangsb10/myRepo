package kr.or.ddit.vo;


/**
 * 
 * @author Administrator
 *		CSTMR_CNTER_NO          고객센터 글 번호
 *		MBER_ID					고객센터 글 아이디
 *		CSTMR_CNTER_SJ			고객센터 글 제목
 *		CSTMR_CNTER_CN			고객센터 글 내용
 *		CSTMR_CNTER_INPUT_DE	고객센터 글 입력날짜
 *		CSTMR_CNTER_DELETE		삭제여부
 *		CSTMR_CNTER_ANSWER		답글여부
 *		CSTMR_CNTER_HIT			조회수
 *		MBER_NCNM				닉네임
 */
public class CustomerCenterVO {
	
	private String rnum;
	private String cstmr_cnter_no;
	private String mber_id;
	private String cstmr_cnter_sj;
	private String cstmr_cnter_cn;
	private String cstmr_cnter_input_de;
	private String cstmr_cnter_delete;
	private String cstmr_cnter_answer;
	private String cstmr_cnter_hit;
	private String mber_ncnm;
	
	public String getMber_id() {
		return mber_id;
	}
	public void setMber_id(String mber_id) {
		this.mber_id = mber_id;
	}
	public String getRnum() {
		return rnum;
	}
	public void setRnum(String rnum) {
		this.rnum = rnum;
	}
	public String getCstmr_cnter_no() {
		return cstmr_cnter_no;
	}
	public void setCstmr_cnter_no(String cstmr_cnter_no) {
		this.cstmr_cnter_no = cstmr_cnter_no;
	}

	public String getMber_ncnm() {
		return mber_ncnm;
	}
	public void setMber_ncnm(String mber_ncnm) {
		this.mber_ncnm = mber_ncnm;
	}
	public String getCstmr_cnter_sj() {
		return cstmr_cnter_sj;
	}
	public void setCstmr_cnter_sj(String cstmr_cnter_sj) {
		this.cstmr_cnter_sj = cstmr_cnter_sj;
	}
	public String getCstmr_cnter_cn() {
		return cstmr_cnter_cn;
	}
	public void setCstmr_cnter_cn(String cstmr_cnter_cn) {
		this.cstmr_cnter_cn = cstmr_cnter_cn;
	}
	public String getCstmr_cnter_input_de() {
		return cstmr_cnter_input_de;
	}
	public void setCstmr_cnter_input_de(String cstmr_cnter_input_de) {
		this.cstmr_cnter_input_de = cstmr_cnter_input_de;
	}
	public String getCstmr_cnter_delete() {
		return cstmr_cnter_delete;
	}
	public void setCstmr_cnter_delete(String cstmr_cnter_delete) {
		this.cstmr_cnter_delete = cstmr_cnter_delete;
	}
	public String getCstmr_cnter_answer() {
		return cstmr_cnter_answer;
	}
	public void setCstmr_cnter_answer(String cstmr_cnter_answer) {
		this.cstmr_cnter_answer = cstmr_cnter_answer;
	}
	public String getCstmr_cnter_hit() {
		return cstmr_cnter_hit;
	}
	public void setCstmr_cnter_hit(String cstmr_cnter_hit) {
		this.cstmr_cnter_hit = cstmr_cnter_hit;
	}
	
	
}
