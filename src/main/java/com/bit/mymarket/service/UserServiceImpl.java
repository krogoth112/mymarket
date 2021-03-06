package com.bit.mymarket.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.mymarket.dao.UserDao;
import com.bit.mymarket.vo.UserVo;


@Service
public class UserServiceImpl {

	@Autowired
	private UserDao userDao;

	public void join(UserVo userVo) {
		userDao.insert(userVo);
	}

	public UserVo login(UserVo userVo) {
		System.out.println("before UserService : " + userVo);
		UserVo vo = userDao.get(userVo);
		System.out.println("after UserService : " + vo);
		return vo;
	}

	public void update(UserVo userVo) {
		userDao.update(userVo);
		
	}
	public String getByEmail(String email){
		return userDao.getByEmail(email);
	}
	

}
