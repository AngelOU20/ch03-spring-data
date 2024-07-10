<%--
  Created by IntelliJ IDEA.
  User: Julio
  Date: 01/07/2024
  Time: 21:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.Base64" %>
<%@ page import="edu.cibertec.capitulo03.model.UsuarioDTO" %>

<html>
<head>
    <title>Foto usuario</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
          crossorigin="anonymous">
    <style type="text/css">
        .form-container {
            max-width: 600px;
            margin: 50px auto;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            background-color: #ffffff;
        }
        .input-group {
            display: flex;
            justify-content: flex-start;
            align-items: flex-start;
            flex-direction: column;
            gap: 1rem;
        }
        .form-container .btn {
            margin-top: 20px;
        }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg bg-body-tertiary">
    <div class="container">
        <a class="navbar-brand" href="home.do">Home</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav me-auto">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page"
                       href="listaUsuarios.do">Administrar usuarios
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Características</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<section class="container d-flex flex-column justify-content-center mt-5">
    <h1 class="text-center mb-4">Foto de <%=
    ((UsuarioDTO) request.getAttribute("usuario")).getNombreCompleto()%></h1>

    <% if (request.getAttribute("usuario") == null ||
            ((UsuarioDTO) request.getAttribute("usuario")).getFoto() == null) {%>

    <h2 class="h3 text-center">Usuario sin FOTO!!</h2>

    <% } else { %>

        <img src="<%= "data:image/jpeg;base64," + Base64.getEncoder()
        .encodeToString(((UsuarioDTO) request.getAttribute("usuario")).getFoto())  %>"
             alt="foto usuario" class="rounded mx-auto d-block img-fluid" style="width: 18rem;">

    <% } %>

    <form class="mt-5 form-container" action="registrarFoto.do" method="post"
           enctype="multipart/form-data">
        <div class="input-group mb-3">
            <label class="form-label">Seleccionar Foto:</label>
            <input type="file" name="archivo" class="form-control w-100" />
        </div>

        <input type="hidden" name="idUsuario"
               value="<%=(((UsuarioDTO) request.getAttribute("usuario")).getId())%>">

        <div class="d-flex align-items-center justify-content-between">
            <button type="submit" class="btn btn-primary">
                <i class="fas fa-save"></i> Grabar foto
            </button>

            <a href="listaUsuarios.do" class="btn btn-secondary">
                <i class="fas fa-arrow-left"></i> Regresar
            </a>
        </div>
<%--        <input type="submit" class="btn btn-primary" value="Grabar foto">--%>
    </form>

</section>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
<!-- Font Awesome -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/js/all.min.js">
</script>
</body>
</html>
