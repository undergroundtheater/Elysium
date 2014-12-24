package com.dstevens.characters;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PlayerCharacterRepository {

    private final PlayerCharacterFactory factory;
	private final PlayerCharacterDao dao;

    @Autowired
    public PlayerCharacterRepository(PlayerCharacterDao playerCharacterDao, PlayerCharacterFactory factory) {
        this.dao = playerCharacterDao;
        this.factory = factory;
    }
    
    public PlayerCharacter ensureExists(String name) {
        return createNewCharacterFor(name);
    }

    private PlayerCharacter createNewCharacterFor(String name) {
        return dao.save(factory.createPlayerCharacter(name));
    }

	public void delete(PlayerCharacter pc) {
		dao.delete(pc);
	}

	public PlayerCharacter update(PlayerCharacter pc) {
		return dao.save(pc);
	}
	
	public PlayerCharacter findNamed(String name) {
		return dao.findUndeletedNamed(name);
	}
	
	public Iterable<PlayerCharacter> findAllNamed(String name) {
		return dao.findNamed(name);
	}

	public void hardDelete(PlayerCharacter pc) {
		dao.delete(pc);
	}
}
