package io.github.wizwix.letsfutsal.match;

import io.github.wizwix.letsfutsal.dto.MatchDTO;
import io.github.wizwix.letsfutsal.enums.Gender;
import io.github.wizwix.letsfutsal.enums.Match;
import org.springframework.stereotype.Service;

import java.time.LocalTime;
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
  public List<MatchDTO> getMatchList(String type, String stadiumName, String startHourStr, String endHourStr, String gender, Integer minGrade, Integer maxGrade, Integer status) {
    // type이 null이거나 빈 문자열이거나 "all"이면 null 처리
    if (type == null || type.trim().isEmpty() || type.equalsIgnoreCase("all")) {
      type = null;
    }

    // gender가 null이거나 빈 문자열이면 null 처리
    if (gender == null || gender.trim().isEmpty()) {
      gender = null;
    }

    // 시간 파싱
    LocalTime startHour = null;
    LocalTime endHour = null;
    if (startHourStr != null && !startHourStr.trim().isEmpty()) {
      startHour = LocalTime.parse(startHourStr);
    }
    if (endHourStr != null && !endHourStr.trim().isEmpty()) {
      endHour = LocalTime.parse(endHourStr);
    }

    return matchRepository.getMatchList(
        type != null ? Match.valueOf(type.toUpperCase()) : null,
        stadiumName,
        startHour,
        endHour,
        gender != null ? Gender.valueOf(gender.toUpperCase()) : null,
        minGrade,
        maxGrade,
        status
    );

  }
}
