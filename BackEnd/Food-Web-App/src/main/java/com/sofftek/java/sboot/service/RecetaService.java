package com.sofftek.java.sboot.service;

import java.util.List;

import com.sofftek.java.sboot.entity.HorarioComida;
import com.sofftek.java.sboot.entity.Proteina;
import com.sofftek.java.sboot.entity.Receta;
import com.sofftek.java.sboot.entity.TiempoComida;
import com.sofftek.java.sboot.entity.TiempoPreparacion;
import com.sofftek.java.sboot.entity.TipoCoccion;

public interface RecetaService {
	public List<Receta> findAllRecetas();
	public Receta findRecetaById(Integer receta_id);
	public Receta saveReceta(Receta receta);
	public void deleteRecetaById(Integer receta_id);
	public Receta updateReceta(Receta receta);
	public Receta patchReceta(Integer receta_id, Receta requestBody);
	public List<Receta> findRecetaByHorarioComidaAndTiempoComida(HorarioComida horario_comida_id, TiempoComida tiempo_comida_id);
	public List<Receta> findRecetaByHorarioComidaAndTiempoComidaAndProteina(HorarioComida horario_comida_id, TiempoComida tiempo_comida_id, Proteina proteina_id);
	public List<Receta> findRecetaByHorarioComidaAndTiempoComidaAndTipoCoccion(HorarioComida horario_comida_id, TiempoComida tiempo_comida_id, TipoCoccion tipo_coccion_id);
	public List<Receta> findRecetaByHorarioComidaAndTiempoComidaAndTiempoPreparacion(HorarioComida horario_comida_id, TiempoComida tiempo_comida_id, TiempoPreparacion tiempo_preparacion_id);
	public List<Receta> findRecetaByNombreContaining(String nombre);
}