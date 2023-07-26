package com.suamall.project.configuration;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.suamall.project.dto.MemberDTO;
import com.suamall.project.repository.MemberRepository;

import java.util.Collections;


@Service("configService")
public class MemberService implements UserDetailsService {
    @Autowired
    private MemberRepository repo;
 
    public MemberDTO findId(String username) throws Exception {
        return repo.idCheck(username);
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        MemberDTO member = null;
        try {
            member = repo.idCheck(username);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        if(member == null) {
            throw new UsernameNotFoundException(username);
        }
        return User.builder()
                .username(member.getMember_id())
                .password(member.getMember_pw())
                .authorities(Collections.emptyList())
                .build();
    }
}