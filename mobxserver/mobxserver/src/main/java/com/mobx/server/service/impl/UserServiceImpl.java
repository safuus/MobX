package com.mobx.server.service.impl;

import java.util.Calendar;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mobx.server.hibernate.dao.UserDao;
import com.mobx.server.hibernate.entity.User;
import com.mobx.server.service.UserService;

@Service("userService")
public class UserServiceImpl implements UserService {
	@Autowired
	UserDao userDao;
 
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

 
	public User getUser(String phoneIdentifier) {
		return userDao.selectUserByPhoneUniqueIdentitier(phoneIdentifier);
	}

	public User createUser(String phoneIdentigier, String userName,
			String location, String photoLocation) {
		
		User user = new User();
		user.setIphoneUdid(phoneIdentigier);
		user.setLocation(photoLocation);
		user.setUsername(userName);
		user.setPhotoPath(photoLocation);
		user.setCreatedDate(Calendar.getInstance().getTime());
		userDao.saveUser(user);
		return user;
	}

}
