package com.sofftek.java.sboot.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.sofftek.java.sboot.entity.Usuario;

public interface UsuarioRepository extends JpaRepository<Usuario, Integer>{

}