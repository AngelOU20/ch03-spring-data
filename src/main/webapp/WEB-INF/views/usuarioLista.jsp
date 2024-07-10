<%@page import="edu.cibertec.capitulo03.model.UsuarioEntity"%>
<%@page import="java.util.List"%>
<%@ page import="java.util.Base64" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
          crossorigin="anonymous">
    <title>Mantenimiento de usuarios</title>

    <style>
        .navbar-brand {
            padding: 0  2rem 0 0;
            margin-bottom: 0.1rem;
        }
        .table-container {
            margin-top: 20px;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            background-color: #ffffff;
        }
        .table > tbody {
            vertical-align: middle;
        }
        .avatar {
            width: 2.5rem;
            height: 2.5rem;
            border-radius: 50%;
            margin-right: 10px;
        }
        .status-badge {
            font-size: 0.7rem;
            font-weight: bold;
            padding: 5px 12px;
            border-radius: 20px;
            color: #036721;
        }
        .status-active {
            background-color: rgba(106, 255, 123, 0.5);
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

<section class="container mt-5">
    <h1>Listado de Usuarios</h1>
    <br/>
    <div class="d-flex align-items-center justify-content-between">
        <a href="usuarioCrear.do" class="btn btn-primary">Crear Usuario</a>
        <p class="text-body-tertiary fw-medium">
            Usuarios creados en esta sesión: ${sessionScope.contador}
        </p>
    </div>
    <% List<UsuarioEntity> lista = (List<UsuarioEntity>) request.getAttribute("lista"); %>
    <div class="container table-container mt-5">
        <table class="table table-hover">
            <thead>
            <tr>
                <th>#</th>
                <th>Nombre Completo</th>
                <th>Usuario</th>
                <th>Clave</th>
                <th>Estado</th>
                <th>Foto</th>
                <th>Acciones</th>
            </tr>
            </thead>
            <tbody>
            <% int c = 1; %>
            <% for (UsuarioEntity usuario : lista) { %>
            <tr>
                <td><%= c++ %></td>
                <td>
                    <%
                        String foto = usuario.getFoto() != null ?
                                "data:image/jpeg;base64," + Base64.getEncoder().encodeToString(usuario.getFoto()) :
                                "https://via.placeholder.com/40";
                    %>
                    <img src="<%= foto %>" class="avatar" alt="Avatar">
<%--                    <img src="https://via.placeholder.com/40" class="avatar" alt="Avatar">--%>
                    <%= usuario.getNombreCompleto() %>
                </td>
                <td><%= usuario.getUsuario() %></td>
                <td><%= usuario.getClave() %></td>
                <td><span class="status-badge status-active">Activo</span></td>
                <td>
                    <a href="mostrarFoto.do?idUsuario=<%= usuario.getId() %>">
                        Ver foto
                    </a>
                </td>
                <td>
                    <a href="#" class="text-primary me-4"><i
                            class="fas fa-edit"></i></a>
                    <a href="usuarioEliminar.do?id=<%= usuario.getId() %>" class="text-danger"><i
                            class="fas fa-trash-alt"></i></a>
                </td>
            </tr>
            <% } %>
            </tbody>
        </table>
    </div>
</section>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
<!-- Font Awesome -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/js/all.min.js"></script>
</body>
</html>
