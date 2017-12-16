package com.yjwh.crm.manage.service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.yjwh.crm.model.Access;
import com.yjwh.crm.po.AccessModoule;

@Service
public class AccessService {

	public List<AccessModoule> getUsersAllAccesses() {
		List<Access> accesses = new ArrayList<>();

		accesses.add(new Access(1l, "", "系统管理", 1, null));
		accesses.add(new Access(11l, "", "用户资料管理", 2, 1l));

		accesses.add(new Access(2l, "", "客户管理", 1, null));
		accesses.add(new Access(21l, "", "客户信息查询", 2, 2l));
		accesses.add(new Access(22l, "", "客户信息录入", 2, 2l));

		accesses.add(new Access(3l, "", "图书管理", 1, null));
		accesses.add(new Access(31l, "", "合作图书管理", 2, 2l));
		accesses.add(new Access(32l, "", "自费图书管理", 2, 2l));

		accesses.add(new Access(4l, "", "订单管理", 1, null));
		accesses.add(new Access(5l, "", "发票管理", 1, null));
		accesses.add(new Access(6l, "", "推荐费管理", 1, null));
		accesses.add(new Access(7l, "", "日志查询", 1, null));

		Map<Long, AccessModoule> accessMap = new HashMap<>();
		for (Access access : accesses) {
			Long key = access.getType().equals(1) ? access.getId() : access.getParrentId();
			AccessModoule modoule = accessMap.get(key) == null ? new AccessModoule() : accessMap.get(key);
			if (access.getType().equals(1)) {
				modoule.setLeftFather(access);
			} else if (access.getType().equals(2)) {
				modoule.getLeftSons().add(access);
			} else if (access.getType().equals(3)) {
				modoule.getRightButtons().add(access);
			} else {
				throw new RuntimeException("未知的权限类型");
			}
			accessMap.put(key, modoule);
		}
		List<AccessModoule> result = new ArrayList<>(accessMap.values());
		Collections.sort(result, new Comparator<AccessModoule>() {
			public int compare(AccessModoule modoule1, AccessModoule modoule2) {
				return (int) (modoule1.getLeftFather().getId() - modoule2.getLeftFather().getId());
			};
		});
		return result;

	}
}