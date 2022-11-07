/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services;

import dataaccess.RoleDB;
import dataaccess.UserDB;
import java.util.List;
import models.Role;
import models.User;
/**
 *
 * @author Dont1
 */

public class UserService {

    public User get(String email) throws Exception {
        UserDB userDB = new UserDB();
        User user = userDB.get(email);
        return user;
    }

    public List<User> getAll() throws Exception {  
        UserDB userDB = new UserDB();
        List<User> users = userDB.getAll();
        return users;
    }

     public String insert(String email, String firstName, String lastName, String password, String roleName, String role) throws Exception {
        
        User user = new User(email, firstName, lastName, password);
        RoleDB roleDB = new RoleDB();
        UserDB userDB = new UserDB();
      
        user.setRole(role);
        userDB.insertUser(user);
        
    
    }

    public void update(String email, String firstName, String lastName, String password, Role role) throws Exception {
        UserDB userDB = new UserDB();
        User user = userDB.get(email);
        user.setFirstName(firstName);
        user.setLastName(lastName);
        user.setPassword(password);
        user.setRole(role);
        userDB.update(user);
    }

    public void delete(String email) throws Exception {
        User user = new User();
        user.setEmail(email);
        userDB.delete(user);
    }
}

