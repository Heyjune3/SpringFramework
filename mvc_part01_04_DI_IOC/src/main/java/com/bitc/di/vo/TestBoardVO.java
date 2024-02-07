package com.bitc.di.vo;

import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Service			// 명시된 목적에 맞지 않는 annotation
public class TestBoardVO {
	
	private int num;
	private String title;
	private String content;
	private int writer;
	
}
