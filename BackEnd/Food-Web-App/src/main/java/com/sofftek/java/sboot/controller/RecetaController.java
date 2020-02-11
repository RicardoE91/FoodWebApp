package com.sofftek.java.sboot.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import com.sofftek.java.sboot.entity.HorarioComida;
import com.sofftek.java.sboot.entity.Receta;
import com.sofftek.java.sboot.entity.TiempoComida;
import com.sofftek.java.sboot.service.RecetaService;

@RestController
@RequestMapping("/recetas")
public class RecetaController {
	@Autowired
	public RecetaService recetaService;
	
	@GetMapping("/todas")
	@ResponseStatus(HttpStatus.OK)
	public List<Receta> findAllRecetas(){
		return recetaService.findAllRecetas();
	}
	
	@GetMapping("/byId/{id}")
	@ResponseStatus(HttpStatus.OK)
	public Receta finRecetaById(@PathVariable("id") Integer receta_id){
		return recetaService.findRecetaById(receta_id);
	}
	
	
	
	@GetMapping(value = "/{horario_comida_id}/{tiempo_comida_id}", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseStatus(HttpStatus.OK)
	public @ResponseBody List<Receta> receta(@RequestParam(value="horario_comida_id") HorarioComida horario_comida_id, @RequestParam(value="tiempo_comida_id") TiempoComida tiempo_comida_id){
		return recetaService.findRecetaByHorarioComidaAndTiempoComida(horario_comida_id, tiempo_comida_id);
	}
//	public List<Receta> findRecetaByHorarioComidaAndTiempoComida(@PathVariable int horario_comida_id, @PathVariable int tiempo_comida_id){
//		System.out.println("****************+++");
//		System.out.println("****************+++");
//		System.out.println("****************+++");
//		System.out.println("****************+++");
//		List<Receta> recetas = recetaService.findRecetaByHorario_Comida_Id_AndTiempo_Comida_Id(horario_comida_id, tiempo_comida_id);
//		System.out.println(recetas.size());
//		System.out.println("****************+++");
//		System.out.println("****************+++");
//		
//		return recetaService.findRecetaByHorario_Comida_Id_AndTiempo_Comida_Id(horario_comida_id, tiempo_comida_id);
//	}
}