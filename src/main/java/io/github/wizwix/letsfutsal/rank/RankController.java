package io.github.wizwix.letsfutsal.rank;

import io.github.wizwix.letsfutsal.dto.UserDTO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("/rank")
public class RankController {
  private final IRankService rankService;

  public RankController(IRankService rankService) {
    this.rankService = rankService;
  }

  @GetMapping
  public String rankPage(@RequestParam(name = "type", defaultValue = "individual") String type, @RequestParam(name = "grade", defaultValue = "-1") int grade, @RequestParam(name = "position", defaultValue = "") String position, @RequestParam(name = "gender", defaultValue = "") String gender, Model model) {
    if ("team".equals(type)) {
      // 팀 랭킹
      List<TeamRankDTO> teamRankings = rankService.getTeamRankings(grade);
      model.addAttribute("rankings", teamRankings);
      model.addAttribute("type", "team");
    } else if ("gender".equals(type)) {
      // 성별 랭킹
      List<UserDTO> genderRankings = rankService.getGenderRankings(gender, grade);
      model.addAttribute("rankings", genderRankings);
      model.addAttribute("type", "gender");
    } else {
      // 개인 랭킹 (기본값)
      List<UserDTO> userRankings = rankService.getUserRankings(grade, position);
      model.addAttribute("rankings", userRankings);
      model.addAttribute("type", "individual");
    }

    model.addAttribute("selectedGrade", grade);
    model.addAttribute("selectedPosition", position);
    model.addAttribute("selectedGender", gender);

    return "rank/rank";
  }
}
