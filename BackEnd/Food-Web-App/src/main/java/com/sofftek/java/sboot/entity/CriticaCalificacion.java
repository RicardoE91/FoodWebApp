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
	private Receta receta;
	@ManyToOne()
	@JoinColumn(name="usuario_id")
	private Usuario usuario;
	
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
	public Receta getReceta() {
		return receta;
	}
	public void setReceta(Receta receta) {
		this.receta = receta;
	}
	public Usuario getUsuario() {
		return usuario;
	}
	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}
	
	@Override
	public String toString() {
		return "CriticaCalificacion [critica_calificacion_id=" + critica_calificacion_id + ", critica=" + critica
				+ ", calificacion=" + calificacion + ", fecha_creacion=" + fecha_creacion + ", receta=" + receta
				+ ", usuario=" + usuario + "]";
	}
}