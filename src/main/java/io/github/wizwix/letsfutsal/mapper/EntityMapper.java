package io.github.wizwix.letsfutsal.mapper;

import org.apache.ibatis.annotations.Param;

public interface EntityMapper {
  Long findEntityIdByTeamId(@Param("teamId") long teamId);

  Long findEntityIdByUserId(@Param("userId") long userId);
}
