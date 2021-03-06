<!-- jsmb.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>대림대학교 캡스톤 전시관 - 공지사항 수정</title>
    <!--
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" media="screen" href="main.css">
        <script src="main.js"></script>
            -->
    <!-- cdn -->
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
    <!-- css -->
    <link
            href="https://fonts.googleapis.com/css?family=Noto+Serif+KR|Titillium+Web"
            rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR"
          rel="stylesheet">
    <!-- web font -->
    <script
            src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script
            src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
    <!-- bootstrap -->
    <link rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <script
            src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
    <script
            src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script
            src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <!-- material -->
    <link rel="stylesheet"
          href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet"
          href="https://code.getmdl.io/1.3.0/material.indigo-pink.min.css">
    <script defer src="https://code.getmdl.io/1.3.0/material.min.js"></script>
    <!-- script -->
    <!-- local css -->
    <link rel="stylesheet" href="/res/css/inwork.css">
    <!--  page logic -->
</head>

<body>
<jsp:include page="../header-nav.jsp"/>
<!-- Navigation Bar -->
<article>
    <div class="con">
        <div class="notice-write-wrapper">
            <form action="/notice/write.do" accept-charset="utf-8" method="post" name="noticeWrite"
                  enctype="multipart/form-data" id="form">
                <div class="notice-write-wrapper-header">공지사항 작성</div>
                <div class="form-group">
                    <input type="text" class="form-control" id="subject"
                           name="noticeTitle" placeholder="제목" required>
                    <textarea class="form-control" rows="16" id="contents"
                              name="noticeContent" placeholder="내용" required></textarea>
                </div>
                <div class="notice-write-attach-addr">
                    <!--     파일 추가 -->
                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--file">
                        <div class="mdl-button mdl-button--primary mdl-button--icon mdl-button--file">
                            <i class="material-icons">attach_file</i><input type="file" id="inFileName"
                                                                            name="inFileName" multiple>
                        </div>
                        <input multiple class="mdl-textfield__input" placeholder="파일 추가" type="text" id="inFileText"
                               readonly/>
                    </div>
                </div>
                <input type="text" class="form-control" id="referlink"
                       placeholder="참조 주소" name="refer"
                       pattern="^(https?):\/\/([a-z0-9-]+\.)+[a-z0-9]{2,4}.*$"
                       oninput="setCustomValidity('');
                                checkValidity();
                                setCustomValidity(validity.valid ? '' :'올바른 주소를 입력해주세요.');"
                >
                <button type="submit"
                        class="mdl-button mdl-js-button mdl-js-ripple-effect login-btn-text login-btn btn-outlined ">글쓰기
                </button>
                <a href="/notice/list"><input type="button"
                                              class="mdl-button mdl-js-button mdl-js-ripple-effect login-btn-text login-btn btn-outlined "
                                              value="취소"></a>
            </form>
        </div>
    </div>
    <!--  contents box -->
</article>
<jsp:include page="../footer.jsp"/>
<!-- footer -->
</body>
<script>
    $(function () {
        $("#form").validate();
        $.extend($.validator.messages, {
            required: "필수 항목입니다.",
            remote: "항목을 수정하세요.",
            email: "유효하지 않은 E-Mail주소입니다.",
            url: "유효하지 않은 URL입니다.",
            date: "올바른 날짜를 입력하세요.",
            dateISO: "올바른 날짜(ISO)를 입력하세요.",
            number: "유효한 숫자가 아닙니다.",
            digits: "숫자만 입력 가능합니다.",
            creditcard: "신용카드 번호가 바르지 않습니다.",
            equalTo: "같은 값을 다시 입력하세요.",
            extension: "올바른 확장자가 아닙니다.",
            maxlength: $.validator.format("{0}자를 넘을 수 없습니다. "),
            minlength: $.validator.format("{0}자 이상 입력하세요."),
            rangelength: $.validator.format("문자 길이가 {0} 에서 {1} 사이의 값을 입력하세요."),
            range: $.validator.format("{0} 에서 {1} 사이의 값을 입력하세요."),
            max: $.validator.format("{0} 이하의 값을 입력하세요."),
            min: $.validator.format("{0} 이상의 값을 입력하세요.")
        });
    });

    $('#inFileName').change(function () {
        if (this.files.length === 1) {
            $('#inFileText').val(this.files[0].name);
        } else {
            $('#inFileText').val(this.files[0].name + " 외 " + (this.files.length - 1) + "개");
        }
    });
</script>
</html>