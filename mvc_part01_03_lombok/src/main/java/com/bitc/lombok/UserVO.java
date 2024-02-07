package com.bitc.lombok;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Builder;
import lombok.Getter;
import lombok.NonNull;
import lombok.Setter;
import lombok.Singular;
import lombok.ToString;

/*
 * 자동으로 생성자, getter,setter...etc 만들기
 *  https://projectlombok.org/setup/maven 에서 Adding lombok to your pom file을
 *  pom.xml에 추가
 *  이후 https://projectlombok.org/download에서 다운로드 후
 *  다운받은 lombok.jar을 압축해제한 Spring 폴더에 추가
 *  lombok.jar실행해서 Spring 실행기 install 후 종료 후 Spring 재실행
 */

//@Data
// @Getter
// @Setter
// 객체 생성 시에 필요한 필수 값이 존재 하기 때문에 기본생성자로 객체 생성 불가
// @NoArgsConstructor				 // 기본 생성자 추가
// @AllArgsConstructor					 // 모든 값을 매개변수로 받는 생성자 추가
//@ToString(callSuper = true)		 // 부모 toString도 호출
//@ToString(exclude = "upw")		 // toString에 해당 필드 제외
//@ToString(exclude = {"uid","upw"}) // 여러 필드 제외
// @ToString(of = {"uid","upw"})		 // 지정한 필드만 포함
// 지정한 필드 정보가 일치하면 논리적으로 동등한 객체
// @EqualsAndHashCode(of = {"uid","upw"})
// 필수 인자값을 통해서 생성자 생성
// @RequiredArgsConstructor
@Builder
@ToString
public class UserVO {
	
	@Getter
	private int uno;
	@Setter @NonNull
	private String uid;
	@NonNull
	private String upw;
	// final : 필드정의할 때나 객체생성 시에 정의해야됨
	private final String uname;
	
	// 2024-10-10 10:23:34
	@DateTimeFormat(pattern="yyyy-MM-dd hh:mm:ss")
	private Date regdate;
	
	// 독립적으로 Builder에 ""이름으로 값을 추가
	@Singular("list")
	private List<String> friendList;
}

















