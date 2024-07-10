package edu.cibertec.capitulo03.dao;

import edu.cibertec.capitulo03.model.UsuarioEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface IUsuarioDAO extends JpaRepository<UsuarioEntity, Integer> {
    Optional<UsuarioEntity> findByUsuario(String usuario);
}
