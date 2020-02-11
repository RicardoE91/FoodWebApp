package com.sofftek.java.sboot.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="tipo_cocina")
public class TipoCocina {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer tipo_cocina_id;
	private String descripcion;
	
	public Integer getTipo_cocina_id() {
		return tipo_cocina_id;
	}
	public void setTipo_cocina_id(Integer tipo_cocina_id) {
		this.tipo_cocina_id = tipo_cocina_id;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	
	@Override
	public String toString() {
		return "TipoCocina [tipo_cocina_id=" + tipo_cocina_id + ", descripcion=" + descripcion + "]";
	}
}