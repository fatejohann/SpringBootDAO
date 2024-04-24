<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Nuevo estudiante</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</head>
<body>
<nav class="navbar navbar-dark bg-dark navbar-expand-lg">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">Ejemplo MVC con Spring Boot</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">

                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        Estudiantes
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" th:href="@{/estudiantes/lista}">Lista Estudiantes</a></li>
                        <li><a class="dropdown-item" th:href="@{/estudiantes/nuevo}">Nuevo Estudiante</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav><br>
<div class="container">
    <div class="row">
        <h3>Modificar estudiante</h3>
    </div>
    <div class="row">
        <div class=" col-md-7">
            <form th:action="@{/estudiantes/modificar}" method="POST" th:object="${estudiante}">
                <div class="form-group">
                    <label for="carnet">Carnet:</label>
                    <div class="input-group">
                        <input type="text" name="carnet" th:field="*{carnet}" id="carnet" class="form-control" readonly="true" >
                        <span class="input-group-addon"><span class="glyphicon glyphicon-asterisk"></span></span>
                    </div>
                </div>
                <div class="form-group">
                    <label for="nombres">Nombres:</label>
                    <div class="input-group">
                        <input type="text" name="nombres" th:field="*{nombres}" id="nombres" class="form-control" >
                        <span class="input-group-addon"><span class="glyphicon glyphicon-asterisk"></span></span>
                    </div>
                </div>
                <div class="form-group">
                    <label for="apellidos">Apellidos:</label>
                    <div class="input-group">
                        <input type="text" name="apellidos" th:field="*{apellidos}" id="apellidos" class="form-control" >
                        <span class="input-group-addon"><span class="glyphicon glyphicon-asterisk"></span></span>
                    </div>
                </div>
                <div class="form-group">
                    <label for="edad">Edad:</label>
                    <div class="input-group">
                        <input type="number" name="edad" th:field="*{edad}" id="edad" class="form-control" >
                        <span class="input-group-addon"><span class="glyphicon glyphicon-asterisk"></span></span>
                    </div>
                </div>
                <div class="form-group">
                    <label for="cum">CUM:</label>
                    <div class="input-group">
                        <input type="text" name="cum" th:field="*{cum}" id="cum" class="form-control" >
                        <span class="input-group-addon"><span class="glyphicon glyphicon-asterisk"></span></span>
                    </div>
                </div>
                <div class="form-group">
                    <label for="genero">Genero:</label>
                    <div class="input-group">
                        <select name="genero" th:field="*{genero}" id="genero" class="form-control">
                            <option th:value="f" th:label="Femenino"/>
                            <option th:value="m" th:label="Masculino"/>
                        </select>
                        <span class="input-group-addon"><span class="glyphicon glyphicon-asterisk"></span></span>
                    </div>
                </div>

                <div class="form-group">
                    <label for="carrera">Carrera:</label>
                    <div class="input-group">
                        <input type="text" name="carrera" th:field="*{carrera}" id="carrera" class="form-control" >
                        <span class="input-group-addon"><span class="glyphicon glyphicon-asterisk"></span></span>
                    </div>
                </div>
                <br>
                <div class="form-group">
                    <input type="submit" class="btn btn-primary" value="Editar">
                    <a class="btn btn-danger" th:href="@{/estudiantes/lista}">Cancelar</a>
                </div>
            </form>
        </div>
    </div>
</div>

<script>

</script>

</body>
</html>