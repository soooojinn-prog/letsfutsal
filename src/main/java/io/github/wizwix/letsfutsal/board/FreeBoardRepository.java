package io.github.wizwix.letsfutsal.board;

import io.github.wizwix.letsfutsal.dto.ArticleDTO;
import io.github.wizwix.letsfutsal.dto.ArticleDTO;
import io.github.wizwix.letsfutsal.dto.CategoryDTO;
import io.github.wizwix.letsfutsal.dto.CommentDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

import java.sql.PreparedStatement;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.List;

@Repository
public class FreeBoardRepository {
  @Autowired
  private JdbcTemplate jdbcTemplate;

//  public FreeBoardRepository(JdbcTemplate jdbcTemplate) {
//    this.jdbcTemplate = jdbcTemplate;
//  }

  private final RowMapper<ArticleDTO> articleRowMapper = (rs, rowNum) -> {
    ArticleDTO dto = new ArticleDTO();
    dto.setArticleId(rs.getLong("article_id"));
    dto.setCateId(rs.getLong("cate_id"));
    dto.setAuthorId(rs.getLong("author_id"));
    dto.setTitle(rs.getString("title"));
    dto.setContent(rs.getString("content"));
    Timestamp timestamp = rs.getTimestamp("created_at");
    if (timestamp != null) {
      dto.setCreatedAt(timestamp.toLocalDateTime());
    }
    dto.setViews(rs.getLong("views"));
    dto.setCateName(rs.getString("cate_name"));
    dto.setAuthorNickname(rs.getString("nickname"));
    return dto;
  };

  private final RowMapper<CommentDTO> commentRowMapper = (rs, rowNum) -> {
    CommentDTO dto = new CommentDTO();
    dto.setCommentId(rs.getLong("comment_id"));
    dto.setArticleId(rs.getLong("article_id"));
    dto.setAuthorId(rs.getLong("author_id"));
    Long parentId = rs.getLong("parent_id");
    dto.setParentId(rs.wasNull() ? null : parentId);
    dto.setContent(rs.getString("content"));
    Timestamp timestamp = rs.getTimestamp("created_at");
    if (timestamp != null) {
      dto.setCreatedAt(timestamp.toLocalDateTime());
    }
    dto.setDeleted(rs.getBoolean("is_deleted"));
    dto.setAuthorNickname(rs.getString("nickname"));
    return dto;
  };

  private final RowMapper<CategoryDTO> categoryRowMapper = (rs, rowNum) -> {
    CategoryDTO dto = new CategoryDTO();
    dto.setCateId(rs.getLong("cate_id"));
    dto.setCateName(rs.getString("cate_name"));
    return dto;
  };

  // 전체 게시글 개수
  public int getTotalArticleCount() {
    String sql = "SELECT COUNT(*) FROM letsfutsal.free_board";
    Integer count = jdbcTemplate.queryForObject(sql, Integer.class);
    return count != null ? count : 0;
  }

  // 검색 결과 개수
  public int getSearchArticleCount(String query, String writer) {
    StringBuilder sql = new StringBuilder("SELECT COUNT(*) FROM letsfutsal.free_board fb ");
    sql.append("JOIN letsfutsal.users u ON fb.author_id = u.user_id WHERE 1=1 ");

    if (query != null && !query.trim().isEmpty()) {
      sql.append("AND (fb.title LIKE ? OR fb.content LIKE ?) ");
    }
    if (writer != null && !writer.trim().isEmpty()) {
      sql.append("AND u.nickname LIKE ? ");
    }

    if (query != null && !query.trim().isEmpty() && writer != null && !writer.trim().isEmpty()) {
      Integer count = jdbcTemplate.queryForObject(sql.toString(), Integer.class,
          "%" + query + "%", "%" + query + "%", "%" + writer + "%");
      return count != null ? count : 0;
    } else if (query != null && !query.trim().isEmpty()) {
      Integer count = jdbcTemplate.queryForObject(sql.toString(), Integer.class,
          "%" + query + "%", "%" + query + "%");
      return count != null ? count : 0;
    } else if (writer != null && !writer.trim().isEmpty()) {
      Integer count = jdbcTemplate.queryForObject(sql.toString(), Integer.class,
          "%" + writer + "%");
      return count != null ? count : 0;
    }

    Integer count = jdbcTemplate.queryForObject(sql.toString(), Integer.class);
    return count != null ? count : 0;
  }

  // 게시글 목록 조회
  public List<ArticleDTO> getArticleList(int offset, int limit) {
    String sql = "SELECT fb.article_id, fb.cate_id, fb.author_id, fb.title, fb.content, " +
        "fb.created_at, fb.views, fbc.cate_name, u.nickname " +
        "FROM letsfutsal.free_board fb " +
        "JOIN letsfutsal.free_board_category fbc ON fb.cate_id = fbc.cate_id " +
        "JOIN letsfutsal.users u ON fb.author_id = u.user_id " +
        "ORDER BY fb.article_id DESC LIMIT ? OFFSET ?";

    return jdbcTemplate.query(sql, articleRowMapper, limit, offset);
  }

