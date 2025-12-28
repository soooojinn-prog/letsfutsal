package io.github.wizwix.letsfutsal.mapper;

import io.github.wizwix.letsfutsal.dto.MatchDTO;
import org.apache.ibatis.annotations.Param;

import java.time.LocalDate;
import java.util.List;

public interface MatchMapper {
  int insertIndividualParticipant(@Param("matchId") long matchId, @Param("userId") long userId);

  int insertMatch(@Param("match") MatchDTO match);

  int insertTeamParticipant(@Param("matchId") long matchId, @Param("teamId") long teamId);

  /// Increase or decrease a number that represents how many people are participating the match
  int modifyMatchStatus(@Param("matchId") long matchId, @Param("increment") int adjustment);

  MatchDTO selectMatchById(@Param("matchId") long matchId);

  List<MatchDTO> selectMatchesByFilters(@Param("date") LocalDate date, @Param("region") String region, @Param("type") String type);

  List<MatchDTO> selectMatchesByRegionAndType(@Param("region") String region, @Param("type") String type);

  List<MatchDTO> selectUpcomingMatches();

  int updateMatchStatus(@Param("matchId") long matchId, @Param("status") int status);
}
