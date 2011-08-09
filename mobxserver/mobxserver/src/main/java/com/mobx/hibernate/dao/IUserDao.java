package com.mobx.hibernate.dao;

import java.util.List;

import com.mobx.hibernate.entity.User;

public interface IUserDao {
	public void saveUser(User user);
	public List<User> getAllUser(User user);
	public User selectUserById(String userId);
	public void deleteUserByPhoneUniqueIdentitier(String phoneIdentifier);
	public User selectUserByPhoneUniqueIdentitier(String phoneIdentifier);
}
