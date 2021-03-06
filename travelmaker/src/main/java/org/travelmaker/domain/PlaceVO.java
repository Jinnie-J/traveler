package org.travelmaker.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PlaceVO {
	private long plcNo;
	private int regionNo;
	private String plcTitle;
	private double lat;
	private double lng;
	private String addressDt;
	private String pCate;
	private String holiday;
	private String openingH;
	private int likeCnt;
	private String plcImg;
	
}
