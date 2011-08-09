package com.mobx.hibernate.dao.impl;

import java.sql.SQLException;
import java.util.List;

import com.mobx.hibernate.dao.MobxCustomHibernateDao;
import com.mobx.hibernate.dao.IUserDao;
import com.mobx.hibernate.entity.User;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
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
	public void deleteUserByPhoneUniqueIdentitier(final String phoneIdentifier) {
		getHibernateTemplate().execute(new HibernateCallback<Integer>() {
			public Integer doInHibernate(Session session) {

				int affectedRecords = session.createQuery(
									"delete from User where iphone_udid = ?")
									.setParameter(0, phoneIdentifier)
									.executeUpdate();
				return affectedRecords;
			}
		});
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
