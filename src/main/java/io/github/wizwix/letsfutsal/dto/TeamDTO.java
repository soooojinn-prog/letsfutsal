package io.github.wizwix.letsfutsal.dto;

import io.github.wizwix.letsfutsal.enums.Gender;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class TeamDTO {
  Gender gender;
  String introduction;
  long leaderId;
  long maxGrade;
  long minGrade;
  String region;
  long teamId;
  String teamName;
}
