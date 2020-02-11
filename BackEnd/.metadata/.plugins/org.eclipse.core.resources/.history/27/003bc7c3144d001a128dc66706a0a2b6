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
	private Receta receta_id;
	@ManyToOne()
	@JoinColumn(name="usuario_id")
	private Usuario usuario_id;
	
	public Integer getMe_gusta_id() {
		return me_gusta_id;
	}
	public void setMe_gusta_id(Integer me_gusta_id) {
		this.me_gusta_id = me_gusta_id;
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
		return "MeGusta [me_gusta_id=" + me_gusta_id + ", receta_id=" + receta_id + ", usuario_id=" + usuario_id + "]";
	}
}