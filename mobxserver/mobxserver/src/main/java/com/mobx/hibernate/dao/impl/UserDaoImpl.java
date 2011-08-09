package com.mobx.hibernate.dao.impl;

import java.util.List;

import com.mobx.hibernate.dao.MobxCustomHibernateDao;
import com.mobx.hibernate.dao.IUserDao;
import com.mobx.hibernate.entity.User;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository("userDao")
@Transactional
public class UserDaoImpl extends MobxCustomHibernateDao implements IUserDao {

	@Transactional(readOnly = false)
	public void saveUser(User user) {
		getHibernateTemplate().saveOrUpdate(user);
	}

	@Transactional(readOnly = false)
	public void deleteUser(User user) {
		getHibernateTemplate().delete(user);

	}

	@SuppressWarnings("unchecked")
	public List<User> getAllUser(User user) {
		return (List<User>) getHibernateTemplate().find("from "
				+ User.class.getName());
	}

	public User selectUserById(String userId) {
		return getHibernateTemplate().get(User.class, userId);
	}

	public User selectUserByPhoneUniqueIdentitier(String phoneIdentifier) {
		String queryString = "from User where iphone_udid=?";
		@SuppressWarnings("unchecked")
		List<User> users = (List<User>) getHibernateTemplate().find(queryString, phoneIdentifier);
		
		if (users.size()>0) {
		    return users.get(0);	
		}
		return null;
	}
}
