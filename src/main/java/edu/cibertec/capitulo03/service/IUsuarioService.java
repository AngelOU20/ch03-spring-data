package edu.cibertec.capitulo03.service;

import edu.cibertec.capitulo03.model.UsuarioDTO;

import java.util.List;

public interface IUsuarioService {
    UsuarioDTO validarLogin(UsuarioDTO usuario);
    void insertarUsuario(UsuarioDTO usuario);
    List<UsuarioDTO> listarUsuarios();
    void eliminarUsuario(UsuarioDTO usuario);
    UsuarioDTO obtenerUsuario(int id);
}
