package javabean;
//설계도, 붕어빵틀
public class GradeBean {
	// 1. 속성, 이름, 성적
	private String name;  //이름
	private int point;   // 성적
	
	// 2. 메소드, getters and setters 메뉴 -> source -> generate getters and setters
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	
	//성적의 학점을 계산하는 메소드
	public String getGrade() {		
		String grade = "";
		if(point >= 90)
			grade = "A";
		else if(point >= 80)
			grade = "B";
		else if(point >= 70)
			grade = "C";
		else if(point >= 60)
			grade = "D";
		else
			grade = "F";
		return grade;
		
		//grade 로 속성 사용 가능
	}
}
