package io.github.wizwix.letsfutsal.rank;

import io.github.wizwix.letsfutsal.dto.UserDTO;

import java.util.List;

public interface IRankService {
  /**
   * 팀 랭킹 조회 (등급별 TOP 10)
   *
   * @param grade 등급 필터 (-1: 전체, 0~3: 특정 등급)
   * @return 팀원 평균 포인트 기준 상위 10개 팀 리스트
   */
  List<TeamRankDTO> getTeamRankings(int grade);

  /**
   * 개인 랭킹 조회 (등급별, 포지션별 TOP 10)
   *
   * @param grade    등급 필터 (-1: 전체, 0~3: 특정 등급)
   * @param position 포지션 필터 ("": 전체, 특정 포지션)
   * @return 포인트 기준 상위 10명의 사용자 리스트
   */
  List<UserDTO> getUserRankings(int grade, String position);
}
