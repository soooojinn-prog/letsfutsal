package io.github.wizwix.letsfutsal.mapper;

import io.github.wizwix.letsfutsal.dto.TeamDTO;
import io.github.wizwix.letsfutsal.dto.UserDTO;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface TeamMapper {
	
  int addMemberToTeam(@Param("teamId") long teamId, @Param("userId") long userId);

  @Insert("""
		  INSERT INTO team (
		      team_name,
		      gender,
		      min_grade,
		      max_grade,
		      region,
		      introduction,
		      leader_id
		  ) VALUES (
		      #{team.teamName},
		      #{team.gender},
		      #{team.minGrade},
		      #{team.maxGrade},
		      #{team.region},
		      #{team.introduction},
		      #{team.leaderId}
		  )
		  """)
  @Options(useGeneratedKeys = true, keyProperty = "team.teamId")
  int insertTeam(@Param("team") TeamDTO team);

  int removeMemberFromTeam(@Param("teamId") long teamId, @Param("userId") long userId);

  List<UserDTO> selectMembersByTeamId(@Param("teamId") long teamId);

  TeamDTO selectTeamById(@Param("teamId") long teamId);

  List<TeamDTO> selectTeamsByRegion(@Param("region") String region);

  int updateTeam(@Param("team") TeamDTO team);

	@Select("""
			SELECT
			  team_id     AS teamId,
			  team_name   AS teamName,
			  gender,
			  min_grade   AS minGrade,
			  max_grade   AS maxGrade,
			  region,
			  introduction,
			  leader_id   AS leaderId
			FROM team
			""")
	List<TeamDTO> selectAllTeams();
}
