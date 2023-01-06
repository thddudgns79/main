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
import com.coderby.myapp.file.model.FileVO;

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
	public void insertReports(ReportsVO reports, Date now, FileVO fileVO) {
		// reports에는 내가 신청한 휴가가 있음
		// getReports에는 해당날짜에 해당하는 값이 있다면 있음
		List<ReportsVO> getReports = reportsRepository.selectReports(reports);
		AttendanceVO getAttend = attendanceRepository.attendToday(reports.getStudentId());

		if (getReports != null && getAttend != null) {
			// select해온 값이 있다면(신청한 기록이 있다면)
			if (reports.getInTime().getTime() < now.getTime()) {
				if (reports.getRepType().equals("병가") || reports.getRepType().equals("예비군")
						|| reports.getRepType().equals("경조사")) {
					// 현재 신청한 type이 휴가인 경우
					for (ReportsVO repVO : getReports) {
						if (repVO.getRepStatus().equals("반려") && (repVO.getRepType().equals("병가")
								|| repVO.getRepType().equals("경조사") || repVO.getRepType().equals("예비군"))) {
							fileRepository.deleteFiles(repVO.getRepId());
							reportsRepository.deleteReports(repVO.getRepId());
							reportsRepository.insertReports(reports);
							fileRepository.uploadFile(reports.getRepId(), fileVO);
							// System.out.println();
							break;
						}
					}
				} else if (reports.getRepType().equals("조퇴")) {
					// 현재 신청한 type이 조퇴인 경우
					if (getAttend.getInTime() != null && getAttend.getOutTime() == null) {
						for (ReportsVO repVO : getReports) {
							if (repVO.getRepStatus().equals("반려") && repVO.getRepType().equals("조퇴")) {
								fileRepository.deleteFiles(repVO.getRepId());
								reportsRepository.deleteReports(repVO.getRepId());
								reportsRepository.insertReports(reports);
								fileRepository.uploadFile(reports.getRepId(), fileVO);
								// System.out.println();
								break;
							}
						}
					}
				} else {
					// 현재 신청한 type이 외출인 경우
					if (getAttend.getInTime() != null && getAttend.getOutTime() == null) {
						boolean isPossible = true;
						for (ReportsVO repVO : getReports) {
							if (!repVO.getRepStatus().equals("반려")
									&& (repVO.getRepType().equals("외출") || repVO.getRepType().equals("지할철 연착"))) {

								if (repVO.getInTime().getTime() < reports.getOutTime().getTime()
										|| repVO.getOutTime().getTime() > reports.getInTime().getTime()) {
									isPossible = false;
									break;
								}
							}
						}
						if (isPossible) {
							fileRepository.uploadFile(reports.getRepId(), fileVO);
							reportsRepository.insertReports(reports);
						}
					}
				}
			} else {
				// return "현재시간보다 미래의 시간을 입력해주세요";
			}
		} else if (getAttend == null) {
			// 오늘 출근 기록이 없다?

		} else {
			if (reports.getInTime().getTime() < now.getTime()) {
				if (reports.getRepType().equals("병가") || reports.getRepType().equals("예비군")
						|| reports.getRepType().equals("경조사")) {
					// 신청 타입이 휴가
					reportsRepository.insertReports(reports);
					fileRepository.uploadFile(reports.getRepId(), fileVO);
				} else {
					// 신청 타입이 외출, 조퇴
					if (getAttend.getInTime() != null && getAttend.getOutTime() == null) {
						reportsRepository.insertReports(reports);
						fileRepository.uploadFile(reports.getRepId(), fileVO);
					} else {
						// 출근 안함 또는 퇴근함
					}
				}
			} else {
				// return "현재시간보다 미래의 시간을 입력해주세요";
			}
		}
	}

	// 휴가 취소
	@Override
	public void deleteReprots(int repId, Date now) {
		ReportsVO rep = reportsRepository.selectRep(repId);
		if (now.getTime() > rep.getInTime().getTime() && rep.getRepStatus().equals("대기")) {
			// 현재시간이 신청했던 휴가의 시작시간이 지나지 않은 경우
			fileRepository.deleteFile(repId);
			reportsRepository.deleteReports(repId);
		}

	}
	
	@Override
	public List<ReportsVO> getStudentReportsList(String yearParam, String monthParam, String repType,String repStatus, String stdId) {
	      return reportsRepository.getStudentReportsList(yearParam, monthParam, repType, repStatus, stdId);
	}
	
	@Override
	public List<ReportsVO> getReportsList(String classId, String yearParam, String monthParam, String repType,
			String repStatus) {
		return reportsRepository.getReportsList(classId, yearParam, monthParam, repType, repStatus);
	}

	@Override
	@Transactional
	public ReportsVO getReportsDetail(int repId) {
		ReportsVO repVO = reportsRepository.getReportsDetail(repId);
		repVO.setFileList(fileRepository.getFileList(repId));
		return repVO;
	}

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
				// 승인,대기 휴가 건 중복 확인 필요
				boolean isPossible = true;
				for (ReportsVO rep : getReports) {
					if ((rep.getRepType().equals("병가") || rep.getRepType().equals("경조사")
							|| rep.getRepType().equals("예비군"))
							&& (rep.getRepStatus().equals("승인") || rep.getRepStatus().equals("대기"))) {
						isPossible = false;
						break;
					}
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
				}else {
					System.out.println("이미" + repVO.getRepDate()+ "에" + repVO.getStudentId() + "의 승인 or 대기 상태의 휴가가 존재합니다.");
				}
			}
			// 대기 -> 승인
			else if (repVO.getRepStatus().equals("대기") && updateRepStatus.equals("승인")) {
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
				// 승인,대기 조퇴 건 중복 확인 필요
				boolean isPossible = true;
				for (ReportsVO rep : getReports) {
					if ((rep.getRepType().equals("조퇴"))
							&& (rep.getRepStatus().equals("승인") || rep.getRepStatus().equals("대기"))) {
						isPossible = false;
						break;
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
				}else {
					System.out.println("이미" + repVO.getRepDate()+ "에" + repVO.getStudentId() + "의 승인 or 대기 상태의 조퇴가 존재합니다.");
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
				// 승인,대기 외출 건 중복 확인 필요
				boolean isPossible = true;
				for (ReportsVO rep : getReports) {
					if ((rep.getRepType().equals("외출") || rep.getRepType().equals("지하철 연착"))
							&& (rep.getRepStatus().equals("승인") || rep.getRepStatus().equals("대기"))) {
						if (repVO.getInTime().getTime() < rep.getOutTime().getTime()
								|| repVO.getOutTime().getTime() > rep.getInTime().getTime()) {
							isPossible = false;
							break;
						}
					}
				}
				if (isPossible) {
					reportsRepository.updateRepStatus(repVO.getRepId(), updateRepStatus);
				}else {
					System.out.println(repVO.getRepDate()+ "에" + repVO.getStudentId() + "의 외출 시간이 다른 외출과 겹칩니다.");
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
