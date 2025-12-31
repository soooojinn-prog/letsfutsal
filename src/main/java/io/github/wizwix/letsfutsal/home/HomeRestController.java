package io.github.wizwix.letsfutsal.home;

import io.github.wizwix.letsfutsal.dto.MatchDTO;
import io.github.wizwix.letsfutsal.mapper.MatchMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.time.LocalDate;
import java.util.List;

@RestController
public class HomeRestController {
  @Autowired
  private MatchMapper matchMapper;

  @GetMapping("/api/matches")
  @ResponseBody
  public List<MatchDTO> getMatches(@RequestParam("date") @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate date, @RequestParam("region") String region, @RequestParam("type") String type) {
    return matchMapper.selectMatchesByFilters(date, region, type);
  }
}
