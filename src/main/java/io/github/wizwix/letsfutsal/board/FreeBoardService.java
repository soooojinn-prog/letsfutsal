package io.github.wizwix.letsfutsal.board;

import io.github.wizwix.letsfutsal.dto.ArticleDTO;
import io.github.wizwix.letsfutsal.dto.CategoryDTO;
import io.github.wizwix.letsfutsal.dto.CommentDTO;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FreeBoardService {
  private final FreeBoardRepository repository;

  public FreeBoardService(FreeBoardRepository repository) {
    this.repository = repository;
  }

  // 게시글 삭제
  @SuppressWarnings("UnusedReturnValue")
  public boolean deleteArticle(Long articleId) {
    return repository.deleteArticle(articleId) > 0;
  }

  // 댓글 삭제
  @SuppressWarnings("UnusedReturnValue")
  public boolean deleteComment(Long commentId) {
    return repository.deleteComment(commentId) > 0;
  }

  // 카테고리 목록
  public List<CategoryDTO> getAllCategories() {
    return repository.getAllCategories();
  }

  // 게시글 상세 조회 (조회수 증가)
  public ArticleDTO getArticleById(Long articleId) {
    ArticleDTO article = repository.getArticleById(articleId);
    if (article != null) {
      repository.increaseViews(articleId);
    }
    return article;
  }

  // 게시글 상세 조회 (조회수 증가 없이)
  public ArticleDTO getArticleByIdWithoutIncreasingViews(Long articleId) {
    return repository.getArticleById(articleId);
  }

  // 게시글 목록 조회
  public List<ArticleDTO> getArticleList(int offset, int limit) {
    return repository.getArticleList(offset, limit);
  }

  // 댓글 목록
  public List<CommentDTO> getCommentsByArticleId(Long articleId) {
    return repository.getCommentsByArticleId(articleId);
  }

  // 검색 결과 개수
  public int getSearchArticleCount(String query, String writer) {
    return repository.getSearchArticleCount(query, writer);
  }

  // 전체 게시글 개수
  public int getTotalArticleCount() {
    return repository.getTotalArticleCount();
  }

  // 게시글 작성
  public Long insertArticle(ArticleDTO dto) {
    return repository.insertArticle(dto);
  }

  // 댓글 작성
  @SuppressWarnings("UnusedReturnValue")
  public Long insertComment(CommentDTO dto) {
    return repository.insertComment(dto);
  }

  // 게시글 검색
  public List<ArticleDTO> searchArticles(String query, String writer, int offset, int limit) {
    return repository.searchArticles(query, writer, offset, limit);
  }

  // 게시글 수정
  public boolean updateArticle(ArticleDTO dto) {
    return repository.updateArticle(dto) > 0;
  }
}
