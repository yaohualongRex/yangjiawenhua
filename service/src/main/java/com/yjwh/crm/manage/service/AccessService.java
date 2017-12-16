package com.yjwh.crm.manage.service;

import java.util.*;

import com.alibaba.fastjson.JSON;
import com.yjwh.crm.mapper.PrivilegeMapper;
import com.yjwh.crm.mapper.RoleMapper;
import com.yjwh.crm.mapper.RolePrivilegeMapper;
import com.yjwh.crm.mapper.UserRoleMapper;
import com.yjwh.crm.model.*;
import com.yjwh.crm.po.UserModule;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yjwh.crm.po.AccessModoule;
import tk.mybatis.mapper.entity.Example;

@Service
public class AccessService {

	@Autowired
	private UserRoleMapper userRoleMapper;
	@Autowired
	private RolePrivilegeMapper rolePrivilegeMapper;
	@Autowired
	private PrivilegeMapper privilegeMapper;
	@Autowired
	private RoleMapper roleMapper;

	public List<AccessModoule> getUsersAllAccesses(User user) {
		// 获取用户所有的角色id
		ArrayList<Long> roleIds = new ArrayList<>();
		UserRole userRole = new UserRole(user.getId());
		List<UserRole> userRoles = userRoleMapper.select(userRole);
		userRoles.forEach(n -> roleIds.add(n.getRoleId()));
		// 根据角色id获取所有的权限id
		ArrayList<Long> privalegeIds = new ArrayList<>();
		Example example = new Example(RolePrivilege.class);
		example.createCriteria().andIn("roleId",roleIds);
		List<RolePrivilege> rolePrivileges = rolePrivilegeMapper.selectByExample(example);
		rolePrivileges.forEach(n -> privalegeIds.add(n.getPrivilegeId()));
		// 获取所有权限
		example= new Example(Privilege.class);
		example.createCriteria().andIn("id",privalegeIds);
		List<Privilege> privaleges = privilegeMapper.selectByExample(example);
		// 数据结构优化
		Map<Long, AccessModoule> accessMap = new HashMap<>();
		this.getType(privaleges, 1).forEach(father -> accessMap.put(father.getId(),new AccessModoule(father)));
		this.getType(privaleges, 2).forEach(son -> accessMap.get(son.getPid()).getSons().add(son));
		// 根据父id排序
		List<AccessModoule> result = new ArrayList<>(accessMap.values());
		Collections.sort(result, new Comparator<AccessModoule>() {
			public int compare(AccessModoule modoule1, AccessModoule modoule2) {
				return (int) (modoule1.getFather().getId() - modoule2.getFather().getId());
			};
		});
		return result;
	}
	public List<Privilege> selectButtonsByPid(Long pid){
		Example example = new Example(Privilege.class);
		example.createCriteria().andEqualTo("pid",pid).andEqualTo("type",3);
		return privilegeMapper.selectByExample(example);
	}

	/**
	 * 获取不同type的权限
	 * @param privileges
	 * @param i
	 * @return
	 */
	private List<Privilege> getType(List<Privilege> privileges, Integer i){
		List<Privilege> temp = new ArrayList<>();
		for (Privilege privilege : privileges) {
			if (privilege.getType().equals(i))
				temp.add(privilege);
		}
		return temp;
	}

	public UserModule getUserModule(User user) {
		UserModule userModule = JSON.parseObject(JSON.toJSONString(user), UserModule.class);
		// 获取用户所有的角色id
		ArrayList<Long> roleIds = new ArrayList<>();
		UserRole userRole = new UserRole(user.getId());
		List<UserRole> userRoles = userRoleMapper.select(userRole);
		userRoles.forEach(n -> roleIds.add(n.getRoleId()));
		// 获取所有权限
		Example example= new Example(Role.class);
		example.createCriteria().andIn("id",roleIds);
		List<Role> roles = roleMapper.selectByExample(example);

		StringBuilder sb = new StringBuilder();
		roles.forEach(role -> sb.append(","+role.getRoleName()));
		userModule.setRoleName(sb.substring(1));
		return userModule;
	}
}