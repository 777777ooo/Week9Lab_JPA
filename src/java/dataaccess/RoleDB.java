/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dataaccess;

import javax.persistence.EntityManager;
import java.util.List;
import javax.persistence.metamodel.SingularAttribute;
import models.Role;
/**
 *
 * @author Dont1
 */

public class RoleDB {    
        public List<Role> getAll() throws Exception {       
        EntityManager em = DBUtil.getEmFactory().createEntityManager();      
        try {
            List<Role> roles = em.createNamedQuery("Role.findAll", Role.class).getResultList();
            return roles;
        } finally {
            em.close();
        }
    }
        
    public Role get(int roleId) throws Exception {        
        EntityManager em = DBUtil.getEmFactory().createEntityManager();       
        try {           
            Role role = em.find(Role.class, roleId);
            return role;            
        } finally {   
            em.close();
        }
    }
}

