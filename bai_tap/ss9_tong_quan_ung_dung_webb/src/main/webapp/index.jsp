<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2/9/2023
  Time: 11:41 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <title>Product Discount Calculator</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="bootstrap.css/bootstrap.js">
    <style>
        .h1 {
            text-align: center;
            font-size: 50px;
        }

        .form-group {
            text-align: center;
            margin: 20px;
        }

        .submit {
            text-align: center;
            font-size: 20px;
            margin: 10px;
        }
    </style>
</head>
<body>
<h1 class="h1">Product Discount Calculator</h1>
<form action="/product" method="get">
    <div class="form-group">
        <label for="product-description">Product Description</label>
        <input type="text" class="form-control" name="product-description" id="product-description">
    </div>
    <div class="form-group">
        <label for="list-price">List Price</label>
        <input type="text" class="form-control" name="list-price" id="list-price">
    </div>
    <div class="form-group">
        <label for="discount-percent">Discount Percent</label>
        <input type="text" class="form-control" name="discount-percent" id="discount-percent">
    </div>
    <div class="submit">
        <input class="btn btn-primary" type="submit">
    </div>
</form>
<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>
</body>
</html>
