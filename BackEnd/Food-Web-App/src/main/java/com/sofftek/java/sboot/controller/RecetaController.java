package com.sofftek.java.sboot.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import com.sofftek.java.sboot.entity.Receta;
import com.sofftek.java.sboot.service.RecetaService;

@RestController
@RequestMapping("/recetas")
public class RecetaController {
	@Autowired
	RecetaService recetaService;
	
	@GetMapping(value = "", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseStatus(HttpStatus.OK)
	public List<Receta> findAllRecetas(){
		return recetaService.findAllRecetas();
	}
	
	@GetMapping(value = "/{horario_comida_id}/{tiempo_comida_id}", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseStatus(HttpStatus.OK)
	public List<Receta> findRecetaByHorarioComida_HorarioComidaId_AndTiempoComida_TiempoComidaId(@PathVariable int horario_comida_id, @PathVariable int tiempo_comida_id){
		return recetaService.findRecetaByHorarioComida_HorarioComidaId_AndTiempoComida_TiempoComidaId(horario_comida_id, tiempo_comida_id);
	}
}