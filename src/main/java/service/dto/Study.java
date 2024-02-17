package service.dto;

import java.sql.Date;

public class Study {
	private int studyId;
	private String part;
	private Date deadline;
	private String region;
	private int quota;
	private String leaderId;
	
	
	public Study() { }		// 기본 생성자
	
	public Study(String part, Date deadline, String region, int quota, String leaderId) {
		this.part = part;
		this.deadline = deadline;
		this.region = region;
		this.quota = quota;
		this.leaderId = leaderId;
	}
	
	
	/*public void update(User updateStudy) {
        this.part = updateStudy.part;
        this.deadline = updateStudy.deadline;
        this.region = updateStudy.region;
        this.quato = updateStudy.quato;
    }*/
	
	public int getStudyId() {
		return studyId;
	}
	
	public void setStudyId(int studyId) {
		this.studyId = studyId;
	}

	public String getLeaderId() {
		return leaderId;
	}
	
	public void setLeaderId(String leaderId) {
		this.leaderId = leaderId;
	}

	public String getPart() {
		return part;
	}
	
	public void setPart(String part) {
		this.part = part;
	}

	public Date getDeadline() {
		return deadline;
	}
	
	public void setDeadline(Date deadline) {
		this.deadline = deadline;
	}

	public String getRegion() {
		return region;
	}
	
	public void setRegion(String region) {
		this.region = region;
	}

	public int getQuota() {
		return quota;
	}
	
	public void setQuota(int quota) {
		this.quota = quota;
	}

	@Override
	public String toString() {
		return "Study [studyId=" + studyId + ", part=" + part + ", deadline=" + deadline + ", region="
				+ region + ", quota=" + quota + ", leaderId=" + leaderId +"]";
	}	
}
