package com.sofftek.java.sboot.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="proteina")
public class Proteina {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer proteina_id;
	private String descripcion;
	
	public Integer getProteina_id() {
		return proteina_id;
	}
	public void setProteina_id(Integer proteina_id) {
		this.proteina_id = proteina_id;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	
	@Override
	public String toString() {
		return "Proteina [proteina_id=" + proteina_id + ", descripcion=" + descripcion + "]";
	}
}