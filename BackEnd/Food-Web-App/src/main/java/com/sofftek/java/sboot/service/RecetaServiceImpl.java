package com.sofftek.java.sboot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sofftek.java.sboot.entity.HorarioComida;
import com.sofftek.java.sboot.entity.Receta;
import com.sofftek.java.sboot.entity.TiempoComida;
import com.sofftek.java.sboot.repository.RecetaRepository;

@Service
public class RecetaServiceImpl implements RecetaService {
	@Autowired
	private RecetaRepository recetaRepository;

	@Override
	@Transactional(readOnly = true)
	public List<Receta> findAllRecetas() {
		return (List<Receta>) recetaRepository.findAll();
	}

	@Override
	@Transactional(readOnly = true)
	public Receta findRecetaById(Integer receta_id) {
		return recetaRepository.findById(receta_id).orElse(null);
	}

	@Override
	public Receta saveReceta(Receta receta) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteReceta(Integer receta_id) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Receta updateReceta(Receta receta) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Receta patchReceta(Integer receta_id, Receta requestBody) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Receta findRecetaByNombre(String nombre) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Receta> findRecetaByHorarioComidaAndTiempoComida(HorarioComida horario_comida_id,
			TiempoComida tiempo_comida_id) {
		return recetaRepository.findRecetaByHorarioComidaAndTiempoComida(horario_comida_id, tiempo_comida_id);
	}
}