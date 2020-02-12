package com.sofftek.java.sboot.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="tiempo_comida")
public class TiempoComida{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer tiempo_comida_id;
	private String descripcion;
	
	public Integer getTiempo_comida_id() {
		return tiempo_comida_id;
	}
	public void setTiempo_comida_id(Integer tiempo_comida_id) {
		this.tiempo_comida_id = tiempo_comida_id;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	
	@Override
	public String toString() {
		return "TiempoComida [tiempo_comida_id=" + tiempo_comida_id + ", descripcion=" + descripcion + "]";
	}	
}