package com.coderby.myapp.attendance.service;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.coderby.myapp.attendance.dao.IAttendanceRepository;
import com.coderby.myapp.attendance.dao.IReportsRepository;
import com.coderby.myapp.attendance.model.AttendanceVO;
import com.coderby.myapp.attendance.model.ReportsVO;
import com.coderby.myapp.file.dao.IFileRepository;
import com.coderby.myapp.util.Pager;

@Service
public class ReportsService implements IReportsService {

	@Autowired
	IReportsRepository reportsRepository;

	@Autowired
	IAttendanceRepository attendanceRepository;

	@Autowired
	IFileRepository fileRepository;

	// 휴가신청 만들기
	@Override
	public String insertReports(ReportsVO reports, Date now) {
		// reports에는 내가 신청한 휴가가 있음
		// getReports에는 해당날짜에 해당하는 값이 있다면 있음
		boolean isFinal = false;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		List<ReportsVO> getReports = reportsRepository.selectReports(reports);
		AttendanceVO getAttend = attendanceRepository.attendToday(reports.getStudentId());
		
		if (reports.getInTime().getTime() > now.getTime()) {
			// 현재 신청한 type이 휴가
			if (reports.getRepType().equals("병가") || reports.getRepType().equals("경조사")
					|| reports.getRepType().equals("예비군")) {
				boolean isPossible = true;
				for (ReportsVO repVO : getReports) {
					if (!repVO.getRepStatus().equals("반려")) {
						isPossible = false;
						break;
					}
				}
				// for문을 돌지 않아도 isPossible이 true가 되어 값이 들어간다.
				if (isPossible) {
					reportsRepository.insertReports(reports);
					isFinal = true;
				}

				// 현재 신청한 type이 조퇴
			} else if (reports.getRepType().equals("조퇴")) {
				boolean isPossible = true;
				for (ReportsVO repVO : getReports) {
					// 휴가,조퇴 존재 한다면
					if (!repVO.getRepStatus().equals("반려")
							&& (repVO.getRepType().equals("병가") || repVO.getRepType().equals("경조사")
									|| repVO.getRepType().equals("예비군") || repVO.getRepType().equals("조퇴"))) {
						isPossible = false;
						break;
					} else {
						if (!repVO.getRepStatus().equals("반려")
								&& (repVO.getRepType().equals("외출") || repVO.getRepType().equals("지하철 연착"))) {
							if ((repVO.getInTime().getTime() <= reports.getInTime().getTime() && reports.getInTime().getTime() <= repVO.getOutTime().getTime()) 
									|| 
									(repVO.getInTime().getTime() <= reports.getOutTime().getTime() && reports.getOutTime().getTime() <= repVO.getOutTime().getTime())) {
								isPossible = false;
							}
						}
					}
				}
				if (isPossible) {
					// 현재 출근상태이면서 퇴근이 되어있지 않아야한다.
					// 오늘이 아니면 조퇴 신청 불가능 
					if (getAttend != null && getAttend.getInTime() != null && getAttend.getOutTime() == null &&
							sdf.format(reports.getRepDate()).equals(sdf.format(getAttend.getAttendanceDate())) ) {
						reportsRepository.insertReports(reports);
						isFinal = true;
					}
				}

				// 현재신청한 type이 외출일때
			} else {
				System.out.println("외출 진입");
				boolean isPossible = true;
				for (ReportsVO repVO : getReports) {
					System.out.println(repVO.getRepId());
					// 휴가가 있다면
					if (!repVO.getRepStatus().equals("반려") && (repVO.getRepType().equals("병가")
							|| repVO.getRepType().equals("경조사") || repVO.getRepType().equals("예비군"))) {
						isPossible = false;
						System.out.println("휴가 존재");
						break;
						// 휴가가 존재하지 않을때
					} else {
						if (!repVO.getRepStatus().equals("반려") && (repVO.getRepType().equals("외출")
								|| repVO.getRepType().equals("지하철 연착") || repVO.getRepType().equals("조퇴"))) {
							if ((repVO.getInTime().getTime() <= reports.getInTime().getTime() && reports.getInTime().getTime() <= repVO.getOutTime().getTime()) 
									|| 
									(repVO.getInTime().getTime() <= reports.getOutTime().getTime() && reports.getOutTime().getTime() <= repVO.getOutTime().getTime())) {
								isPossible = false;
								System.out.println("겹침");
							}
						}
					}
				}
				if (isPossible) {
					// 현재 출근상태이면서 퇴근이 되어있지 않아야한다.
					// 오늘이 아니면 외출 신청 불가능
					System.out.println(sdf.format(reports.getRepDate()));
					System.out.println(sdf.format(getAttend.getAttendanceDate()));
					if (getAttend != null && getAttend.getInTime() != null && getAttend.getOutTime() == null &&
							sdf.format(reports.getRepDate()).equals(sdf.format(getAttend.getAttendanceDate())) ) {
						reportsRepository.insertReports(reports);
						isFinal = true;
					}
				}
			}
		}
		
		if(isFinal) {
			return "성공";
		}else {
			return "이미 신청한 휴가가 존재합니다.";
		}
	}

