package edu.cibertec.capitulo03.service;

import edu.cibertec.capitulo03.dao.IUsuarioDAO;
import edu.cibertec.capitulo03.model.UsuarioEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class UsuarioService implements IUsuarioService {

    @Autowired
    private IUsuarioDAO usuarioDAO;

    @Override
    public UsuarioEntity validarLogin(UsuarioEntity usuario) {
        Optional<UsuarioEntity> rpta = usuarioDAO.findByUsuario(usuario.getUsuario());
        if (!rpta.isPresent() || !rpta.get().getClave().equals(usuario.getClave())) {
            return null;
        }
        return rpta.get();
    }

    @Override
    public void insertarUsuario(UsuarioEntity usuario) {
        usuarioDAO.save(usuario);
    }

    @Override
    public List<UsuarioEntity> listarUsuarios() {
        return usuarioDAO.findAll();
    }

    @Override
    public void eliminarUsuario(UsuarioEntity usuario) {
        usuarioDAO.delete(usuario);
    }

    @Override
    public Optional<UsuarioEntity> obtenerUsuario(int id) {
        return usuarioDAO.findById(id);
    }
}
