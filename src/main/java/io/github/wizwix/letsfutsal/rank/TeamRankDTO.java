package io.github.wizwix.letsfutsal.rank;

@SuppressWarnings({"LombokGetterMayBeUsed", "LombokSetterMayBeUsed"})
public class TeamRankDTO {
  private long averagePoints;   // 팀원들의 평균 포인트
  private int memberCount;      // 팀원 수
  private String region;
  private long teamId;
  private String teamName;
  private long totalPoints;     // 팀원들의 총 포인트

  public TeamRankDTO() {}

  public TeamRankDTO(long teamId, String teamName, long totalPoints, long averagePoints, int memberCount, String region) {
    this.teamId = teamId;
    this.teamName = teamName;
    this.totalPoints = totalPoints;
    this.averagePoints = averagePoints;
    this.memberCount = memberCount;
    this.region = region;
  }

  public long getAveragePoints() {
    return averagePoints;
  }

  public void setAveragePoints(long averagePoints) {
    this.averagePoints = averagePoints;
  }

  public int getMemberCount() {
    return memberCount;
  }

  public void setMemberCount(int memberCount) {
    this.memberCount = memberCount;
  }

  public String getRegion() {
    return region;
  }

  public void setRegion(String region) {
    this.region = region;
  }

  public long getTeamId() {
    return teamId;
  }

  public void setTeamId(long teamId) {
    this.teamId = teamId;
  }

  public String getTeamName() {
    return teamName;
  }

  public void setTeamName(String teamName) {
    this.teamName = teamName;
  }

  public long getTotalPoints() {
    return totalPoints;
  }

  public void setTotalPoints(long totalPoints) {
    this.totalPoints = totalPoints;
  }
}
