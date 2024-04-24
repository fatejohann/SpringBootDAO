<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Lista estudiantes</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <link th:href="@{/css/alertify.core.css}" rel="stylesheet">
    <link th:href="@{/css/alertify.default.css}" rel="stylesheet">
    <script type="text/javascript" th:src="@{/js/alertify.js}"></script>
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
        <h3>Lista estudiantes</h3>
    </div>
    <div class="row">
        <div class="col-md-12">
            <a class="btn btn-primary btn-md" th:href="@{/estudiantes/nuevo}">Nuevo estudiante</a>
            <br><br>
            <table class="table table-striped table-bordered table-hover"
                   id="tabla">
                <thead>
                <tr>
                    <th>Carnet</th>
                    <th>Nombre</th>
                    <th>Apellido</th>
                    <th>Edad</th>
                    <th>Cum</th>
                    <th>Genero</th>
                    <th>Carrera</th>
                    <th>Acciones</th>
                </tr>
                </thead>
                <tbody>
                    <tr th:each="estudiante: ${estudiantes}">
                        <td th:text="${estudiante.carnet}"></td>
                        <td th:text="${estudiante.nombres}"></td>
                        <td th:text="${estudiante.apellidos}"></td>
                        <td th:text="${estudiante.edad}"></td>
                        <td th:text="${estudiante.cum}"></td>
                        <td th:text="${estudiante.genero}"></td>
                        <td th:text="${estudiante.carrera}"></td>
                        <td><a class="btn btn-primary"
                               th:href="@{/estudiantes/editar/{carnet}(carnet=${estudiante.carnet})}"/>Editar</a>
                            <a class="btn btn-danger" id="btneliminar"
                               th:data="${estudiante.carnet}"
                               th:onclick="eliminar(this.getAttribute('data'))">
                               Eliminar</a>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
<script th:inline="javascript">

    var exito=[[${exito}]];

    if(exito!=null){
        alertify.success(exito);
    }

    function eliminar(carnet){
        alertify.confirm("¿Desea eliminar este estudiante?", function
            (e){
            if(e){
                location.href="/estudiantes/eliminar/"+carnet;
            }
        });
    }

</script>

</body>
</html>
