package io.github.wizwix.letsfutsal.dto;

import java.util.Objects;

@SuppressWarnings({"LombokGetterMayBeUsed", "LombokSetterMayBeUsed"})
public class CategoryDTO {
  long cateId;
  String cateName;

  public CategoryDTO() {}

  public int hashCode() {
    final int PRIME = 59;
    int result = 1;
    final long $cateId = this.getCateId();
    result = result * PRIME + Long.hashCode($cateId);
    final Object $cateName = this.getCateName();
    result = result * PRIME + ($cateName == null ? 43 : $cateName.hashCode());
    return result;
  }

  public boolean equals(final Object o) {
    if (o == this) return true;
    if (!(o instanceof CategoryDTO other)) return false;
    if (!other.canEqual(this)) return false;
    if (this.getCateId() != other.getCateId()) return false;
    final Object this$cateName = this.getCateName();
    final Object other$cateName = other.getCateName();
    return Objects.equals(this$cateName, other$cateName);
  }

  protected boolean canEqual(final Object other) {return other instanceof CategoryDTO;}

  public String toString() {return "CategoryDTO(cateId=" + this.getCateId() + ", cateName=" + this.getCateName() + ")";}

  public long getCateId() {return this.cateId;}

  public void setCateId(long cateId) {this.cateId = cateId;}

  public String getCateName() {return this.cateName;}

  public void setCateName(String cateName) {this.cateName = cateName;}
}
