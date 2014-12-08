package com.dstevens.characters.traits.powers.magic.thaumaturgy;

import com.dstevens.characters.PlayerCharacter;
import com.dstevens.characters.traits.changes.TraitChange;
import com.dstevens.characters.traits.changes.TraitChangeStatus;
import com.dstevens.characters.traits.powers.Power;

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
	public PlayerCharacter applyTo(PlayerCharacter character) {
		return character.withInClanDiscipline(this);
	}
	
	@Override
	public PlayerCharacter removeFrom(PlayerCharacter character) {
		return character.withoutInClanDiscipline(this);
	}
	
	@Override
	public TraitChange set(TraitChangeStatus status) {
		return new SetInClanThaumaturgy(status, this.ordinal());
	}
	
	@Override
	public TraitChange set(TraitChangeStatus status, int rating) {
		return new SetThaumaturgy(status, this.ordinal(), rating);
	}
}