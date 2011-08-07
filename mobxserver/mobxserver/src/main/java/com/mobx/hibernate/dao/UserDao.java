package com.mobx.hibernate.dao;

import java.util.List;

import com.mobx.hibernate.entity.User;

public interface UserDao {
	public void saveUser(User user);
	public List<User> getAllUser(User user);
	public User selectUserById(String userId);
	public void deleteUser(User user);
	public User selectUserByPhoneUniqueIdentitier(String phoneIdentifier);
}
