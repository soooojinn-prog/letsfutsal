package io.github.wizwix.letsfutsal.enums;

import org.apache.ibatis.type.BaseTypeHandler;
import org.apache.ibatis.type.JdbcType;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class PreferredPositionTypeHandler extends BaseTypeHandler<PreferredPosition> {
  @Override
  public void setNonNullParameter(PreparedStatement ps, int i, PreferredPosition parameter, JdbcType jdbcType) throws SQLException {
    ps.setString(i, parameter == null ? null : parameter.name());
  }

  @Override
  public PreferredPosition getNullableResult(ResultSet rs, String columnName) throws SQLException {
    String s = rs.getString(columnName);
    return s == null ? null : PreferredPosition.valueOf(s);
  }

  @Override
  public PreferredPosition getNullableResult(ResultSet rs, int columnIndex) throws SQLException {
    String s = rs.getString(columnIndex);
    return s == null ? null : PreferredPosition.valueOf(s);
  }

  @Override
  public PreferredPosition getNullableResult(CallableStatement cs, int columnIndex) throws SQLException {
    String s = cs.getString(columnIndex);
    return s == null ? null : PreferredPosition.valueOf(s);
  }
}