  // 게시글 검색
  public List<ArticleDTO> searchArticles(String query, String writer, int offset, int limit) {
    StringBuilder sql = new StringBuilder("SELECT fb.article_id, fb.cate_id, fb.author_id, fb.title, fb.content, ");
    sql.append("fb.created_at, fb.views, fbc.cate_name, u.nickname ");
    sql.append("FROM letsfutsal.free_board fb ");
    sql.append("JOIN letsfutsal.free_board_category fbc ON fb.cate_id = fbc.cate_id ");
    sql.append("JOIN letsfutsal.users u ON fb.author_id = u.user_id WHERE 1=1 ");

    if (query != null && !query.trim().isEmpty()) {
      sql.append("AND (fb.title LIKE ? OR fb.content LIKE ?) ");
    }
    if (writer != null && !writer.trim().isEmpty()) {
      sql.append("AND u.nickname LIKE ? ");
    }
    sql.append("ORDER BY fb.article_id DESC LIMIT ? OFFSET ?");

    if (query != null && !query.trim().isEmpty() && writer != null && !writer.trim().isEmpty()) {
      return jdbcTemplate.query(sql.toString(), articleRowMapper,
          "%" + query + "%", "%" + query + "%", "%" + writer + "%", limit, offset);
    } else if (query != null && !query.trim().isEmpty()) {
      return jdbcTemplate.query(sql.toString(), articleRowMapper,
          "%" + query + "%", "%" + query + "%", limit, offset);
    } else if (writer != null && !writer.trim().isEmpty()) {
      return jdbcTemplate.query(sql.toString(), articleRowMapper,
          "%" + writer + "%", limit, offset);
    }

    return jdbcTemplate.query(sql.toString(), articleRowMapper, limit, offset);
  }

  // 게시글 상세 조회
  public ArticleDTO getArticleById(Long articleId) {
    String sql = "SELECT fb.article_id, fb.cate_id, fb.author_id, fb.title, fb.content, " +
        "fb.created_at, fb.views, fbc.cate_name, u.nickname " +
        "FROM letsfutsal.free_board fb " +
        "JOIN letsfutsal.free_board_category fbc ON fb.cate_id = fbc.cate_id " +
        "JOIN letsfutsal.users u ON fb.author_id = u.user_id " +
        "WHERE fb.article_id = ?";

    List<ArticleDTO> results = jdbcTemplate.query(sql, articleRowMapper, articleId);
    return results.isEmpty() ? null : results.get(0);
  }

  // 조회수 증가
  public void increaseViews(Long articleId) {
    String sql = "UPDATE letsfutsal.free_board SET views = views + 1 WHERE article_id = ?";
    jdbcTemplate.update(sql, articleId);
  }

  // 게시글 작성
  public Long insertArticle(ArticleDTO dto) {
    String sql = "INSERT INTO letsfutsal.free_board (cate_id, author_id, title, content) VALUES (?, ?, ?, ?)";

    KeyHolder keyHolder = new GeneratedKeyHolder();
    jdbcTemplate.update(connection -> {
      PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
      ps.setLong(1, dto.getCateId());
      ps.setLong(2, dto.getAuthorId());
      ps.setString(3, dto.getTitle());
      ps.setString(4, dto.getContent());
      return ps;
    }, keyHolder);

    return keyHolder.getKey() != null ? keyHolder.getKey().longValue() : null;
  }

  // 게시글 수정
  public int updateArticle(ArticleDTO dto) {
    String sql = "UPDATE letsfutsal.free_board SET cate_id = ?, title = ?, content = ? WHERE article_id = ?";
    return jdbcTemplate.update(sql, dto.getCateId(), dto.getTitle(), dto.getContent(), dto.getArticleId());
  }

  // 게시글 삭제
  public int deleteArticle(Long articleId) {
    String sql = "DELETE FROM letsfutsal.free_board WHERE article_id = ?";
    return jdbcTemplate.update(sql, articleId);
  }

  // 카테고리 목록
  public List<CategoryDTO> getAllCategories() {
    String sql = "SELECT cate_id, cate_name FROM letsfutsal.free_board_category ORDER BY cate_id";
    return jdbcTemplate.query(sql, categoryRowMapper);
  }

  // 댓글 목록
  public List<CommentDTO> getCommentsByArticleId(Long articleId) {
    String sql = "SELECT fbc.comment_id, fbc.article_id, fbc.author_id, fbc.parent_id, " +
        "fbc.content, fbc.created_at, fbc.is_deleted, u.nickname " +
        "FROM letsfutsal.free_board_comment fbc " +
        "JOIN letsfutsal.users u ON fbc.author_id = u.user_id " +
        "WHERE fbc.article_id = ? ORDER BY fbc.comment_id ASC";

    return jdbcTemplate.query(sql, commentRowMapper, articleId);
  }

  // 댓글 작성
  public Long insertComment(CommentDTO dto) {
    String sql = "INSERT INTO letsfutsal.free_board_comment (article_id, author_id, parent_id, content) VALUES (?, ?, ?, ?)";

    KeyHolder keyHolder = new GeneratedKeyHolder();
    jdbcTemplate.update(connection -> {
      PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
      ps.setLong(1, dto.getArticleId());
      ps.setLong(2, dto.getAuthorId());
      if (dto.getParentId() != null) {
        ps.setLong(3, dto.getParentId());
      } else {
        ps.setNull(3, java.sql.Types.BIGINT);
      }
      ps.setString(4, dto.getContent());
      return ps;
    }, keyHolder);

    return keyHolder.getKey() != null ? keyHolder.getKey().longValue() : null;
  }

  // 댓글 삭제 (소프트 삭제)
  public int deleteComment(Long commentId) {
    String sql = "UPDATE letsfutsal.free_board_comment SET is_deleted = true WHERE comment_id = ?";
    return jdbcTemplate.update(sql, commentId);
  }
}
