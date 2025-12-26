package io.github.wizwix.letsfutsal.repository;

import io.github.wizwix.letsfutsal.dto.TeamDTO;

import java.util.ArrayList;
import java.util.List;

public class TeamRepository {
  private static final List<TeamDTO> teams = new ArrayList<>();

  public List<TeamDTO> findAll() {
    return teams;
  }

  public TeamDTO findById(String team_id) {
    for (TeamDTO t : teams) {
      // FIXME
      if (t.getTeamId() == t.getTeamId()) {
        return t;
      }
    }
    return null;
  }

  public void save(TeamDTO team) {
    teams.add(team);
  }
}
