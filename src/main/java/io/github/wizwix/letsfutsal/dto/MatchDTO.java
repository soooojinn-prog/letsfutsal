package io.github.wizwix.letsfutsal.dto;

import com.fasterxml.jackson.annotation.JsonFormat;
import io.github.wizwix.letsfutsal.enums.Gender;
import io.github.wizwix.letsfutsal.enums.Match;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.Objects;

@SuppressWarnings({"LombokGetterMayBeUsed", "LombokSetterMayBeUsed"})
public class MatchDTO {
  @JsonFormat(pattern = "HH:mm")
  LocalTime endHour;
  Gender gender;
  @JsonFormat(pattern = "yyyy-MM-dd")
  LocalDate matchDate;
  long matchId;
  Match matchType;
  int maxGrade;
  int minGrade;
  String region;
  long renterEntityId;
  long stadiumId;
  String stadiumName;
  @JsonFormat(pattern = "HH:mm")
  LocalTime startHour;
  int status;

  public MatchDTO() {}

  public String getRegion() {return region;}

  public void setRegion(String region) {this.region = region;}

  public String getStadiumName() {return stadiumName;}

  public void setStadiumName(String stadiumName) {this.stadiumName = stadiumName;}

  public int hashCode() {
    final int PRIME = 59;
    int result = 1;
    final Object $endHour = this.getEndHour();
    result = result * PRIME + ($endHour == null ? 43 : $endHour.hashCode());
    final Object $gender = this.getGender();
    result = result * PRIME + ($gender == null ? 43 : $gender.hashCode());
    final Object $matchDate = this.getMatchDate();
    result = result * PRIME + ($matchDate == null ? 43 : $matchDate.hashCode());
    final long $matchId = this.getMatchId();
    result = result * PRIME + Long.hashCode($matchId);
    final Object $matchType = this.getMatchType();
    result = result * PRIME + ($matchType == null ? 43 : $matchType.hashCode());
    result = result * PRIME + this.getMaxGrade();
    result = result * PRIME + this.getMinGrade();
    final long $renterEntityId = this.getRenterEntityId();
    result = result * PRIME + Long.hashCode($renterEntityId);
    final long $stadiumId = this.getStadiumId();
    result = result * PRIME + Long.hashCode($stadiumId);
    final Object $startHour = this.getStartHour();
    result = result * PRIME + ($startHour == null ? 43 : $startHour.hashCode());
    result = result * PRIME + this.getStatus();
    return result;
  }

  public boolean equals(final Object o) {
    if (o == this) return true;
    if (!(o instanceof MatchDTO other)) return false;
    if (!other.canEqual(this)) return false;
    final Object this$endHour = this.getEndHour();
    final Object other$endHour = other.getEndHour();
    if (!Objects.equals(this$endHour, other$endHour)) return false;
    final Object this$gender = this.getGender();
    final Object other$gender = other.getGender();
    if (!Objects.equals(this$gender, other$gender)) return false;
    final Object this$matchDate = this.getMatchDate();
    final Object other$matchDate = other.getMatchDate();
    if (!Objects.equals(this$matchDate, other$matchDate)) return false;
    if (this.getMatchId() != other.getMatchId()) return false;
    final Object this$matchType = this.getMatchType();
    final Object other$matchType = other.getMatchType();
    if (!Objects.equals(this$matchType, other$matchType)) return false;
    if (this.getMaxGrade() != other.getMaxGrade()) return false;
    if (this.getMinGrade() != other.getMinGrade()) return false;
    if (this.getRenterEntityId() != other.getRenterEntityId()) return false;
    if (this.getStadiumId() != other.getStadiumId()) return false;
    final Object this$startHour = this.getStartHour();
    final Object other$startHour = other.getStartHour();
    if (!Objects.equals(this$startHour, other$startHour)) return false;
    return this.getStatus() == other.getStatus();
  }

  protected boolean canEqual(final Object other) {return other instanceof MatchDTO;}

  public String toString() {return "MatchDTO(endHour=" + this.getEndHour() + ", gender=" + this.getGender() + ", matchDate=" + this.getMatchDate() + ", matchId=" + this.getMatchId() + ", matchType=" + this.getMatchType() + ", maxGrade=" + this.getMaxGrade() + ", minGrade=" + this.getMinGrade() + ", renterEntityId=" + this.getRenterEntityId() + ", stadiumId=" + this.getStadiumId() + ", startHour=" + this.getStartHour() + ", status=" + this.getStatus() + ")";}

  public LocalTime getEndHour() {return this.endHour;}

  public void setEndHour(LocalTime endHour) {this.endHour = endHour;}

  public Gender getGender() {return this.gender;}

  public void setGender(Gender gender) {this.gender = gender;}

  public LocalDate getMatchDate() {return this.matchDate;}

  public void setMatchDate(LocalDate matchDate) {this.matchDate = matchDate;}

  public long getMatchId() {return this.matchId;}

  public void setMatchId(long matchId) {this.matchId = matchId;}

  public Match getMatchType() {return this.matchType;}

  public void setMatchType(Match matchType) {this.matchType = matchType;}

  public int getMaxGrade() {return this.maxGrade;}

  public void setMaxGrade(int maxGrade) {this.maxGrade = maxGrade;}

  public int getMinGrade() {return this.minGrade;}

  public void setMinGrade(int minGrade) {this.minGrade = minGrade;}

  public long getRenterEntityId() {return this.renterEntityId;}

  public void setRenterEntityId(long renterEntityId) {this.renterEntityId = renterEntityId;}

  public long getStadiumId() {return this.stadiumId;}

  public void setStadiumId(long stadiumId) {this.stadiumId = stadiumId;}

  public LocalTime getStartHour() {return this.startHour;}

  public void setStartHour(LocalTime startHour) {this.startHour = startHour;}

  public int getStatus() {return this.status;}

  public void setStatus(int status) {this.status = status;}
}
