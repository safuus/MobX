package com.mobx.server.service.impl;

import java.util.Calendar;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mobx.hibernate.dao.IUserDao;
import com.mobx.hibernate.entity.User;
import com.mobx.server.service.IUserService;

@Service("userService")
public class UserServiceImpl implements IUserService {
	@Autowired
	IUserDao userDao;
 
	public void setUserDao(IUserDao userDao) {
		this.userDao = userDao;
	}

 
	public User getUserByPhoneIdentifier(String phoneIdentifier) {
		return userDao.selectUserByPhoneUniqueIdentitier(phoneIdentifier);
	}

	public void deleteUserByPhoneIdentifier(String phoneIdentifier) {
		userDao.deleteUserByPhoneUniqueIdentitier(phoneIdentifier);
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
