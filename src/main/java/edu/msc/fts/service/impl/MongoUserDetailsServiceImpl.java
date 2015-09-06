/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.msc.fts.service.impl;

import edu.msc.fts.repository.UserRepositoryDao;
import org.apache.log4j.Logger;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Component
public class MongoUserDetailsServiceImpl implements UserDetailsService {

    @Resource
    private UserRepositoryDao userRepositoryDao;

    private static final Logger logger = Logger.getLogger(MongoUserDetailsServiceImpl.class);

    private org.springframework.security.core.userdetails.User userdetails;

    public UserDetails loadUserByUsername(String username)
            throws UsernameNotFoundException {
        boolean enabled = true;
        boolean accountNonExpired = true;
        boolean credentialsNonExpired = true;
        boolean accountNonLocked = true;
        edu.msc.fts.model.User user = getUserDetail(username);
        System.out.println(username);
        System.out.println(user.getPassword());
        System.out.println(user.getUsername());
        System.out.println(user.getRole());

        userdetails = new User(user.getUsername(),
                user.getPassword(),
                enabled,
                accountNonExpired,
                credentialsNonExpired,
                accountNonLocked,
                getAuthorities(user.getRole()));
        return userdetails;
    }

    public List<GrantedAuthority> getAuthorities(Integer role) {
        List<GrantedAuthority> authList = new ArrayList<GrantedAuthority>();
        if (role.intValue() == 1) {
            authList.add(new SimpleGrantedAuthority("ROLE_AUTHORIZED_CUSTOMER"));

        } else if (role.intValue() == 2) {
            authList.add(new SimpleGrantedAuthority("ROLE_BACK_OFFICE_STAFF"));
        }
        System.out.println(authList);
        return authList;
    }

    public edu.msc.fts.model.User getUserDetail(String username) {
        edu.msc.fts.model.User user = userRepositoryDao.findByUsername(username);
        //System.out.println(user.toString());
        return user;
    }


}