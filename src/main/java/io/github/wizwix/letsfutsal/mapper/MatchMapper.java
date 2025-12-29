package io.github.wizwix.letsfutsal.mapper;

import io.github.wizwix.letsfutsal.dto.MatchDTO;
import io.github.wizwix.letsfutsal.enums.Match;
import org.apache.ibatis.annotations.Param;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

public interface MatchMapper {
  int countIndividualPlayers(@Param("matchId") Long matchId);

  int countTeamParticipants(@Param("matchId") Long matchId);

  int insertIndividualParticipant(@Param("matchId") long matchId, @Param("userId") long userId);

  int insertMatch(@Param("match") MatchDTO match);

  int insertTeamParticipant(@Param("matchId") long matchId, @Param("teamId") long teamId);

  /// Increase or decrease a number that represents how many people are participating the match
  int modifyMatchStatus(@Param("matchId") long matchId, @Param("increment") int adjustment);

  MatchDTO selectMatchById(@Param("matchId") long matchId);

  List<MatchDTO> selectMatchList(@Param("matchType") Match matchType,
                                 @Param("stadiumName") String stadiumName,
                                 @Param("startDateTime") LocalDateTime startDateTime,
                                 @Param("endDateTime") LocalDateTime endDateTime,
                                 @Param("gender") String gender,
                                 @Param("minGrade") Integer minGrade,
                                 @Param("maxGrade") Integer maxGrade,
                                 @Param("available") Boolean available);

  List<MatchDTO> selectMatchesByFilters(@Param("date") LocalDate date, @Param("region") String region, @Param("type") String type);

  List<MatchDTO> selectMatchesByRegionAndType(@Param("region") String region, @Param("type") String type);

  List<MatchDTO> selectUpcomingMatches();

  int updateMatchStatus(@Param("matchId") long matchId, @Param("status") int status);
}
