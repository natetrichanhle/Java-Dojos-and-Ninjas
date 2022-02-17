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
            <title>Insert Title Here</title>
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
            <div class="container mx-auto p-5">
              <table class="table table-striped mb-5">
                <thead>
                  <tr>
                    <th scope="col">First Name</th>
                    <th scope="col">Last Name</th>
                    <th scope="col">Age</th>
                  </tr>
                </thead>
                <tbody>
                  <c:forEach var="ninja" items="${dojo.ninjas}">
                    <tr>
                      <td>
                          <c:out value="${ninja.firstName}" />
                      </td>
                      <td>
                        <c:out value="${ninja.lastName}" />
                      </td>
                      <td>
                        <c:out value="${ninja.age}" />
                      </td>
                    </tr>
                  </c:forEach>
                </tbody>
              </table>
            </div>
          </body>

          </html>