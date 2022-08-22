package my.com.security;

import java.util.HashSet;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import my.com.dao.UserDao;
import my.com.entity.People;

@Service
public class UserImp implements UserService1 {
	
	@Autowired
	UserDao userDao;

	@Override
	@Transactional
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		People p = userDao.findByUsername(username);
		System.out.println(p.toString());
		if (p == null) {
			throw new UsernameNotFoundException("Not found");
		}else {
			System.out.println(p.getUserName());
		}
		Set<GrantedAuthority> authorities = new HashSet<>();
		authorities.add(new SimpleGrantedAuthority(p.getIDRole()));
		System.out.println(authorities);
		
		return new User(p.getUserName(),p.getPassword(),authorities);
	}



}
