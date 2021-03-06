package com.sofftek.java.sboot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sofftek.java.sboot.entity.HorarioComida;
import com.sofftek.java.sboot.entity.Proteina;
import com.sofftek.java.sboot.entity.Receta;
import com.sofftek.java.sboot.entity.TiempoComida;
import com.sofftek.java.sboot.entity.TiempoPreparacion;
import com.sofftek.java.sboot.entity.TipoCoccion;
import com.sofftek.java.sboot.repository.RecetaRepository;

@Service
public class RecetaServiceImpl implements RecetaService {
	@Autowired
	private RecetaRepository recetaRepository;

	@Override
	@Transactional(readOnly = true)
	public List<Receta> findAllRecetas() {
		return recetaRepository.findAll();
	}

	@Override
	@Transactional(readOnly = true)
	public Receta findRecetaById(Integer receta_id) {
		return recetaRepository.findById(receta_id).orElse(null);
	}

	@Override
	@Transactional
	public Receta saveReceta(Receta receta) {
		return recetaRepository.save(receta);
	}

	@Override
	@Transactional
	public void deleteRecetaById(Integer receta_id){
		recetaRepository.deleteById(receta_id);		
	}

	@Override
	@Transactional
	public Receta updateReceta(Receta receta) {
		return recetaRepository.save(receta);
	}

	@Override
	@Transactional
	public Receta patchReceta(Integer receta_id, Receta requestBody) {
		Receta receta = findRecetaById(receta_id);
		receta.setReceta_id(receta_id);
		receta.setNombre(requestBody.getNombre() != null ? requestBody.getNombre() : receta.getNombre());
		receta.setImagen(requestBody.getImagen() != null ? requestBody.getImagen() : receta.getImagen());
		receta.setVideo(requestBody.getVideo() != null ? requestBody.getVideo() : receta.getVideo());
		receta.setIngredientes(requestBody.getIngredientes() != null ? requestBody.getIngredientes() : receta.getIngredientes());
		receta.setHorarioComida(requestBody.getHorarioComida() != null ? requestBody.getHorarioComida() : receta.getHorarioComida());
		receta.setTiempoComida(requestBody.getTiempoComida() != null ? requestBody.getTiempoComida() : receta.getTiempoComida());
		receta.setProteina(requestBody.getProteina() != null ? requestBody.getProteina() : receta.getProteina());
		receta.setTiempoPreparacion(requestBody.getTiempoPreparacion() != null ? requestBody.getTiempoPreparacion() : receta.getTiempoPreparacion());
		receta.setTipoCoccion(requestBody.getTipoCoccion() != null ? requestBody.getTipoCoccion() : receta.getTipoCoccion());
		receta.setPorciones(requestBody.getPorciones() != null ? requestBody.getPorciones() : receta.getPorciones());
		receta.setTipoCocina(requestBody.getTipoCocina() != null ? requestBody.getTipoCocina() : receta.getTipoCocina());
		receta.setUsuario(requestBody.getUsuario() != null ? requestBody.getUsuario() : receta.getUsuario());
		receta.setFecha_creacion(requestBody.getFecha_creacion() != null ? requestBody.getFecha_creacion() : receta.getFecha_creacion());
		receta.setFecha_modificacion(requestBody.getFecha_modificacion() != null ? requestBody.getFecha_modificacion() : receta.getFecha_modificacion());
		receta.setPasos(requestBody.getPasos() != null ? requestBody.getPasos() : receta.getPasos());
		return recetaRepository.save(receta);
	}

	@Override
	@Transactional(readOnly = true)
	public List<Receta> findRecetaByHorarioComidaAndTiempoComida(HorarioComida horario_comida_id,
			TiempoComida tiempo_comida_id) {
		return recetaRepository.findRecetaByHorarioComidaAndTiempoComida(horario_comida_id, tiempo_comida_id);
	}

	@Override
	@Transactional(readOnly = true)
	public List<Receta> findRecetaByHorarioComidaAndTiempoComidaAndProteina(HorarioComida horario_comida_id,
			TiempoComida tiempo_comida_id, Proteina proteina_id) {
		return recetaRepository.findRecetaByHorarioComidaAndTiempoComidaAndProteina(horario_comida_id, tiempo_comida_id, proteina_id);
	}

	@Override
	@Transactional(readOnly = true)
	public List<Receta> findRecetaByHorarioComidaAndTiempoComidaAndTipoCoccion(HorarioComida horario_comida_id,
			TiempoComida tiempo_comida_id, TipoCoccion tipo_coccion_id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	@Transactional(readOnly = true)
	public List<Receta> findRecetaByHorarioComidaAndTiempoComidaAndTiempoPreparacion(HorarioComida horario_comida_id,
			TiempoComida tiempo_comida_id, TiempoPreparacion tiempo_preparacion_id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	@Transactional(readOnly = true)
	public List<Receta> findRecetaByNombreContaining(String nombre) {
		return recetaRepository.findRecetaByNombreContaining(nombre);
	}
}