package io.github.wizwix.letsfutsal.stadium;

import io.github.wizwix.letsfutsal.dto.StadiumDTO;

import java.util.ArrayList;
import java.util.List;

public class StadiumRepository {

  private static final List<StadiumDTO> stadiums = new ArrayList<>();

  public List<StadiumDTO> findAll() {
    return stadiums;
  }

  public StadiumDTO findById(long stadiumId) {
    for (StadiumDTO s : stadiums) {
      if (s.getStadiumId() == stadiumId) {
        return s;
      }
    }
    return null;
  }

  public void save(StadiumDTO stadium) {
    stadiums.add(stadium);
  }
}
