<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: shrishti
  Date: 30/3/18
  Time: 11:53 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script type="application/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
    <title>UserLogin</title>
</head>
<body>
<%--${user.userName}--%>
<%--${user.userId}--%>
<div class="container">
    <div class="row">
        <div class="col-md-12" >
            <h3><label style="color: #59B2E0">Contact Book</label>
                <a href="/logout" style="float: right" type="button" class="btn btn-default">Log Out</a>
                <label style="float: right;color: #59B2E0"  >${user.userName}</label></h3>
        </div>
    </div>

    <div class="panel" style="margin-top: 3%">
        <div style="background-color: #00415d" class="panel-heading">

                <label style="color: #59B2E6">Contacts</label>
            <button style="float: right" type="button" class="btn btn-default" data-toggle="modal" data-target="#myModal2">+AddContacts</button>

            <div class="modal fade" id="myModal2" role="dialog">
                <div class="modal-dialog">

                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Add the Contacts!</h4>
                        </div>
                        <div class="modal-body">
                            <p>Enter the Contact Details</p>
                            <form method="post" action="/">
                                <input type="text" name="contactName" id="contactName" tabindex="1" class="form-control" placeholder="contactName" value="" required>
                                <input type="text" name="contactEmail" id="contactEmail" tabindex="2" class="form-control" placeholder="contactEmail" value="" required>
                                <input type="text" name="phoneNumber" id="phoneNumber" tabindex="3" class="form-control" placeholder="phoneNumber" value="" required>
                                <input type="text" name="companyName" id="companyName" tabindex="4" class="form-control" placeholder="companyName" value="" required>
                                <%--<input type="text" name="categoryName" id="categoryName1" tabindex="5" class="form-control" placeholder="category" value="">--%>

                                <select id="categoryList" multiple>
                                    <c:forEach var="catList" items="${category}">
                                        <option  value="${catList.categoryId}">${catList.categoryName}</option>
                                    </c:forEach>

                                </select>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" id="addContact">+Add Contacts</button>
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>

                </div>
            </div>
            <button style="float: right" type="button" class="btn btn-default" data-toggle="modal" data-target="#myModal">+AddCategory</button>
            <%--<button style="float: right" type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">+AddCategory</button>--%>

            <!-- Modal -->
            <div class="modal fade" id="myModal" role="dialog">
                <div class="modal-dialog">

                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Add the Category</h4>
                        </div>
                        <div class="modal-body">
                            <p>Enter the Category</p>
                            <form method="post" action="/">
                                    <input type="text" name="categoryName" id="categoryName" tabindex="1" class="form-control" placeholder="Category" value="" required>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" id="addCategory">+Add Category</button>
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>

                </div>
            </div>


            <input style="float: right" type="text" placeholder="Search" name="search">
        </div>
    </div>

    <%--display the data of contacts on the page, "Table Structure"--%>
    <div class="col-md-12" >
    <table border="2" width="100%">
        <th>Name</th><th>Email</th><th>PhoneNumber</th><th>Company</th><th>Category</th><th>Actions</th>

             <c:forEach var="user" items="${contactList}">
                  <tr>
                      <td>${user.contactName}</td>
                      <td>${user.contactEmail}</td>
                      <td>${user.phoneNumber}</td>
                      <td>${user.companyName}</td>
                      <td>${user.category[0].categoryName}</td>
                      <%--<td><span class="glyphicon glyphicon-pencil" onclick="updatecontact(${user.contactId})"></span>span--%>
                      <td>
                          <span class="glyphicon glyphicon-pencil" data-toggle="modal" data-target="#myModal3"></span>
                          <span class="glyphicon glyphicon-trash"  onclick="deletecontact(${user.contactId}) "></span>
                      </td>
                   </tr>
             </c:forEach>
    </table>
    </div>
<%--<ul class="pagination pagination-lg">--%>
    <%--<c:forEach var="n" begin="1" end="${numberOfPages}">--%>
        <%--<li><a href="#" onclick="contactList(${n})">${n}</a></li>--%>
    <%--</c:forEach>--%>
