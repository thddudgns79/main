package com.coderby.myapp.classes.service;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.coderby.myapp.attendance.model.AttendanceVO;
import com.coderby.myapp.attendance.model.ReportsVO;
import com.coderby.myapp.classes.dao.IReportsRepository;
import com.coderby.myapp.file.dao.IFileRepository;

@Service
public class ReportsService implements IReportsService {
	@Autowired
	IReportsRepository reportsRepository;

	@Autowired
	IFileRepository fileRepository;

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
