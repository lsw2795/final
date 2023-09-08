<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>파파고 번역</title>
    <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
</head>
<body>
    <h1>파파고 번역</h1>
    <form id="translationForm">
        <label for="sourceText">번역할 텍스트 (한국어):</label>
        <input type="text" id="sourceText" name="sourceText">
        <button type="button" id="translateButton">번역하기</button>
    </form>
    <div id="translationResult">
        <p><strong>번역 결과 (영어):</strong> <span id="translatedText"></span></p>
    </div>

    <script>
        $(document).ready(function () {
            $("#translateButton").click(function () {
                var sourceText = $("#sourceText").val();
                if (sourceText.trim() === "") {
                    alert("번역할 텍스트를 입력하세요.");
                    return;
                }

                $.ajax({
                    type: "POST",
                    url: "https://openapi.naver.com/v1/papago/n2mt",
                    headers: {
                        "X-Naver-Client-Id": "rlNbwm_88QwSG8CH1QzN",
                        "X-Naver-Client-Secret": "RcpivYf_GM",
                        "Content-Type": "application/json"
                    },
                    data: JSON.stringify({
                        source: "ko",
                        target: "en",
                        text: sourceText
                    }),
                    success: function (response) {
                        var translatedText = response.message.result.translatedText;
                        $("#translatedText").text(translatedText);
                    },
                    error: function (error) {
                        console.log("번역 오류:", error);
                    }
                });
            });
        });
    </script>
</body>
</html>
