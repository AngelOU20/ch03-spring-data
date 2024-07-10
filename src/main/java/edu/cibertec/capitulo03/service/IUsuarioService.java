package edu.cibertec.capitulo03.service;

import edu.cibertec.capitulo03.model.UsuarioEntity;

import java.util.List;
import java.util.Optional;

public interface IUsuarioService {
    UsuarioEntity validarLogin(UsuarioEntity usuario);
    void insertarUsuario(UsuarioEntity usuario);
    List<UsuarioEntity> listarUsuarios();
    void eliminarUsuario(UsuarioEntity usuario);
    Optional<UsuarioEntity> obtenerUsuario(int id);
}
