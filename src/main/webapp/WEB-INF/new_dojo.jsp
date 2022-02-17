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
            <title>New Dojo</title>
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
            <!-- Enter body here -->
            <h1>New Dojo</h1>
            <div class="card mx-auto p-5">
              <form:form action="/dojos/submit" method="POST" modelAttribute="dojo">
                <div class="mb-3">
                  <form:label path="name" for="formInput" class="form-label">Name</form:label>
                  <form:input type="text" class="form-control" id="formInput" path="name" />
                  <form:errors path="name" class="text-danger" />
                </div>
                <div class="d-flex justify-content-end">
                  <input type="submit" value="Create" class="btn submit-btn">
                </div>
              </form:form>
            </div>
          </body>

          </html>