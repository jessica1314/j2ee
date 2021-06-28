<%--
  Created by IntelliJ IDEA.
  User: JESSICA
  Date: 2021/6/26
  Time: 下午 8:05
  To change this template use File | Settings | File Templates.
--%>
<%--pageencoding 指定页面出现文字编码格式--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.TreeMap" %>
<html>
<head>
    <title>hello.jsp</title>
</head>
<body>
<%--直接解析可以理解而为和html一样，只不过带了java代码？--%>
<%-- <%=>:相当于response.getwriter()输出字符--%>
<%--jsp 被tomcat转义为java文件，然后编译成class文件 ，再执行生成html文件  响应给浏览器--%>
hello jsp!<br>
<%=new Date().toLocaleString()%>
<%--   表达式输出 --%>
<br>
<% final int a = 2021;%>
<%=a%> <br>
<%out.println(a);%> <%--out  隐式对象  9种--%> <%--需要分号和java一样--%>
<br>
<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss SSS").format(new Date())%>

<% List<String> l = new ArrayList<>();
    l.add("1");
    l.add("2");
    l.add("3");
    l.add("4");%>

<table width="200px" align="center" border="1px" cellspacing="0"> <%--align="center" 指的是该元素居中处理--%>
    <% for (String s : l) {%>  <%--  <%   这里面是java代码%>--%>
    <tr>
        <td style="text-align: center">
            <%=s%>
        </td>
    </tr>
    <%}%>
</table>
<%--指令导入其他jsp--%>
<%@ include file="footer.jsp" %>
<%--动作导入jsp ,独立生成一个footer_jsp.java--%>
<%--<jsp:include page="footer.jsp">--%>
<%--    <jsp:param name="year" value="2022"/>--%>
<%--</jsp:include>--%>
</body>
</html>