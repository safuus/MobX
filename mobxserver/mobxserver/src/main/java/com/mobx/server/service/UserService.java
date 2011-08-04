package com.mobx.server.service;

import com.mobx.server.hibernate.entity.User;

public interface UserService {
    public User getUser(String phoneIdentifier);
    public User createUser(String phoneIdentigier, String userName, String location, String photoLocation);
}
