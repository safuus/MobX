package com.mobx.hibernate.dao;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

public abstract class MobxCustomHibernateDao extends HibernateDaoSupport {
	/**
	 * This method is used for setting the session factory
	 * @param sessionFactory
	 */
    @Autowired
    public void setSessionFactoryMethod(SessionFactory sessionFactory)
    {
        setSessionFactory(sessionFactory);
    }
}
