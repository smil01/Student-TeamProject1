package main.main;

public class localDTO {
	private int local_code;
	private int time;
	private int min_temp;
	private int mid_temp;
	private int max_temp;
	private int water;
	private int ph;
	private String c_time;

	public localDTO(int local_code, int time, int min_temp, int mid_temp, int max_temp, int water, int ph) {
		super();
		this.local_code = local_code;
		this.time = time;
		this.min_temp = min_temp;
		this.mid_temp = mid_temp;
		this.max_temp = max_temp;
		this.water = water;
		this.ph = ph;
		
		switch (time) {
		case 1:
			c_time = "17/01/01";
			break;
		case 2:
			c_time = "17/02/01";
			break;
		case 3:
			c_time = "17/03/01";
			break;
		case 4:
			c_time = "17/04/01";
			break;
		case 5:
			c_time = "17/05/01";
			break;
		case 6:
			c_time = "17/06/01";
			break;
		case 7:
			c_time = "17/07/01";
			break;
		case 8:
			c_time = "17/08/01";
			break;
		case 9:
			c_time = "17/09/01";
			break;
		case 10:
			c_time = "17/10/01";
			break;
		case 11:
			c_time = "17/11/01";
			break;
		case 12:
			c_time = "17/12/01";
			break;
		case 13:
			c_time = "18/01/01";
			break;
		case 14:
			c_time = "18/02/01";
			break;
		case 15:
			c_time = "18/03/01";
			break;
		case 16:
			c_time = "18/04/01";
			break;
		case 17:
			c_time = "18/05/01";
			break;
		case 18:
			c_time = "18/06/01";
			break;
		case 19:
			c_time = "18/07/01";
			break;
		case 20:
			c_time = "18/08/01";
			break;
		case 21:
			c_time = "18/09/01";
			break;
		case 22:
			c_time = "18/10/01";
			break;
		case 23:
			c_time = "18/11/01";
			break;
		case 24:
			c_time = "18/12/01";
			break;
		case 25:
			c_time = "19/01/01";
			break;
		case 26:
			c_time = "19/02/01";
			break;
		case 27:
			c_time = "19/03/01";
			break;
		case 28:
			c_time = "19/04/01";
			break;
		case 29:
			c_time = "19/05/01";
			break;
		}

		setC_time(c_time);
	}

	public int getLocal_code() {
		return local_code;
	}

	public void setLocal_code(int local_code) {
		this.local_code = local_code;
	}

	public int getTime() {
		return time;
	}

	public void setTime(int time) {
		this.time = time;	
	}

	public int getMin_temp() {
		return min_temp;
	}

	public void setMin_temp(int min_temp) {
		this.min_temp = min_temp;
	}

	public int getMid_temp() {
		return mid_temp;
	}

	public void setMid_temp(int mid_temp) {
		this.mid_temp = mid_temp;
	}

	public int getMax_temp() {
		return max_temp;
	}

	public void setMax_temp(int max_temp) {
		this.max_temp = max_temp;
	}

	public int getWater() {
		return water;
	}

	public void setWater(int water) {
		this.water = water;
	}

	public int getPh() {
		return ph;
	}

	public void setPh(int ph) {
		this.ph = ph;
	}

	public void setC_time(String c_time) {
		this.c_time = c_time;
	}

	public String getC_time() {
		return c_time;
	}

	@Override
	public String toString() {
		return "localDTO [local_code=" + local_code + ", time=" + time + ", min_temp=" + min_temp + ", mid_temp="
				+ mid_temp + ", max_temp=" + max_temp + ", water=" + water + ", ph=" + ph + "]";
	}

}
