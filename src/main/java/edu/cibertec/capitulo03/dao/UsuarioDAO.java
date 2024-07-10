package edu.cibertec.capitulo03.dao;

import edu.cibertec.capitulo03.model.UsuarioDTO;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.atomic.AtomicInteger;

@Repository
public class UsuarioDAO implements IUsuarioDAO {

    private List<UsuarioDTO> usuarios;
    private AtomicInteger idCounter;

    public UsuarioDAO() {
        usuarios = new ArrayList<>();
        idCounter = new AtomicInteger();
        usuarios.add(new UsuarioDTO(idCounter.incrementAndGet(),"Juan", "qw3w5", "Juan Perez"));
        usuarios.add(new UsuarioDTO(idCounter.incrementAndGet(),"Carmen", "1wqe45", "Carmen Perez"));
        usuarios.add(new UsuarioDTO(idCounter.incrementAndGet(),"Jose", "123aw", "Jose Perez"));
        usuarios.add(new UsuarioDTO(idCounter.incrementAndGet(),"Manuel", "1as45", "Manuel Perez"));
    }

    @Override
    public void insertarUsuario(UsuarioDTO usuario) {
        usuario.setId(idCounter.incrementAndGet());
        usuarios.add(usuario);
    }

    @Override
    public List<UsuarioDTO> listarUsuarios() {
        return usuarios;
    }

    @Override
    public UsuarioDTO validarLogin(UsuarioDTO usuario) {
        if(usuario.getUsuario().equalsIgnoreCase("user") &&
                usuario.getClave().equals("admin"))
            usuario.setNombreCompleto("Nombre completo del usuario");
        else
            usuario = null;

        return usuario;
    }

    @Override
    public void eliminarUsuario(UsuarioDTO usuario) {
        usuarios.removeIf(u -> u.getId() == usuario.getId());
    }

    @Override
    public UsuarioDTO obtenerUsuario(int id) {
        UsuarioDTO resp = null;
        for(UsuarioDTO usuario : usuarios) {
            if(usuario.getId() == id) {
                resp = usuario;
                break;
            }
        }
        return resp;
    }
}
