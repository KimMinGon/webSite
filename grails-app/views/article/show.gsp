<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'article.label', default: 'Article')}" />
        <asset:javascript src="jquery-2.2.0.min.js" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
        <style>
            #content {

            }
        </style>
    </head>
    <body>
        <a href="#show-article" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="show-article" class="content scaffold-show" role="main">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <iframe width="560" height="315" src="https://www.youtube.com/embed/${this.article.v}" frameborder="0" allowfullscreen></iframe>
            <div style="border: double" Id="comment">
                <button id="comment_button">댓글(${this.article.noteCount})</button>
                <div id="comment_display" style="display: none">
                    <g:form action="comment" resource="${this.article}" method="POST">
                        이름 : <g:textField name="author" />
                        비밀번호 : <g:passwordField name="password" />
                        내용 : <g:textArea name="content" />
                        <g:submitButton name="comment" value="완료"></g:submitButton>
                    </g:form>
                </div>
            </div>
            <g:form resource="${this.article}" method="DELETE">
                <fieldset class="buttons">
                    <g:link class="edit" action="edit" resource="${this.article}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                    <input class="delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                </fieldset>
            </g:form>
        </div>

        <script>
            $('#comment_button').click(function () {
                if($('#comment_display').css("display") == "none") {

                    $.ajax({
                        type : 'POST',
                        url : '${g.createLink(controller: 'article', action: 'showComment')}',
                        data : {
                            'id' : ${this.article.id}
                        },
                        dataType : 'json',

                        success: function(data) {
                            for(var i=0 ; i<data.length ; i ++) {
                                console.log(data[i][0]);
                                console.log(data[i][1]);
                            }
                        }
                    });

                    $('#comment_display').show();
                } else {
                    $('#comment_display').hide();
                }

            });
        </script>
    </body>
</html>
