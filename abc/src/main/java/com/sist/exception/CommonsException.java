package com.sist.exception;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.jsp.jstl.sql.SQLExecutionTag;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
/*
	자바 => 결론을 먼저 말할 것 => 그다음이 부연 설명
	1. instance VS static 변수의 차이
	2. 캡슐화 VS 은닉화
	3. 객체지향 프로그램의 객체가 무엇인가
	4. 오버로딩 VS 오버라이딩
	5. 추상클래스와 인터페이스의 차이점
	6. 오버라이딩 방법 (상속 ,익명의 클래스)
	7. 상속 (is-a) VS 포함 (has-a)
	8. => 객체지향프로그램 (OOP)
	9. 예외처리목적, 예외처리방법
	10. 컬렉션 클래스 (List,Set,Map)
	11. 제네릭스 타입 <>
	12. IO
	13. Thread => 쓰레드의 동기화/비동기화 방법
	
       기타
    1. 패턴 : 디자인 패턴 => 싱글턴 ,팩토리패턴 , MVC패턴 => Vue(MVVM)
    
        오라클 : JOIN/SubQuery, 페이징 처리
        	index , view , 데이터형
    
     JSP : GET/POST
     	   Session VS cookie
     	   JSTL / EL
     	   MVC 구조
     
          스프링 : DI , Container, 스프링이란?
             AOP , ORM(MyBatis설명)
      
           스프링 VS 스프링 부트
      ----------------- MyBatis VS JPA
      
      1. 협업 (형상관리) => Git 
      2. 프로젝트 어려웠던 점, 프로젝트를 만들면서 자신있었던 부분(***************)
      3. 동문서답하지말고 모르는 것은 모른다고 말할 것
     	   
*/
@ControllerAdvice("com.sist.web") //공통으로 예외처리 적용
// Controller에서 에러(예외) 발생 => 모아서 한번에 처리 => 비정상종료가 없이 정상수행이 가능하게
// 사전에 에러 방지 프로그램을 작성
// 예외처리의 목적, 처리방법(예외복구:try~catch, 예외회피(thorws))
// 클래스는 기능별로 나눠서 처리(한개의 기능 => 컴포넌트(부품))
// 컴포넌트를 관리 => 컨테이너(이것을 스프링이라함)
/*
	부품 => 부품여러개를 묶어서(조립) 기능이 수행 =>@Controller
	
	부품
	=> DAO(Mapper,VO)
	=> Controller
	-------------------
	요청 => @GetMapping , @PostMapping , @RequestMapping
	DAO 데이터 처리 dao.recipeData()
	결과값 전송 model.addAttribute()
	-------------------
			DispatcherServlet => Model 찾기(HandlerMapping) => ViewResolver(JSP찾기)
					=>Spring 형식 맞게 제어
							@RequestMapping						return
	JSP(요청) 	====>	Model (@Controller)  ==================> JSP
	-------				-------------------
	<a>						처리(화면 변경), 출력에 필요한 데이터 전송
	<form>						|
	locatio.href			1) DAO , 2)외부 (날씨)
	ajax					3) 알라딘 , YES24 , 교보 => API
	axios						공공데이터 , 서울데이터
								트위터 , 인스타그램...., 실시간 뉴스
								Naver 카페 , 블로그
*/
	public class CommonsException {
	@ExceptionHandler(RuntimeException.class)
	public void runtimeHandler(RuntimeException ex)
	{
		System.out.println("===== RuntimeException 에러 발생 =====");
		System.out.println(ex.getMessage());
	}
	@ExceptionHandler(SQLException.class)
	public void sqlHandler(SQLException ex)
	{
		System.out.println("===== SQLException 에러 발생 =====");
		System.out.println(ex.getMessage());
	}
	@ExceptionHandler(IOException.class)
	public void ioHandler(IOException ex)
	{
		System.out.println("===== IOException 에러 발생 =====");
		System.out.println(ex.getMessage());
	}
	@ExceptionHandler(ClassNotFoundException.class)
	public void classNotFoundHandler(ClassNotFoundException ex)
	{
		System.out.println("===== ClassNotFoundException 에러 발생 =====");
		System.out.println(ex.getMessage());
	}
	@ExceptionHandler(Exception.class)
	public void exceptionHandler(Exception ex)
	{
		System.out.println("===== Exception 에러 발생 =====");
		System.out.println(ex.getMessage());
	}
	/* 1. DispatcherServlet => 등록(web.xml)
	 * 		=> HandlerMapping , HandlerAdapter
	 * 2. ViewResolver => application-content.xml
	 * -------------------------------------------
	 * 3. @Controller , @RestController
	 * 4. MyBatis => CRUD , 동적쿼리
	 * 5. JSP출력
	 * -------------------------------------------
	 * 기타 : Tiles
	 * ------------------------------------------- Basic
	 * 
	 * Front : JavaScript => function
	 * 			Jquery(Ajax) , VueJS , ReactJS
	 * ------------------------------------------- 파이썬 / AI
	 * 										데이터 분석 / 통계 / 장고
	 * 										자기 개발
	 */
	
}