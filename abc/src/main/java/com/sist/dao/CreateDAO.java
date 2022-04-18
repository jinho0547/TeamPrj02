package com.sist.dao;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.CreateMapper;
import com.sist.vo.*;
@Repository
public class CreateDAO {
	@Autowired
	private CreateMapper mapper;
	
	public void puzzle_create(CreateVO vo)
	{
		 mapper.puzzle_create(vo);
	}
}
