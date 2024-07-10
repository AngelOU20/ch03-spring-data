package edu.cibertec.capitulo03.service;

import edu.cibertec.capitulo03.dao.UsuarioDAO;
import edu.cibertec.capitulo03.model.UsuarioDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UsuarioService implements IUsuarioService {

    @Autowired
    private UsuarioDAO usuarioDAO;

    @Override
    public UsuarioDTO validarLogin(UsuarioDTO usuario) {
        return usuarioDAO.validarLogin(usuario);
    }

    @Override
    public void insertarUsuario(UsuarioDTO usuario) {
        usuarioDAO.insertarUsuario(usuario);
    }

    @Override
    public List<UsuarioDTO> listarUsuarios() {
        return usuarioDAO.listarUsuarios();
    }

    @Override
    public void eliminarUsuario(UsuarioDTO usuario) {
        usuarioDAO.eliminarUsuario(usuario);
    }

    @Override
    public UsuarioDTO obtenerUsuario(int id) {
        return usuarioDAO.obtenerUsuario(id);
    }
}