<%--</ul>--%>
</div>

<div class="modal fade" id="myModal3" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Update the Contact Details!</h4>
            </div>
            <div class="modal-body">
                <p>You may change the saved contact Details!</p>
                <form>
                    <input type="text" name="contactName" id="contactNameUpdate" tabindex="1" class="form-control" placeholder="contactName" value="" required>
                    <input type="text" name="contactEmail" id="contactEmailUpdate" tabindex="2" class="form-control" placeholder="contactEmail" value="" required>
                    <input type="text" name="phoneNumber" id="phoneNumberUpdate" tabindex="3" class="form-control" placeholder="phoneNumber" value="" required>
                    <input type="text" name="companyName" id="companyNameUpdate" tabindex="4" class="form-control" placeholder="companyName" value="" required>
                </form>


            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" style="background-color: cadetblue;text-decoration-color: white">Update Contact</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div>

    </div>
</div>


<%--ajax and jquery for the add category--%>

<script>
    jQuery(document).ready(function () {
        jQuery("#addCategory").click(function () {
            alert("running");
            var categoryName = jQuery.trim(jQuery("#categoryName").val());
            jQuery.ajax({
                url:"/addCategory",
                type:"POST",
                data:{categoryName:categoryName},
                success: function (data) {
                    alert("Category is added!!");
                },
                error: function () {
                    alert("some error");
                }
            });
        });
    });

        jQuery("#addContact").click(function () {
            var contactName = jQuery.trim(jQuery("#contactName").val());
            var contactEmail = jQuery.trim(jQuery("#contactEmail").val());
            var phoneNumber = jQuery.trim(jQuery("#phoneNumber").val());
            var companyName = jQuery.trim(jQuery("#companyName").val());
            var category = jQuery.trim(jQuery("#categoryList").val());
            jQuery.ajax({
                url:"/addContact?categoryid="+category,
                type:"POST",
                data:{contactName:contactName,contactEmail:contactEmail,phoneNumber:phoneNumber,companyName:companyName},
                success: function (data) {
                    alert("Contact is added!!")

                },
                error: function( xhr ) {
                    var readyState = {
                        1: "Loading",
                        2: "Loaded",
                        3: "Interactive",
                        4: "Complete"
                    };
                    if (xhr.readyState !== 0 && xhr.status !== 0 && xhr.responseText !== undefined) {
                        alert("readyState: " + readyState[xhr.readyState] + "\n status: " + xhr.status + "\n\n responseText: " + xhr.responseText);
                    }
                }
            });

    });
</script>
<script>
    function contactList(pageNumber) {
        jQuery("#contactList").html('');
        jQuery.ajax({
            url:"/getContactList?pageNumber="+pageNumber,
            type:"GET",
            success:function (data) {
                jQuery.each(data,function (key,val) {
$("#contactList").append("<tr><td>"+data[key].contactName+"</td><td>"+data[key].contactEmail+"<td></td>"+data[key].phoneNumber+"<td></td>"+data[key].companyName+"<td></td>"+data[key].category[0].categoryName+"<td></td>");
                });

            }
        });

    }
</script>
<script>
    function deletecontact(id) {
        jQuery.ajax({
            url: "/deleteContact",
            type: "POST",
            data: {contactId: id},
            success: function (data) {
                alert(data);
            }
        });
    }
</script>

<script>
    function updatecontact(id) {
        var contactName=jQuery.trim(jQuery("#contactName").val());
        var contactEmail=jQuery.trim(jQuery("#contactEmail").val());
        var phoneNumber=jQuery.trim(jQuery("#phoneNumber").val());
        var companyName=jQuery.trim(jQuery("#companyName").val());


        jQuery.ajax({
            url:"/updatecontact",
            type:"UPDATE",
            data:{contactId:id,contactName:contactName,phoneNumber:phoneNumber,companyName:companyName},
            success:function (data) {
                alert(data);
            }
        });

    }
</script>
</body>
</html>
