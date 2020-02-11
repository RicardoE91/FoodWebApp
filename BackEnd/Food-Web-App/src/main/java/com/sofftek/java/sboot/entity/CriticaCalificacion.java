package com.sofftek.java.sboot.entity;

import java.sql.Timestamp;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="critica_calificacion")
public class CriticaCalificacion {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer critica_calificacion_id;
	private String critica;
	private String calificacion;
	private Timestamp fecha_creacion;
	
	@ManyToOne()
	@JoinColumn(name="receta_id")
	private Receta receta_id;
	@ManyToOne()
	@JoinColumn(name="usuario_id")
	private Usuario usuario_id;
	
	public Integer getCritica_calificacion_id() {
		return critica_calificacion_id;
	}
	public void setCritica_calificacion_id(Integer critica_calificacion_id) {
		this.critica_calificacion_id = critica_calificacion_id;
	}
	public String getCritica() {
		return critica;
	}
	public void setCritica(String critica) {
		this.critica = critica;
	}
	public String getCalificacion() {
		return calificacion;
	}
	public void setCalificacion(String calificacion) {
		this.calificacion = calificacion;
	}
	public Timestamp getFecha_creacion() {
		return fecha_creacion;
	}
	public void setFecha_creacion(Timestamp fecha_creacion) {
		this.fecha_creacion = fecha_creacion;
	}
	public Receta getReceta_id() {
		return receta_id;
	}
	public void setReceta_id(Receta receta_id) {
		this.receta_id = receta_id;
	}
	public Usuario getUsuario_id() {
		return usuario_id;
	}
	public void setUsuario_id(Usuario usuario_id) {
		this.usuario_id = usuario_id;
	}
	
	@Override
	public String toString() {
		return "CriticaCalificacion [critica_calificacion_id=" + critica_calificacion_id + ", critica=" + critica
				+ ", calificacion=" + calificacion + ", fecha_creacion=" + fecha_creacion + ", receta_id=" + receta_id
				+ ", usuario_id=" + usuario_id + "]";
	}	
}