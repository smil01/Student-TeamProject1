package main.main;

public class cropDTO {
	private int crop_code;
	private int min_temp;
	private int mid_temp;
	private int max_temp;
	private int water;
	private int ph;

	public cropDTO(int crop_code, int min_temp, int mid_temp, int max_temp, int water, int ph) {
		super();
		this.crop_code = crop_code;
		this.min_temp = min_temp;
		this.mid_temp = mid_temp;
		this.max_temp = max_temp;
		this.water = water;
		this.ph = ph;
	}

	public int getCrop_code() {
		return crop_code;
	}

	public void setCrop_code(int crop_code) {
		this.crop_code = crop_code;
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
		this.ph = 6-ph;
	}

	@Override
	public String toString() {
		return "cropDTO [crop_code=" + crop_code + ", min_temp=" + min_temp + ", mid_temp=" + mid_temp + ", max_temp="
				+ max_temp + ", water=" + water + ", ph=" + ph + "]";
	}

}
