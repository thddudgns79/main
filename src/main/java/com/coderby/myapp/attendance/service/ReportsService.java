package com.coderby.myapp.attendance.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

}
