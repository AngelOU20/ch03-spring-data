<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="mvc" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Datos del Usuario</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
          crossorigin="anonymous">
    <style type="text/css">
        .formFieldError { background-color: #FFC; }
        .form-container {
            max-width: 600px;
            margin: 50px auto;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            background-color: #ffffff;
        }
        .form-container h1 {
            margin-bottom: 20px;
        }
        .input-group-text {
            width: 2.5rem;
            text-align: center;
        }
        .form-container .btn {
            margin-top: 20px;
        }
    </style>
</head>
<body>

<div class="container form-container">
    <h1>Datos del usuario</h1>
    <mvc:form modelAttribute="usuarioBean" action="usuarioGrabar.do">
        <div class="mb-3">
            <mvc:label path="usuario">Usuario:</mvc:label>
            <div class="input-group">
                <span class="input-group-text" id="user-icon"><i class="fas fa-user"></i></span>
                <mvc:input path="usuario" cssErrorClass="form-control text-box formFieldError"
                           type="text" cssClass="form-control"
                           id="usuario" name="usuario"
                           placeholder="JuanV23" />
            </div>
            <mvc:errors path="usuario" cssClass="text-danger text-uppercase" />
        </div>

        <div class="mb-3">
            <mvc:label path="clave">Clave:</mvc:label>
            <div class="input-group">
                <span class="input-group-text" id="password-icon"><i class="fas fa-lock"></i></span>
                <mvc:input path="clave" cssErrorClass="form-control text-box formFieldError"
                           type="password" cssClass="form-control"
                           id="clave" name="clave" placeholder="qw12fds" />
            </div>
            <mvc:errors path="clave" cssClass="text-danger text-uppercase" />
        </div>

        <div class="mb-3">
            <mvc:label path="nombreCompleto">Nombre completo:</mvc:label>
            <div class="input-group">
                <span class="input-group-text" id="name-icon"><i class="fas fa-id-card"></i></span>
                <input type="text" class="form-control"
                       id="nombreCompleto" name="nombreCompleto"
                       placeholder="Juan Valdez">
            </div>
        </div>

        <div class="d-flex justify-content-between">
            <button type="submit" class="btn btn-primary">
                <i class="fas fa-save"></i> Insertar
            </button>
            <a href="listaUsuarios.do" class="btn btn-secondary">
                <i class="fas fa-arrow-left"></i> Regresar
            </a>
        </div>
    </mvc:form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
<!-- Font Awesome -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/js/all.min.js"></script>
</body>
</html>