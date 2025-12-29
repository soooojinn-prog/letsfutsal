package io.github.wizwix.letsfutsal.rank;

import io.github.wizwix.letsfutsal.dto.UserDTO;
import io.github.wizwix.letsfutsal.mapper.TeamMapper;
import io.github.wizwix.letsfutsal.mapper.UserMapper;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RankService implements IRankService {
  private final TeamMapper teamMapper;
  private final UserMapper userMapper;

  public RankService(UserMapper userMapper, TeamMapper teamMapper) {
    this.userMapper = userMapper;
    this.teamMapper = teamMapper;
  }

  @Override
  public List<TeamRankDTO> getTeamRankings(int grade) {
    return teamMapper.selectTopTeamsByGrade(grade);
  }

  @Override
  public List<UserDTO> getUserRankings(int grade, String position) {
    return userMapper.selectTopUsersByGradeAndPosition(grade, position);
  }
}
