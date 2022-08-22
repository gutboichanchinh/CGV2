package my.com.utlis;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;

import my.com.security.UserService1;

import java.util.ArrayList;
import java.util.List;

public class SecurityUtils {

    public static UserService1 getPrincipal() {
        return ( UserService1 ) (SecurityContextHolder.getContext()).getAuthentication().getPrincipal();
    }
}
