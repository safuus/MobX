package com.mobx.server.service;

import com.mobx.hibernate.entity.User;

public interface IUserService {
    public User getUserByPhoneIdentifier(String phoneIdentifier);
    public User createUser(String phoneIdentifier, String userName, String location, String photoLocation);
}
