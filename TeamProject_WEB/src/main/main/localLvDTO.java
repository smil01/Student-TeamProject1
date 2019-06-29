package main.main;

public class localLvDTO {
	private int crop_code;
	private int local_code;
	private int min_temp;
	private int max_temp;
	private int avg_temp;
	private int ph;

	public localLvDTO(int crop_code, int local_code, int min_temp, int max_temp, int avg_temp, int ph) {
		super();
		this.crop_code = crop_code;
		this.local_code = local_code;
		this.min_temp = min_temp;
		this.max_temp = max_temp;
		this.avg_temp = avg_temp;
		this.ph = ph;
	}

	public int getCrop_code() {
		return crop_code;
	}

	public void setCrop_code(int crop_code) {
		this.crop_code = crop_code;
	}

	public int getLocal_code() {
		return local_code;
	}

	public void setLocal_code(int local_code) {
		this.local_code = local_code;
	}

	public int getMin_temp() {
		return min_temp;
	}

	public void setMin_temp(int min_temp) {
		this.min_temp = min_temp;
	}

	public int getMax_temp() {
		return max_temp;
	}

	public void setMax_temp(int max_temp) {
		this.max_temp = max_temp;
	}

	public int getAvg_temp() {
		return avg_temp;
	}

	public void setAvg_temp(int avg_temp) {
		this.avg_temp = avg_temp;
	}

	public int getPh() {
		return ph;
	}

	public void setPh(int ph) {
		this.ph = ph;
	}

	@Override
	public String toString() {
		return "localLvDTO [crop_code=" + crop_code + ", local_code=" + local_code + ", min_temp=" + min_temp
				+ ", max_temp=" + max_temp + ", avg_temp=" + avg_temp + ", ph=" + ph + "]";
	}

}
