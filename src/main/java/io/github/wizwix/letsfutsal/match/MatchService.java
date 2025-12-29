package io.github.wizwix.letsfutsal.match;

import io.github.wizwix.letsfutsal.dto.MatchDTO;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;

@Service
public class MatchService {

  private final MatchRepository matchRepository;

  public MatchService(MatchRepository matchRepository) {
    this.matchRepository = matchRepository;
  }

  // 경기 상세 조회
  public MatchDTO getMatchById(Long matchId) {
    return matchRepository.getMatchById(matchId);
  }

  // 경기 목록 조회
  public List<MatchDTO> getMatchList(String tab, String stadiumName,
                                     String startDate, String endDate,
                                     String gender, Integer minGrade, Integer maxGrade,
                                     Boolean available) {
    // 탭에 따라 matchType 설정
    String matchType = null;
    if ("개인 경기".equals(tab)) {
      matchType = "INDIVIDUAL";
    } else if ("팀 경기".equals(tab)) {
      matchType = "TEAM";
    }

    // 날짜 파싱
    LocalDateTime startDateTime = null;
    LocalDateTime endDateTime = null;
    if (startDate != null && !startDate.trim().isEmpty()) {
      startDateTime = LocalDateTime.parse(startDate + "T00:00:00");
    }
    if (endDate != null && !endDate.trim().isEmpty()) {
      endDateTime = LocalDateTime.parse(endDate + "T23:59:59");
    }

    // 성별 변환
    String genderParam = null;
    if (gender != null && !gender.trim().isEmpty()) {
      if ("남성".equals(gender)) {
        genderParam = "MALE";
      } else if ("여성".equals(gender)) {
        genderParam = "FEMALE";
      }
    }

    return matchRepository.getMatchList(matchType, stadiumName, startDateTime, endDateTime,
        genderParam, minGrade, maxGrade, available);
  }
}

