package com.kh.yourfit.mypage.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor	
public class visitor {	
	private Date visitDate;
	private int visitCount;
	
}
