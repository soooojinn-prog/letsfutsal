package io.github.wizwix.letsfutsal.mapper;

import io.github.wizwix.letsfutsal.dto.TeamDTO;
import io.github.wizwix.letsfutsal.dto.UserDTO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserMapper {
  int deleteUser(@Param("userId") long userId);

  int insertUser(@Param("user") UserDTO user);

  String selectNicknameByUserId(@Param("userId") long userId);

  List<TeamDTO> selectTeamsByUserId(@Param("userId") long userId);

  List<UserDTO> selectTopUsersByGender(@Param("gender") String gender, @Param("grade") int grade);

  List<UserDTO> selectTopUsersByGradeAndPosition(@Param("grade") int grade, @Param("position") String position);

  UserDTO selectUserByEmail(@Param("email") String email);

  UserDTO selectUserById(@Param("userId") long userId);

  int updateGrade(@Param("userId") long userId, @Param("grade") long grade);

  int updatePoints(@Param("userId") long userId, @Param("point") long point);

  int updateUser(@Param("user") UserDTO user);
}
