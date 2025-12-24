package io.github.wizwix.letsfutsal.dto;

import lombok.Data;

@Data
public class CommentDTO {
  long articleId;
  long authorId;
  long commentId;
  String content;
  long parentId;
}
