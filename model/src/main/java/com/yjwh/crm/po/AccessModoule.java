package com.yjwh.crm.po;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;

import com.yjwh.crm.model.Access;

public class AccessModoule {
	Access leftFather;
	List<Access> leftSons = new ArrayList<>();
	List<Access> rightButtons = new ArrayList<>();

	public List<Access> getLeftSons() {
		return leftSons;
	}

	public void setLeftSons(List<Access> leftSons) {
		this.leftSons = leftSons;
	}

	public List<Access> getRightButtons() {
		return rightButtons;
	}

	public void setRightButtons(List<Access> rightButtons) {
		this.rightButtons = rightButtons;
	}

	public Access getLeftFather() {
		return leftFather;
	}

	public void setLeftFather(Access leftFather) {
		this.leftFather = leftFather;
	}

}
