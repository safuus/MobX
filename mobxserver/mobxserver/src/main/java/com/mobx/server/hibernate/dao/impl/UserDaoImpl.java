package com.mobx.server.hibernate.dao.impl;

import java.util.List;

import com.mobx.server.hibernate.dao.MobxCustomHibernateDao;
import com.mobx.server.hibernate.dao.UserDao;
import com.mobx.server.hibernate.entity.User;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository("userDao")
@Transactional
public class UserDaoImpl extends MobxCustomHibernateDao implements UserDao {

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
		return getHibernateTemplate().get(User.class, phoneIdentifier);
	}
}
