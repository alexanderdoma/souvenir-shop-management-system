package com.alexanderdoma.peruinolvidable.model;

import com.alexanderdoma.peruinolvidable.model.entity.User;
import java.sql.ResultSet;

public interface IUser extends IGeneric<User, Integer>{
    User login(String username, String password) throws DAOException;
}
