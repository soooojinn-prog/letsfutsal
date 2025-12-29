package io.github.wizwix.letsfutsal.match;

import io.github.wizwix.letsfutsal.dto.MatchDTO;
import io.github.wizwix.letsfutsal.mapper.MatchMapper;
import org.springframework.stereotype.Repository;

import java.time.LocalDateTime;
import java.util.List;

@Repository
public class MatchRepository {

  private final MatchMapper matchMapper;

  public MatchRepository(MatchMapper matchMapper) {
    this.matchMapper = matchMapper;
  }

  // 개인 경기 참가자 수 조회
  public int countIndividualPlayers(Long matchId) {
    return matchMapper.countIndividualPlayers(matchId);
  }

  // 팀 경기 참가 팀 수 조회
  public int countTeamParticipants(Long matchId) {
    return matchMapper.countTeamParticipants(matchId);
  }

  // 경기 상세 조회
  public MatchDTO getMatchById(Long matchId) {
    return matchMapper.selectMatchById(matchId);
  }

  // 경기 목록 조회 (필터링 포함)
  public List<MatchDTO> getMatchList(String matchType, String stadiumName,
                                     LocalDateTime startDateTime, LocalDateTime endDateTime,
                                     String gender, Integer minGrade, Integer maxGrade,
                                     Boolean available) {
    return matchMapper.selectMatchList(matchType, stadiumName, startDateTime, endDateTime,
        gender, minGrade, maxGrade, available);
  }
}

