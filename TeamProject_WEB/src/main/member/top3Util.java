package main.member;

import java.util.ArrayList;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class top3Util {
	public static ArrayList<top3DTO> get(int size) {
		String url = "https://www.youtube.com/channel/UCltb7rCLnkg7b00wo01WgkA/videos";
		Document doc = null;

		try {
			doc = Jsoup.connect(url).get();
		} catch (Exception e) {
			e.printStackTrace();
		}

		Elements elements = doc.select("h3.yt-lockup-title");
		Elements elements2 = doc.select("ul.yt-lockup-meta-info li");
		Elements elements3 = doc.select("img");

		ArrayList<String> title = new ArrayList<String>();
		ArrayList<String> lenth = new ArrayList<String>();
		ArrayList<String> count = new ArrayList<String>();
		ArrayList<String> time = new ArrayList<String>();
		ArrayList<String> src = new ArrayList<String>();
		ArrayList<String> link = new ArrayList<String>();

		int i = 0;
		for (Element e : elements) {
			title.add(e.select("a").text());
			lenth.add(e.select("span").text().replaceAll("- 길이:", "").trim());
			link.add("https://www.youtube.com/embed/" + e.select("a").attr("href")
					.substring(e.select("a").attr("href").lastIndexOf("=") + 1, e.select("a").attr("href").length()));

			if (++i == size) {
				break;
			}
		}

		int j = 0;
		for (Element e : elements2) {
			if (j % 2 == 0) {
				count.add(e.text());
			} else {
				time.add(e.text());
			}

			if (++j == size * 2) {
				break;
			}
		}

		int k = 0;
		for (Element e : elements3) {
			if (e.toString().contains("width=\"196\"")) {
				src.add(e.attr("src"));

				if (++k == size) {
					break;
				}
			}
		}

		ArrayList<top3DTO> list = new ArrayList<top3DTO>();
		for (int index = 0; index < size; index++) {
			list.add(new top3DTO(title.get(index), lenth.get(index), count.get(index), time.get(index), src.get(index),
					link.get(index)));
		}

		return list;
	}
}
