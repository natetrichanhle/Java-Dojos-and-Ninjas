package com.nate.dojosandninjas.services;

import java.util.List;
import java.util.Optional;

import com.nate.dojosandninjas.models.Ninja;
import com.nate.dojosandninjas.repositories.NinjaRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class NinjaService {

	@Autowired
	NinjaRepository ninjaRepository;

	// returns all the ninjas
	public List<Ninja> allNinjas() {
		return ninjaRepository.findAll();
	}

	// creates a ninja
	public Ninja createNinja(Ninja b) {
		return ninjaRepository.save(b);
	}

	// retrieves a ninja
	public Ninja findNinja(Long id) {
		Optional<Ninja> optionalNinja = ninjaRepository.findById(id);
		if (optionalNinja.isPresent()) {
			return optionalNinja.get();
		} else {
			return null;
		}
	}

	public Ninja updateNinja(Ninja ninja, Long id) {
		Optional<Ninja> optionalNinja = ninjaRepository.findById(id);
		if(optionalNinja.isPresent()) {
			return ninjaRepository.save(ninja);
		} else {
			return null;
		}
	}

	public void deleteNinja(Long id) {
		Optional<Ninja> optionalNinja = ninjaRepository.findById(id);
		if(optionalNinja.isPresent()) {
			ninjaRepository.deleteById(id);			
		}
	}
}

