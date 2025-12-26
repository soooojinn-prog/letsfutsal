package io.github.wizwix.letsfutsal.board;

import io.github.wizwix.letsfutsal.dto.ArticleDTO;
import io.github.wizwix.letsfutsal.mapper.BoardMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/free")
public class FreeBoardController {
  @Autowired
  private BoardMapper boardMapper;

  // 자유 게시판 목록 및 검색
  @GetMapping({"", "/search"})
  public String list(@RequestParam(required = false) String query, @RequestParam(required = false) String writer, Model model) {
    // TODO: 쿼리를 여기서 직접 해결하기? or BoardMapper 클래스와 mapper_board.xml에 쿼리 처리 방법 삽입
    //List<FreeBoardDTO> list = boardMapper.select(query, writer);
    //model.addAttribute("list", list);
    return "board/list"; // JSP 또는 Thymeleaf 파일 경로
  }

  // 글 상세 보기
  @GetMapping("/view/{id}")
  public String view(@PathVariable Long id, Model model) {
    boardMapper.incrementArticleViews(id); // 조회수 증가
    model.addAttribute("board", boardMapper.selectArticleById(id));
    return "board/view";
  }

  // 글 쓰기 처리
  @PostMapping("/write")
  public String write(ArticleDTO article) {
    // 실제 프로젝트에선 세션에서 로그인한 유저 ID를 가져와 세팅해야 함
    // board.setAuthorId(loginUserId);
    boardMapper.insertArticle(article);
    return "redirect:/free";
  }

  // 글 쓰기 페이지 이동
  @GetMapping("/write")
  public String writeForm() {
    return "board/write";
  }
}
