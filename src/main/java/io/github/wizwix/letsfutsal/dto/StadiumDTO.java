package io.github.wizwix.letsfutsal.dto;

import lombok.Data;

import java.time.LocalTime;

@Data
public class StadiumDTO {
  LocalTime endHour;
  String introduction;
  String location;
  String region;
  long stadiumId;
  LocalTime startHour;
}
