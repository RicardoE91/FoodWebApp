package com.sofftek.java.sboot.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="me_gusta")
public class MeGusta {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer me_gusta_id;
	
	@ManyToOne()
	@JoinColumn(name="receta_id")
	private Receta receta;
	@ManyToOne()
	@JoinColumn(name="usuario_id")
	private Usuario usuario;
	
	public Integer getMe_gusta_id() {
		return me_gusta_id;
	}
	public void setMe_gusta_id(Integer me_gusta_id) {
		this.me_gusta_id = me_gusta_id;
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
		return "MeGusta [me_gusta_id=" + me_gusta_id + ", receta=" + receta + ", usuario=" + usuario + "]";
	}	
}