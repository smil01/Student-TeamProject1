<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<script src="https://code.jquery.com/jquery-3.0.0.js"></script>
<fmt:requestEncoding value="UTF-8"/>
<title>Insert title here</title>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
</head>
<body>
<a id="kakao-link-btn" href="javascript:;">
<img src="//developers.kakao.com/assets/img/about/logos/kakaolink/kakaolink_btn_medium.png"/>
</a>
<script type='text/javascript'>
  //<![CDATA[
    // // 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init('2c31ce0bfdf6ac450e55f852bdb19a2a');
    // // 카카오링크 버튼을 생성합니다. 처음 한번만 호출하면 됩니다.
    Kakao.Link.createDefaultButton({
      container: '#kakao-link-btn',
      objectType: 'feed',
      content: {
        title: '소통광장 스크랩글',
        description: '#스마트미디어인재개발원 #미래창조농업부 #농사 #작물 #소통',
        imageUrl: 'https://postfiles.pstatic.net/MjAxOTA2MjVfMTQ2/MDAxNTYxNDI5NzgwNjY4.ilRtUxHn_jD5iO-S1StQNHTg6WgQ4svALnYie3bLYu8g.K3B67yyAJGGkdssCJxwIMSE-hQsBdDZ2NbIjmWEAPXog.PNG.odd01/m_img.png?type=w773',
        link: {
          mobileWebUrl: 'http://goddaegeun.ml/main.do',
          webUrl: 'http://goddaegeun.ml/main.do'
        }
      },
      social: {
        likeCount: 286,
        commentCount: 45,
        sharedCount: 845
      },
      buttons: [
        {
          title: '웹으로 보기',
          link: {
            mobileWebUrl: 'http://goddaegeun.ml/main.do',
            webUrl: 'http://goddaegeun.ml/main.do'
          }
        },
        {
          title: '앱으로 보기',
          link: {
            mobileWebUrl: 'http://goddaegeun.ml/main.do',
            webUrl: 'http://goddaegeun.ml/main.do'
          }
        }
      ]
    });
  //]]>
</script>

</body>
</html>