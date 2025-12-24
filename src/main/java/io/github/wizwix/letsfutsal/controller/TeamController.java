package io.github.wizwix.letsfutsal.controller;

import io.github.wizwix.letsfutsal.dto.TeamDTO;
import io.github.wizwix.letsfutsal.enums.Gender;
import io.github.wizwix.letsfutsal.service.TeamService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/team")
@RequiredArgsConstructor
public class TeamController {

  private final TeamService service;

  @PostMapping("/create")
  public String create(@RequestParam String teamName, @RequestParam Gender gender, @RequestParam long minGrade,
                       @RequestParam long maxGrade, @RequestParam String region, @RequestParam String introduction) {
    TeamDTO dto = new TeamDTO();
    dto.setTeamName(teamName);
    dto.setGender(gender);
    dto.setMinGrade(minGrade);
    dto.setMaxGrade(maxGrade);
    dto.setRegion(region);
    dto.setIntroduction(introduction);

    service.create(dto);
    return "redirect:/team";
  }

  @GetMapping("/create")
  public String createForm() {
    return "team/create";
  }

  @GetMapping({"", "/", "/list"})
  public String list(Model model) {
    model.addAttribute("teams", service.list());
    return "team/list";
  }

  @GetMapping("/profile/{teamId}")
  public String profile(@PathVariable long teamId, Model model) {
    model.addAttribute("team", service.get(teamId));
    return "team/profile";
  }
}


//	private final TeamService service = new TeamService();
//
//	@Override
//	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//
//		String path = req.getPathInfo();
//
//		// /team 또는 /team/
//		if (path == null || path.equals("/")) {
//			req.getRequestDispatcher("/WEB-INF/views/team/main.jsp").forward(req, resp);
//		}
//		// /team/list
//		else if (path.equals("/list")) {
//			req.setAttribute("teams", service.list()); // ⭐ 핵심
//			req.getRequestDispatcher("/WEB-INF/views/team/list.jsp").forward(req, resp);
//		}
//		// /team/create
//		else if (path.equals("/create")) {
//			req.getRequestDispatcher("/WEB-INF/views/team/create.jsp").forward(req, resp);
//		}
//		// /team/profile/{team_id}
//		else if (path.startsWith("/profile/")) {
//			String teamId = path.substring("/profile/".length());
//			req.setAttribute("team", service.get(teamId));
//			req.getRequestDispatcher("/WEB-INF/views/team/profile.jsp").forward(req, resp);
//		}
//	}
//
//	@Override
//	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
//
//		req.setCharacterEncoding("UTF-8");
//
//		TeamDto dto = new TeamDto();
//		dto.setTeam_id(req.getParameter("team_id"));
//		dto.setGender(req.getParameter("gender"));
//		dto.setMin_grade(req.getParameter("min_grade"));
//		dto.setMax_grade(req.getParameter("max_grade"));
//		dto.setRegion(req.getParameter("region"));
//		dto.setIntroduction(req.getParameter("introduction"));
//
//		service.create(dto);
//		resp.sendRedirect(req.getContextPath() + "/team"); // 생성 후 목록으로 이동
//	}
//}
