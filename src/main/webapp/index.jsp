<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%@taglib  uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored ="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>

</head>
<body>
<fmt:setBundle basename="test.ResourceBundle" var="langBundle" scope="session" />
<fmt:setLocale value="ar" scope="application" />
<fmt:message  bundle="${langBundle}" />
</body>
</html>