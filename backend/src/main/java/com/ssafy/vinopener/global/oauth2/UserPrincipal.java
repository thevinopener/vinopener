package com.ssafy.vinopener.global.oauth2;

import com.ssafy.vinopener.domain.user.data.entity.UserEntity;
import java.util.Collection;
import java.util.Collections;
import java.util.Map;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.oauth2.core.user.OAuth2User;

@Getter
@AllArgsConstructor
public class UserPrincipal implements OAuth2User, UserDetails {

    private Long id;
    private String email;
    //    private Collection<? extends GrantedAuthority> authorities;

    private String authority = "ROLE_USER";

    @Setter
    private Map<String, Object> attributes;

    public UserPrincipal(Long id, String email) {
        this.id = id;
        this.email = email;
    }

    public static UserPrincipal create(UserEntity user, Map<String, Object> attributes) {
//        List<GrantedAuthority> authorities = Collections.singletonList(
//                new SimpleGrantedAuthority(Role.ROLE_USER.name()));
//        UserPrincipal userPrincipal = new UserPrincipal(user.getId(), user.getEmail(), authorities);
        UserPrincipal userPrincipal = new UserPrincipal(user.getId(), user.getEmail());
        userPrincipal.setAttributes(attributes);
        return userPrincipal;
    }

    @Override
    public Map<String, Object> getAttributes() {
        return attributes;
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return Collections.singletonList(new SimpleGrantedAuthority("ROLE_USER"));
    }

    @Override
    public String getPassword() {
        return null;
    }

    @Override
    public String getUsername() {
        return email;
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return true;
    }

    @Override
    public String getName() {
        // 만약 attributes에 sub가 없으면 NullPointerException 발생함.
        return attributes.get("sub").toString();
    }

}