	// 휴가 취소
	@Override
	@Transactional
	public void deleteReprots(int repId, Date now) {
		ReportsVO rep = reportsRepository.selectRep(repId);
		if (now.getTime() < rep.getInTime().getTime() && rep.getRepStatus().equals("대기")) {
			System.out.println("휴가 취소 조건 만족");
			// 현재시간이 신청했던 휴가의 시작시간이 지나지 않은 경우
			fileRepository.deleteFile(repId);
			reportsRepository.deleteReports(repId);
		}

	}

	// 특정 학생 휴가 리스트
	@Override
	public List<ReportsVO> getStudentReportsList(String yearParam, String monthParam, String repType, String repStatus,
			String stdId, Pager pager) {
		return reportsRepository.getStudentReportsList(yearParam, monthParam, repType, repStatus, stdId, pager);
	}

	@Override
	public int getStudentReportsListCount(String yearParam, String monthParam, String repType, String repStatus,
			String stdId) {
		return reportsRepository.getStudentReportsListCount(yearParam, monthParam, repType, repStatus, stdId);
	}
	// 전체 학생 휴가 리스트
	@Override
	public List<ReportsVO> getReportsList(String classId, String yearParam, String monthParam, String repType,
			String repStatus, Pager pager) {
		return reportsRepository.getReportsList(classId, yearParam, monthParam, repType, repStatus, pager);
	}

	@Override
	public int getReportsListCount(String classId, String yearParam, String monthParam, String repType,
			String repStatus) {
		return reportsRepository.getReportsListCount(classId, yearParam, monthParam, repType, repStatus);
	}
	
	// 휴가 상세 조회
	@Override
	@Transactional
	public ReportsVO getReportsDetail(int repId) {
		ReportsVO repVO = reportsRepository.getReportsDetail(repId);
		repVO.setFileList(fileRepository.getFileList(repId));
		return repVO;
	}

