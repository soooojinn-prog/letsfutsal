package io.github.wizwix.letsfutsal.stadium;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import io.github.wizwix.letsfutsal.dto.StadiumDTO;
import io.github.wizwix.letsfutsal.mapper.StadiumMapper;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class StadiumService {

  private final StadiumMapper stadiumMapper;

  public void create(StadiumDTO stadium) {
    stadiumMapper.insertStadium(stadium);
  }

  public StadiumDTO get(long stadiumId) {
    return stadiumMapper.selectStadiumById(stadiumId);
  }

  public List<StadiumDTO> list() {
    return stadiumMapper.selectAllStadiums();
  }

}
