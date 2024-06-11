package com.asmkbw.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.asmkbw.entity.Role;

public interface RoleDAO extends JpaRepository<Role, Integer> {
	Role findByRoleName(String roleName);
}
