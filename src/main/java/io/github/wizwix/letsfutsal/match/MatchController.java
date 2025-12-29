package io.github.wizwix.letsfutsal.match;

import io.github.wizwix.letsfutsal.dto.MatchDTO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("/match")
public class MatchController {

  private final MatchService matchService;

  public MatchController(MatchService matchService) {
    this.matchService = matchService;
  }

  // 경기 상세 보기
  @GetMapping("/{id}")
  public String detail(@PathVariable Long id, Model model) {
    MatchDTO match = matchService.getMatchById(id);
    if (match == null) {
      return "redirect:/match";
    }

    model.addAttribute("match", match);
    return "match/detail";
  }

  // 경기 목록 조회
  @GetMapping
  public String list(@RequestParam(required = false) String tab,
                     @RequestParam(required = false) String stadiumName,
                     @RequestParam(required = false) String startDate,
                     @RequestParam(required = false) String endDate,
                     @RequestParam(required = false) String gender,
                     @RequestParam(required = false) Integer minGrade,
                     @RequestParam(required = false) Integer maxGrade,
                     @RequestParam(required = false) Boolean available,
                     Model model) {

    List<MatchDTO> matches = matchService.getMatchList(tab, stadiumName, startDate, endDate,
        gender, minGrade, maxGrade, available);

    model.addAttribute("matches", matches);
    model.addAttribute("tab", tab != null ? tab : "전체");
    model.addAttribute("stadiumName", stadiumName);
    model.addAttribute("startDate", startDate);
    model.addAttribute("endDate", endDate);
    model.addAttribute("gender", gender);
    model.addAttribute("minGrade", minGrade);
    model.addAttribute("maxGrade", maxGrade);
    model.addAttribute("available", available);

    return "match/list";
  }
}

