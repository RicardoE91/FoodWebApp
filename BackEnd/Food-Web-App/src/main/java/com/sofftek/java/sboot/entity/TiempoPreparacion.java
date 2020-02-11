package com.sofftek.java.sboot.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="tiempo_preparacion")
public class TiempoPreparacion {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer tiempo_preparacion_id;
	private String descripcion;
	
	public Integer getTiempo_preparacion_id() {
		return tiempo_preparacion_id;
	}
	public void setTiempo_preparacion_id(Integer tiempo_preparacion_id) {
		this.tiempo_preparacion_id = tiempo_preparacion_id;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	
	@Override
	public String toString() {
		return "TiempoPreparacion [tiempo_preparacion_id=" + tiempo_preparacion_id + ", descripcion=" + descripcion
				+ "]";
	}
}