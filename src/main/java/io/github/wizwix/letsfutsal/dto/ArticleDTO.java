package io.github.wizwix.letsfutsal.dto;

import java.time.LocalDateTime;
import java.util.Objects;

@SuppressWarnings({"LombokGetterMayBeUsed", "LombokSetterMayBeUsed"})
public class ArticleDTO {
  long articleId;
  long authorId;
  long cateId;
  String content;
  LocalDateTime createdAt;
  String nickname;
  String title;
  long views;

  public ArticleDTO() {}

  public int hashCode() {
    final int PRIME = 59;
    int result = 1;
    final long $articleId = this.getArticleId();
    result = result * PRIME + Long.hashCode($articleId);
    final long $authorId = this.getAuthorId();
    result = result * PRIME + Long.hashCode($authorId);
    final long $cateId = this.getCateId();
    result = result * PRIME + Long.hashCode($cateId);
    final Object $content = this.getContent();
    result = result * PRIME + ($content == null ? 43 : $content.hashCode());
    final Object $createdAt = this.getCreatedAt();
    result = result * PRIME + ($createdAt == null ? 43 : $createdAt.hashCode());
    final Object $nickname = this.getNickname();
    result = result * PRIME + ($nickname == null ? 43 : $nickname.hashCode());
    final Object $title = this.getTitle();
    result = result * PRIME + ($title == null ? 43 : $title.hashCode());
    final long $views = this.getViews();
    result = result * PRIME + Long.hashCode($views);
    return result;
  }

  public boolean equals(final Object o) {
    if (o == this) return true;
    if (!(o instanceof ArticleDTO other)) return false;
    if (!other.canEqual(this)) return false;
    if (this.getArticleId() != other.getArticleId()) return false;
    if (this.getAuthorId() != other.getAuthorId()) return false;
    if (this.getCateId() != other.getCateId()) return false;
    final Object this$content = this.getContent();
    final Object other$content = other.getContent();
    if (!Objects.equals(this$content, other$content)) return false;
    final Object this$createdAt = this.getCreatedAt();
    final Object other$createdAt = other.getCreatedAt();
    if (!Objects.equals(this$createdAt, other$createdAt)) return false;
    final Object this$nickname = this.getNickname();
    final Object other$nickname = other.getNickname();
    if (!Objects.equals(this$nickname, other$nickname)) return false;
    final Object this$title = this.getTitle();
    final Object other$title = other.getTitle();
    if (!Objects.equals(this$title, other$title)) return false;
    return this.getViews() == other.getViews();
  }

  protected boolean canEqual(final Object other) {return other instanceof ArticleDTO;}

  public long getArticleId() {return this.articleId;}

  public void setArticleId(long articleId) {this.articleId = articleId;}

  public long getAuthorId() {return this.authorId;}

  public void setAuthorId(long authorId) {this.authorId = authorId;}

  public long getCateId() {return this.cateId;}

  public void setCateId(long cateId) {this.cateId = cateId;}

  public String getContent() {return this.content;}

  public void setContent(String content) {this.content = content;}

  public LocalDateTime getCreatedAt() {return this.createdAt;}

  public void setCreatedAt(LocalDateTime createdAt) {this.createdAt = createdAt;}

  public String getNickname() {return this.nickname;}

  public void setNickname(String nickname) {this.nickname = nickname;}

  public String getTitle() {return this.title;}

  public void setTitle(String title) {this.title = title;}

  public long getViews() {return this.views;}

  public void setViews(long views) {this.views = views;}

  public String toString() {return "ArticleDTO(articleId=" + this.getArticleId() + ", authorId=" + this.getAuthorId() + ", cateId=" + this.getCateId() + ", content=" + this.getContent() + ", createdAt=" + this.getCreatedAt() + ", nickname=" + this.getNickname() + ", title=" + this.getTitle() + ", views=" + this.getViews() + ")";}
}
