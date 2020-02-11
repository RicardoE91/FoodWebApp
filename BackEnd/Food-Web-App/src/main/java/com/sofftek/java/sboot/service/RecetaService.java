package com.sofftek.java.sboot.service;

import java.util.List;

import com.sofftek.java.sboot.entity.Receta;

public interface RecetaService {
	public List<Receta> findAllRecetas();
	public Receta findRecetaById(Integer receta_id);
	public Receta saveReceta(Receta receta);
	public void deleteReceta(Integer receta_id);
	public Receta updateReceta(Receta receta);
	public Receta patchReceta(Integer receta_id, Receta requestBody);
	public Receta findRecetaByNombre(String nombre);
	public List<Receta> findRecetaByHorarioComidaAndTiempoComida(Integer horario_comida_id, Integer tiempo_comida_id);
	public List<Receta> findRecetaByHorarioComida_HorarioComidaId_AndTiempoComida_TiempoComidaId(Integer horario_comida_id, Integer tiempo_comida_id);
}