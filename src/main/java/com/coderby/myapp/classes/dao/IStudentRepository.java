package com.coderby.myapp.classes.dao;

import com.coderby.myapp.classes.model.StudentVO;

public interface IStudentRepository {
   StudentVO selectStudent(String stdId);
   String getPassword(String stdId);
}