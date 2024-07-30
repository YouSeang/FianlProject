package kr.soft.study.command;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;

import kr.soft.study.util.Command;

@Component
public class RecentIncidentCommand implements Command {

    @Override
    public void execute(Model model) {
        String keyword = (String) model.getAttribute("keyword");
        String url = "https://search.naver.com/search.naver?where=news&query=" + keyword;
        List<Map<String, String>> newsList = new ArrayList<>();

        try {
            Document doc = Jsoup.connect(url).get();
            Elements elements = doc.select(".news_wrap");

            elements.forEach(element -> {
                String title = element.select(".news_tit").text();
                String link = element.select(".news_tit").attr("href");
                String description = element.select(".dsc_wrap").text();
                String info = element.select(".info").text();
                String imageUrl = element.select(".thumb img").attr("src");

                if (imageUrl == null || imageUrl.isEmpty() || imageUrl.startsWith("data:image")) {
                    // 이미지 URL이 없는 경우 기본 이미지를 사용
                
                    imageUrl = "s";
                }

                Map<String, String> news = new HashMap<>();
                news.put("title", title);
                news.put("link", link);
                news.put("description", description);
                news.put("info", info);
                news.put("imageUrl", imageUrl);
                newsList.add(news);
            });

        } catch (IOException e) {
            e.printStackTrace();
        }

        model.addAttribute("newsList", newsList);
    }
}
