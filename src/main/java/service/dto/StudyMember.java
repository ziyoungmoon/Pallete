package service.dto;

public class StudyMember {

	private int studyId;
	public int getStudyId() {
		return studyId;
	}

	public void setStudyId(int studyId) {
		this.studyId = studyId;
	}

	public String getId() {
		return Id;
	}

	public void setId(String id) {
		Id = id;
	}

	private String Id;
	
	public StudyMember(int studyId, String Id) {
		super();
		this.studyId = studyId;
		this.Id = Id;
	}
	
}
