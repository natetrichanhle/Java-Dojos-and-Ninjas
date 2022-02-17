<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <!-- c:out ; c:forEach etc. -->
  <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <!-- Formatting (dates) -->
    <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
      <!-- form:form -->
      <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
        <!-- for rendering errors on PUT routes -->
        <%@ page isErrorPage="true" %>
          <!DOCTYPE html>
          <html>

          <head>
            <meta charset="UTF-8">
            <title>New Ninja</title>
            <!-- for Bootstrap CSS -->
            <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
            <!-- YOUR own local CSS -->
            <link rel="stylesheet" type="text/css" href="/css/style.css">
            <!-- For any Bootstrap that uses JS or jQuery-->
            <script src="/webjars/jquery/jquery.min.js"></script>
            <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
            <!-- YOUR own local JS -->
            <script type="text/javascript" src="/js/app.js"></script>
          </head>

          <body>
            <div class="card mx-auto p-5">
              <form:form action="/ninjas/submit" method="POST" modelAttribute="ninja">
                <div class="mb-3">
                  <form:label path="dojo" for="formInput" class="form-label">Dojos
                  </form:label>
                  <form:select path = "dojo">
                    <c:forEach var = "dojo" items="${dojos}">
                      <form:option value="${dojo.id}" path="dojo">
                        <c:out value = "${dojo.name}"/>
                      </form:option>
                    </c:forEach>
                  </form:select>
                </div>
                <div class="mb-3">
                  <form:label path="firstName" for="formInput" class="form-label">First Name
                  </form:label>
                  <form:input type="text" class="form-control" id="formInput" path="firstName" />
                  <form:errors path="firstName" class="text-danger" />
                </div>
                <div class="mb-3">
                  <form:label path="lastName" for="formInput" class="form-label">Last Name
                  </form:label>
                  <form:input type="text" class="form-control" id="formInput" path="lastName" placeholder="" />
                  <form:errors path="lastName" class="text-danger" />
                </div>
                <div class="mb-3">
                  <form:label path="age" for="formInput" class="form-label">Age
                  </form:label>
                  <form:input type="number" class="form-control" id="formInput" path="age" placeholder="" />
                  <form:errors path="age" class="text-danger" />
                </div>
                <div class="d-flex justify-content-end">
                  <input type="submit" value="Create" class="btn submit-btn">
                </div>
              </form:form>
            </div>
          </body>

          </html>