	// 관리자 status 변경
	@Override
	@Transactional
	public void updateRepStatus(ReportsVO repVO, String updateRepStatus) throws ParseException {
		// 해당 날짜, 해당 학생이 신청한 다른 상신들
		List<ReportsVO> getReports = reportsRepository.selectReports(repVO);
		// 휴가
		if (repVO.getRepType().equals("병가") || repVO.getRepType().equals("경조사") || repVO.getRepType().equals("예비군")) {
			// 승인 -> 반려
			if (repVO.getRepStatus().equals("승인") && updateRepStatus.equals("반려")) {
				// 출석행 삭제
				reportsRepository.deleteAttedanceRow(repVO.getRepDate(), repVO.getStudentId());
				reportsRepository.updateRepStatus(repVO.getRepId(), updateRepStatus);
			}

			// 반려 -> 승인
			else if (repVO.getRepStatus().equals("반려") && updateRepStatus.equals("승인")) {
				// 승인,대기 휴가 조퇴,외출건 중복 확인 필요
				boolean isPossible = true;
				for (ReportsVO rep : getReports) {
					if ((rep.getRepStatus().equals("승인") || rep.getRepStatus().equals("대기"))) {
						isPossible = false;
						break;
					}
				}
				
				// 이 날 이 학생의 출석행이 존재하면 insert 불가능하게 
				if(attendanceRepository.selectAttend(repVO.getRepDate(), repVO.getStudentId()) != null){
					isPossible = false;
				}
				
				if (isPossible) {
					AttendanceVO attendance = new AttendanceVO();
					attendance.setAttendanceDate(repVO.getRepDate());
					attendance.setStudentId(repVO.getStudentId());
					attendance.setStatus("-");
					DateFormat beforeDateFormat = new SimpleDateFormat("yyyy-MM-dd");
					// Date to String
					String strInTime = beforeDateFormat.format(repVO.getRepDate());
					String strOutTime = beforeDateFormat.format(repVO.getRepDate());
					strInTime = strInTime + " 09:00:00";
					strOutTime = strOutTime + " 18:00:00";
					DateFormat afterDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					// String to Date
					Date transInTime = afterDateFormat.parse(strInTime);
					Date transOutTime = afterDateFormat.parse(strOutTime);

					attendance.setInTime(transInTime);
					attendance.setOutTime(transOutTime);
					reportsRepository.insertNineToSixAttendanceRow(attendance);
					reportsRepository.updateRepStatus(repVO.getRepId(), updateRepStatus);
				} else {
					System.out.println(
							"이미" + repVO.getRepDate() + "에" + repVO.getStudentId() + "의 승인 or 대기 상태의 휴가가 존재합니다.");
				}
			}
			// 대기 -> 승인
			else if (repVO.getRepStatus().equals("대기") && updateRepStatus.equals("승인")) {
				// 이 날 이 학생의 출석행이 존재하면 insert 불가능하게 
				if(attendanceRepository.selectAttend(repVO.getRepDate(), repVO.getStudentId()) != null) {
					return;
				}
				// 출석행 추가
				AttendanceVO attendance = new AttendanceVO();
				attendance.setAttendanceDate(repVO.getRepDate());
				attendance.setStudentId(repVO.getStudentId());
				attendance.setStatus("-");
				DateFormat beforeDateFormat = new SimpleDateFormat("yyyy-MM-dd");
				// Date to String
				String strInTime = beforeDateFormat.format(repVO.getRepDate());
				String strOutTime = beforeDateFormat.format(repVO.getRepDate());
				strInTime = strInTime + " 09:00:00";
				strOutTime = strOutTime + " 18:00:00";
				DateFormat afterDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				// String to Date
				Date transInTime = afterDateFormat.parse(strInTime);
				Date transOutTime = afterDateFormat.parse(strOutTime);

				attendance.setInTime(transInTime);
				attendance.setOutTime(transOutTime);
				reportsRepository.insertNineToSixAttendanceRow(attendance);
				reportsRepository.updateRepStatus(repVO.getRepId(), updateRepStatus);
			}
			// 대기 -> 반려
			else if (repVO.getRepStatus().equals("대기") && updateRepStatus.equals("반려")) {
				reportsRepository.updateRepStatus(repVO.getRepId(), updateRepStatus);
			}
		}
		// 조퇴
		else if (repVO.getRepType().equals("조퇴")) {
			// 승인 -> 반려
			if (repVO.getRepStatus().equals("승인") && updateRepStatus.equals("반려")) {
				// null로 out_time update
				reportsRepository.updateOutTime(repVO.getRepDate(), repVO.getStudentId(), null);
				reportsRepository.updateRepStatus(repVO.getRepId(), updateRepStatus);
			}

			// 반려 -> 승인
			else if (repVO.getRepStatus().equals("반려") && updateRepStatus.equals("승인")) {
				boolean isPossible = true;
				// 휴가,조퇴 승인,대기가 있는지
				for (ReportsVO rep : getReports) {
					if ((!rep.getRepType().equals("외출"))
							&& (rep.getRepStatus().equals("승인") || rep.getRepStatus().equals("대기"))) {
						isPossible = false;
						break;
					}
				}

				// 외출 승인,대기랑 겹치는지
				for (ReportsVO rep : getReports) {
					if ((rep.getRepType().equals("외출") || rep.getRepType().equals("지하철 연착"))
							&& (rep.getRepStatus().equals("승인") || rep.getRepStatus().equals("대기"))) {
						if ((rep.getInTime().getTime() <= repVO.getInTime().getTime() && repVO.getInTime().getTime() <= rep.getOutTime().getTime()) 
								|| 
								(rep.getInTime().getTime() <= repVO.getOutTime().getTime() && repVO.getOutTime().getTime() <= rep.getOutTime().getTime())) {
							isPossible = false;
							System.out.println("외출이랑 시간 겹침");
							break;
						}
					}
				}

				if (isPossible) {
					// 18:00:00으로 out_time update
					DateFormat beforeDateFormat = new SimpleDateFormat("yyyy-MM-dd");
					// Date to String
					String strOutTime = beforeDateFormat.format(repVO.getRepDate());
					strOutTime = strOutTime + " 18:00:00";
					DateFormat afterDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					// String to Date
					Date transOutTime = afterDateFormat.parse(strOutTime);

					reportsRepository.updateOutTime(repVO.getRepDate(), repVO.getStudentId(), transOutTime);
					reportsRepository.updateRepStatus(repVO.getRepId(), updateRepStatus);
				} else {
					System.out.println(
							"이미" + repVO.getRepDate() + "에" + repVO.getStudentId() + "의 승인 or 대기 상태의 조퇴가 존재합니다.");
				}
			}
			// 대기 -> 승인
			else if (repVO.getRepStatus().equals("대기") && updateRepStatus.equals("승인")) {
				// 18:00:00으로 out_time update
				DateFormat beforeDateFormat = new SimpleDateFormat("yyyy-MM-dd");
				// Date to String
				String strOutTime = beforeDateFormat.format(repVO.getRepDate());
				strOutTime = strOutTime + " 18:00:00";
				DateFormat afterDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				// String to Date
				Date transOutTime = afterDateFormat.parse(strOutTime);

				reportsRepository.updateOutTime(repVO.getRepDate(), repVO.getStudentId(), transOutTime);
				reportsRepository.updateRepStatus(repVO.getRepId(), updateRepStatus);
			}
			// 대기 -> 반려
			else if (repVO.getRepStatus().equals("대기") && updateRepStatus.equals("반려")) {
				reportsRepository.updateRepStatus(repVO.getRepId(), updateRepStatus);
			}
		}
		// 외출
		else {
			// 승인 -> 반려
			if (repVO.getRepStatus().equals("승인") && updateRepStatus.equals("반려")) {
				reportsRepository.updateRepStatus(repVO.getRepId(), updateRepStatus);
			}

			// 반려 -> 승인
			else if (repVO.getRepStatus().equals("반려") && updateRepStatus.equals("승인")) {
				boolean isPossible = true;
				// 휴가 승인,대기가 있는지
				for (ReportsVO rep : getReports) {
					if (repVO.getRepType().equals("병가") || repVO.getRepType().equals("경조사") || repVO.getRepType().equals("예비군")
							&& (rep.getRepStatus().equals("승인") || rep.getRepStatus().equals("대기"))) {
						isPossible = false;
						break;
					}
				}

				// 외출,조퇴 승인,대기랑 겹치는지
				for (ReportsVO rep : getReports) {
					if ((rep.getRepType().equals("외출") || rep.getRepType().equals("조퇴")
							|| rep.getRepType().equals("지하철 연착"))
							&& (rep.getRepStatus().equals("승인") || rep.getRepStatus().equals("대기"))) {
						if ((rep.getInTime().getTime() <= repVO.getInTime().getTime() && repVO.getInTime().getTime() <= rep.getOutTime().getTime()) 
								|| 
								(rep.getInTime().getTime() <= repVO.getOutTime().getTime() && repVO.getOutTime().getTime() <= rep.getOutTime().getTime())) {
							isPossible = false;
							break;
						}
					}
				}

				if (isPossible) {
					reportsRepository.updateRepStatus(repVO.getRepId(), updateRepStatus);
				} else {
					System.out.println(repVO.getRepDate() + "에" + repVO.getStudentId()
							+ "의 외출 시간이 다른 외출과 겹치거나 승인 or 대기 상태의 휴가가 존재합니다.");
				}
			}
			// 대기 -> 승인
			else if (repVO.getRepStatus().equals("대기") && updateRepStatus.equals("승인")) {
				reportsRepository.updateRepStatus(repVO.getRepId(), updateRepStatus);
			}
			// 대기 -> 반려
			else if (repVO.getRepStatus().equals("대기") && updateRepStatus.equals("반려")) {
				reportsRepository.updateRepStatus(repVO.getRepId(), updateRepStatus);
			}
		}

	}

	

}
