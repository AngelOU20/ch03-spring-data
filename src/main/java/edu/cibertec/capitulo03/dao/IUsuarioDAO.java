package edu.cibertec.capitulo03.dao;

import edu.cibertec.capitulo03.model.UsuarioDTO;

import java.util.List;

public interface IUsuarioDAO {
    void insertarUsuario(UsuarioDTO usuario);
    List<UsuarioDTO> listarUsuarios();
    UsuarioDTO validarLogin(UsuarioDTO usuario);
    void eliminarUsuario(UsuarioDTO usuario);
    UsuarioDTO obtenerUsuario(int id);
}
