package com.coderby.myapp.attendance.model;

public class AttendStat {
	// 지각 횟수
	private int lateCount;
	// 결석 횟수
	private int absenceCount;
	// 출석 횟수
	private int attendCount;
	// 학생 아이디
	private String studentId;

	public int getLateCount() {
		return lateCount;
	}

	public void setLateCount(int lateCount) {
		this.lateCount = lateCount;
	}

	public int getAbsenceCount() {
		return absenceCount;
	}

	public void setAbsenceCount(int absenceCount) {
		this.absenceCount = absenceCount;
	}

	public int getAttendCount() {
		return attendCount;
	}

	public void setAttendCount(int attendCount) {
		this.attendCount = attendCount;
	}

	public String getStudentId() {
		return studentId;
	}

	public void setStudentId(String studentId) {
		this.studentId = studentId;
	}

	
}
