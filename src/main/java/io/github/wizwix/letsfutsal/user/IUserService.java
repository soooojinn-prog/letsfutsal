package io.github.wizwix.letsfutsal.user;

import io.github.wizwix.letsfutsal.dto.UserDTO;

public interface IUserService {
  UserDTO getUserById(Long userId);

  boolean isEmailExists(String email);

  UserDTO login(String email, String password);

  void register(UserDTO user);

  void updateUser(UserDTO user);
}
