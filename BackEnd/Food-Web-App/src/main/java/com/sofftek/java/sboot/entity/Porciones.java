package com.sofftek.java.sboot.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="porciones")
public class Porciones {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer porciones_id;
	private String descripcion;
	
	public Integer getPorciones_id() {
		return porciones_id;
	}
	public void setPorciones_id(Integer porciones_id) {
		this.porciones_id = porciones_id;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	
	@Override
	public String toString() {
		return "Porciones [porciones_id=" + porciones_id + ", descripcion=" + descripcion + "]";
	}	
}