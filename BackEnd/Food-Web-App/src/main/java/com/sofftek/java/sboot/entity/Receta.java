package com.sofftek.java.sboot.entity;

import java.io.Serializable;
import java.sql.Timestamp;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="receta")
public class Receta implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer receta_id;
	private String nombre;
	private String imagen;
	private String video;
	private String ingredientes;
	private Timestamp fecha_creacion;
	private Timestamp fecha_modificacion;
	
	@ManyToOne()
	@JoinColumn(name="horario_comida_id")
	private HorarioComida horarioComida;
	@ManyToOne()
	@JoinColumn(name="tiempo_comida_id")
	private TiempoComida tiempoComida;
	@ManyToOne()
	@JoinColumn(name="proteina_id")
	private Proteina proteina_id;
	@ManyToOne()
	@JoinColumn(name="tiempo_preparacion_id")
	private TiempoPreparacion tiempo_preparacion_id;
	@ManyToOne()
	@JoinColumn(name="tipo_coccion_id")
	private TipoCoccion tipo_coccion_id;
	@ManyToOne()
	@JoinColumn(name="porciones_id")
	private Porciones porciones_id;
	@ManyToOne()
	@JoinColumn(name="tipo_cocina_id")
	private TipoCocina tipo_cocina_id;
	@ManyToOne()
	@JoinColumn(name="usuario_id")
	private Usuario usuario_id;
	
	public Integer getReceta_id() {
		return receta_id;
	}
	public void setReceta_id(Integer receta_id) {
		this.receta_id = receta_id;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getImagen() {
		return imagen;
	}
	public void setImagen(String imagen) {
		this.imagen = imagen;
	}
	public String getVideo() {
		return video;
	}
	public void setVideo(String video) {
		this.video = video;
	}
	public String getIngredientes() {
		return ingredientes;
	}
	public void setIngredientes(String ingredientes) {
		this.ingredientes = ingredientes;
	}
	public Timestamp getFecha_creacion() {
		return fecha_creacion;
	}
	public void setFecha_creacion(Timestamp fecha_creacion) {
		this.fecha_creacion = fecha_creacion;
	}
	public Timestamp getFecha_modificacion() {
		return fecha_modificacion;
	}
	public void setFecha_modificacion(Timestamp fecha_modificacion) {
		this.fecha_modificacion = fecha_modificacion;
	}
	public HorarioComida getHorarioComida() {
		return horarioComida;
	}
	public void setHorarioComida(HorarioComida horarioComida) {
		this.horarioComida = horarioComida;
	}
	public TiempoComida getTiempoComida() {
		return tiempoComida;
	}
	public void setTiempoComida(TiempoComida tiempoComida) {
		this.tiempoComida = tiempoComida;
	}
	public Proteina getProteina_id() {
		return proteina_id;
	}
	public void setProteina_id(Proteina proteina_id) {
		this.proteina_id = proteina_id;
	}
	public TiempoPreparacion getTiempo_preparacion_id() {
		return tiempo_preparacion_id;
	}
	public void setTiempo_preparacion_id(TiempoPreparacion tiempo_preparacion_id) {
		this.tiempo_preparacion_id = tiempo_preparacion_id;
	}
	public TipoCoccion getTipo_coccion_id() {
		return tipo_coccion_id;
	}
	public void setTipo_coccion_id(TipoCoccion tipo_coccion_id) {
		this.tipo_coccion_id = tipo_coccion_id;
	}
	public Porciones getPorciones_id() {
		return porciones_id;
	}
	public void setPorciones_id(Porciones porciones_id) {
		this.porciones_id = porciones_id;
	}
	public TipoCocina getTipo_cocina_id() {
		return tipo_cocina_id;
	}
	public void setTipo_cocina_id(TipoCocina tipo_cocina_id) {
		this.tipo_cocina_id = tipo_cocina_id;
	}
	public Usuario getUsuario_id() {
		return usuario_id;
	}
	public void setUsuario_id(Usuario usuario_id) {
		this.usuario_id = usuario_id;
	}
	
	@Override
	public String toString() {
		return "Receta [receta_id=" + receta_id + ", nombre=" + nombre + ", imagen=" + imagen + ", video=" + video
				+ ", ingredientes=" + ingredientes + ", fecha_creacion=" + fecha_creacion + ", fecha_modificacion="
				+ fecha_modificacion + ", horarioComida=" + horarioComida + ", tiempoComida=" + tiempoComida
				+ ", proteina_id=" + proteina_id + ", tiempo_preparacion_id=" + tiempo_preparacion_id
				+ ", tipo_coccion_id=" + tipo_coccion_id + ", porciones_id=" + porciones_id + ", tipo_cocina_id="
				+ tipo_cocina_id + ", usuario_id=" + usuario_id + "]";
	}
}