package com.coderby.myapp.classes.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.coderby.myapp.classes.model.ClassVO;

public interface IClassRepository {
	List<ClassVO> getClassList(@Param("orgName") String orgName, @Param("className") String className);
}
