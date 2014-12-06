package com.dstevens.characters.traits.powers;

import com.dstevens.characters.PlayerCharacter;

public enum Thaumaturgy implements Power<Thaumaturgy> {

    PATH_OF_BLOOD,
    PATH_OF_CONJURING,
    PATH_OF_CORRUPTION,
    PATH_OF_ELEMENTAL_MASTERY,
    LURE_OF_FLAMES,
    MOVEMENT_OF_THE_MIND,
    PATH_OF_TECHNOMANCY,
    PATH_OF_WEATHER_MASTERY;
    
	@Override
	public Thaumaturgy trait() {
		return this;
	}

	@Override
	public PlayerCharacter applyTo(PlayerCharacter character) {
		return character.withInClanDiscipline(this);
	}
	
	@Override
	public PlayerCharacter removeFrom(PlayerCharacter character) {
		return character.withoutInClanDiscipline(this);
	}
    
}