<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Managing User Application</title>
    </head>
    <body>
        
        <h1>Manage Users</h1>
        
        <c:if test="${users.size() lt 1}">
            <b>No users found. Please add a user.</b>
        </c:if>

        <c:if test="${message ne 'empty'}">
            <table border="1">
                <tr>
                    <th>Email</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Role</th>
                </tr>
                <c:forEach var="user" items="${users}"> 
                    <tr>
                        <td>${user.email}</td>
                        <td>${user.firstName}</td>
                        <td>${user.lastName}</td>
                        <td>${user.role.roleName}</td>
                        <td><a href="User?action=Edit&amp;email=${user.email}">Edit</a></td>
                        <td> <form action="User" method="POST">
                                <input type="submit" value="Delete">
                                <input type="hidden" name="action" value="Delete">
                                
                                <c:if test="${selectedUser ne null}">
                                    <input type="hidden" name="email" value="${selectedUser.email}">
                                </c:if>

                            </form></td>
                    </tr>
                </c:forEach>
            </table>
        </c:if>

            
            
        <c:if test="${selectedUser eq null}">
            <form action="User" method="POST">
                
                <h2>Add User</h2>   
                Email: <input type="text" name="email" required><br>
                First name: <input type="text" name="firstname" required><br>            
                Last Name: <input type="text" name="lastname" required><br>
                Password: <input type="password" name="password" required><br>
                Role: <select name="role">
                    <option value="1">system admin</option>
                    <option value="2">regular user</option>
                </select>
                <br>
                <input type="submit" value="Add">
                <input type="hidden" name="action" value="Add">
            </form>
        </c:if>

            
            
            
            
        <c:if test="${selectedUser ne null}">
            
            
            <h2>Edit User</h2>
            <form action="users" method="post">
                
                Email: <p>${selectedUser.email}</p>
                First name: <input type="text" name="firstname" required value="${selectedUser.firstName}"><br>            
                Last Name: <input type="text" name="lastname" required value="${selectedUser.lastName}" ><br>
                Password: <input type="password" name="password" required><br>
                Role: <select name="role"><br>
                    <option value="system admin">System Admin</option>
                    <option value="regular user">Regular User</option>
                </select> <br>
                
                <input type="submit" value="Update">
                <input type="hidden" name="action" value="update">
                input type="hidden" name="action" value="Update">
                <input type="hidden" name="email" value="${selectedUser.email}">
                </form>
                
                <form action="User">
                    
                <input type="submit" value="Cancel">
            
               
             
                </form>
                    
               
        </c:if>
            <p>
                ${mes}
            </p>
            
    </body>
</html>
