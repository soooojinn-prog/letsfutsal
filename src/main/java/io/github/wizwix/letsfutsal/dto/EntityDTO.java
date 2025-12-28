package io.github.wizwix.letsfutsal.dto;

import io.github.wizwix.letsfutsal.enums.EntityType;

import java.util.Objects;

@SuppressWarnings({"LombokGetterMayBeUsed", "LombokSetterMayBeUsed"})
public class EntityDTO {
  long entityId;
  EntityType entityType;
  long teamId;
  long userId;

  public EntityDTO() {}

  public int hashCode() {
    final int PRIME = 59;
    int result = 1;
    final long $entityId = this.getEntityId();
    result = result * PRIME + Long.hashCode($entityId);
    final Object $entityType = this.getEntityType();
    result = result * PRIME + ($entityType == null ? 43 : $entityType.hashCode());
    final long $teamId = this.getTeamId();
    result = result * PRIME + Long.hashCode($teamId);
    final long $userId = this.getUserId();
    result = result * PRIME + Long.hashCode($userId);
    return result;
  }

  public boolean equals(final Object o) {
    if (o == this) return true;
    if (!(o instanceof EntityDTO other)) return false;
    if (!other.canEqual(this)) return false;
    if (this.getEntityId() != other.getEntityId()) return false;
    final Object this$entityType = this.getEntityType();
    final Object other$entityType = other.getEntityType();
    if (!Objects.equals(this$entityType, other$entityType)) return false;
    if (this.getTeamId() != other.getTeamId()) return false;
    return this.getUserId() == other.getUserId();
  }

  protected boolean canEqual(final Object other) {return other instanceof EntityDTO;}

  public String toString() {return "EntityDTO(entityId=" + this.getEntityId() + ", entityType=" + this.getEntityType() + ", teamId=" + this.getTeamId() + ", userId=" + this.getUserId() + ")";}

  public long getEntityId() {return this.entityId;}

  public void setEntityId(long entityId) {this.entityId = entityId;}

  public EntityType getEntityType() {return this.entityType;}

  public void setEntityType(EntityType entityType) {this.entityType = entityType;}

  public long getTeamId() {return this.teamId;}

  public void setTeamId(long teamId) {this.teamId = teamId;}

  public long getUserId() {return this.userId;}

  public void setUserId(long userId) {this.userId = userId;}
}
