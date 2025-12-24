package io.github.wizwix.letsfutsal.dto;

import io.github.wizwix.letsfutsal.enums.EntityType;
import lombok.Data;

@Data
public class EntityDTO {
  long entityId;
  EntityType entityType;
  long teamId;
  long userId;
}
