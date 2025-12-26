package io.github.wizwix.letsfutsal.team;

import io.github.wizwix.letsfutsal.dto.TeamDTO;

import java.util.ArrayList;
import java.util.List;

public class TeamRepository {

  private static final List<TeamDTO> teams = new ArrayList<>();

  public List<TeamDTO> findAll() {
    return teams;
  }

	public TeamDTO findById(String teamId) {
		long id = Long.parseLong(teamId);

		for (TeamDTO t : teams) {
			if (t.getTeamId() == id) {
				return t;
			}
		}
		return null;
	}

	public void save(TeamDTO team) {
    teams.add(team);
  }
}
