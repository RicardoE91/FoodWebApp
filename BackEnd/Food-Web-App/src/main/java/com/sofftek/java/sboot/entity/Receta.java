package com.sofftek.java.sboot.entity;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
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
	private Proteina proteina;
	@ManyToOne()
	@JoinColumn(name="tiempo_preparacion_id")
	private TiempoPreparacion tiempoPreparacion;
	@ManyToOne()
	@JoinColumn(name="tipo_coccion_id")
	private TipoCoccion tipoCoccion;
	@ManyToOne()
	@JoinColumn(name="porciones_id")
	private Porciones porciones;
	@ManyToOne()
	@JoinColumn(name="tipo_cocina_id")
	private TipoCocina tipoCocina;
	@ManyToOne()
	@JoinColumn(name="usuario_id")
	private Usuario usuario;
	@OneToMany(cascade = CascadeType.ALL, orphanRemoval = false)
	@JoinColumn(name="receta_id")
	private List<PasosPreparacion> pasos = new ArrayList<>();
	
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
	public Proteina getProteina() {
		return proteina;
	}
	public void setProteina(Proteina proteina) {
		this.proteina = proteina;
	}
	public TiempoPreparacion getTiempoPreparacion() {
		return tiempoPreparacion;
	}
	public void setTiempoPreparacion(TiempoPreparacion tiempoPreparacion) {
		this.tiempoPreparacion = tiempoPreparacion;
	}
	public TipoCoccion getTipoCoccion() {
		return tipoCoccion;
	}
	public void setTipoCoccion(TipoCoccion tipoCoccion) {
		this.tipoCoccion = tipoCoccion;
	}
	public Porciones getPorciones() {
		return porciones;
	}
	public void setPorciones(Porciones porciones) {
		this.porciones = porciones;
	}
	public TipoCocina getTipoCocina() {
		return tipoCocina;
	}
	public void setTipoCocina(TipoCocina tipoCocina) {
		this.tipoCocina = tipoCocina;
	}
	public Usuario getUsuario() {
		return usuario;
	}
	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}
	public List<PasosPreparacion> getPasos() {
		return pasos;
	}
	public void setPasos(List<PasosPreparacion> pasos) {
		this.pasos = pasos;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	@Override
	public String toString() {
		return "Receta [receta_id=" + receta_id + ", nombre=" + nombre + ", imagen=" + imagen + ", video=" + video
				+ ", ingredientes=" + ingredientes + ", fecha_creacion=" + fecha_creacion + ", fecha_modificacion="
				+ fecha_modificacion + ", horarioComida=" + horarioComida + ", tiempoComida=" + tiempoComida
				+ ", proteina=" + proteina + ", tiempoPreparacion=" + tiempoPreparacion + ", tipoCoccion=" + tipoCoccion
				+ ", porciones=" + porciones + ", tipoCocina=" + tipoCocina + ", usuario=" + usuario + ", pasos="
				+ pasos + "]";
	}	
}