package com.mobx.server.hibernate.dao;

import java.util.List;

import com.mobx.server.hibernate.entity.User;

public interface UserDao {
	public void saveUser(User user);
	public List<User> getAllUser(User user);
	public User selectUserById(String userId);
	public void deleteUser(User user);
	public User selectUserByPhoneUniqueIdentitier(String phoneIdentifier);
}
