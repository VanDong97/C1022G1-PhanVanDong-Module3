<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2/10/2023
  Time: 3:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <title>Title</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="bootstrap.css/bootstrap.js">
</head>
<body>
<form action="/pt" method="get">
    <table>
        <tr>
            <td>
                <label for="number1">
                    Nhập số thứ nhất
                </label>
            </td>
            <td><input type="number1" class="form-control" name="n1" id="number1"></td>
        </tr>
        <tr>
            <td>
                <p>Nhập phép tính</p>
            </td>
            <td>
                <select name="calculation">
                    <option value="+"> +</option>
                    <option value="-"> -</option>
                    <option value="*"> *</option>
                    <option value="/"> /</option>
                </select>
            </td>
        </tr>
        <tr>
            <td>
                <label for="number2">
                    Nhập số tiếp theo
                </label>
            </td>
            <td>
                <input type="number2" class="form-control" name="n2" id="number2">
            </td>
        </tr>
    <tr>
        <td>
            <input class="btn btn-primary" type="submit" value="Kiểm Tra">
        </td>
    </tr>
    </table>
</form>

<h2>${result}</h2>
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
