package com.nate.dojosandninjas.controllers;

import java.util.List;

import javax.validation.Valid;

import com.nate.dojosandninjas.models.Dojo;
import com.nate.dojosandninjas.models.Ninja;
import com.nate.dojosandninjas.services.DojoService;
import com.nate.dojosandninjas.services.NinjaService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class MainController {

	@Autowired
	NinjaService ninjaService;

	@Autowired
	DojoService dojoService;

	// ------------------ Retrieve All / Create One ----------------- //
	@GetMapping("/ninjas/new")
	public String ninjaIndex(@ModelAttribute("ninja") Ninja ninja, Model model) {
		List<Dojo> dojos = dojoService.allDojos();
		model.addAttribute("dojos", dojos);
		return "new_ninja.jsp";
	}

	// Submit new
	@PostMapping("/ninjas/submit")
	public String create(@Valid @ModelAttribute("ninja") Ninja ninja, BindingResult result, Model model) {
		if (result.hasErrors()) {
			List<Ninja> ninjas = ninjaService.allNinjas();
			List<Dojo> dojos = dojoService.allDojos();
			model.addAttribute("dojos", dojos);
			model.addAttribute("ninjas", ninjas);
			return "new_ninja.jsp";
		} else {
			ninjaService.createNinja(ninja);
			return "redirect:/ninjas/new";
		}
	}

	// ------------------ Retrieve One ----------------- //
	@GetMapping("/ninjas/{id}")
	public String show(Model model, @PathVariable("id") Long id) {
		Ninja ninja = ninjaService.findNinja(id);
		model.addAttribute("ninja", ninja);
		return "show.jsp";
	}

	// Dojos ----------------------------------------------------------------
	@RequestMapping("/")
	public String home(){
		return "redirect:/dojos/new";
	}

	@GetMapping("/dojos/new")
	public String dojoIndex(@ModelAttribute("dojo") Dojo dojo) {
		return "new_dojo.jsp";
	}

	@PostMapping("/dojos/submit")
	public String createDojo(@Valid @ModelAttribute("dojo") Dojo dojo, BindingResult result, Model model) {
		if (result.hasErrors()) {
			return "new_dojo.jsp";
		} else {
			dojoService.createDojo(dojo);
			return "redirect:/ninjas/new";
		}
	}

	@GetMapping("/dojos/{dojo_id}")
	public String showNinjasInDojo(Model model, @PathVariable Long dojo_id) {
		Dojo dojo = dojoService.findDojo(dojo_id);
		model.addAttribute("dojo", dojo);
		return "showNinjas.jsp";
	}
}
