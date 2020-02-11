package com.sofftek.java.sboot.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="tipo_coccion")
public class TipoCoccion {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer tipo_coccion_id;
	private String descripcion;
	public Integer getTipo_coccion_id() {
		return tipo_coccion_id;
	}
	public void setTipo_coccion_id(Integer tipo_coccion_id) {
		this.tipo_coccion_id = tipo_coccion_id;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	
	@Override
	public String toString() {
		return "TipoCoccion [tipo_coccion_id=" + tipo_coccion_id + ", descripcion=" + descripcion + "]";
	}
}