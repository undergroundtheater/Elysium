package com.dstevens.characters.clans;

import com.dstevens.characters.PlayerCharacter;
import com.dstevens.characters.traits.ApplicableTrait;
import com.dstevens.characters.traits.Trait;
import com.dstevens.characters.traits.TraitQualities;

public enum Bloodline implements ApplicableTrait, Trait {

	ASSAMITE,
    VIZIER,
	SORCERER,
	
	BRUJAH,
    TRUE_BRUJAH,
    
    FOLLOWER_OF_SET,
    TLACLQUE, 
    VIPER,
    
    GANGREL,
    COYOTE, 
    NOIAD, 
    AHRIMANE,
    
    GIOVANNI,
    PREMASCINE,
    
    LASOMBRA,
    KISAYD,
    
    MALKAVIAN,
    ANANKE,
    KNIGHT_OF_THE_MOON,
    
    NOSFERATU,
    
    TOREADOR,
    ISHTARRI,
    VOLGIRRE,

    TREMERE,
    TELYAV,

    TZIMISCE,
    CARPATHIAN,
    KOLDUN,

    VENTRUE,
    CRUSADER,

    CATIFF,
    
    BAALI,
    ANGELLIS_ATER,

    CAPPADOCIAN,
    SAMEDI,
    LAMIA,
    
    RAVNOS,
    BRAHMAN,                  
    
    SALUBRI,
    HEALER,
    
    DAUGHTER_OF_CACOPHONY,
    
    GARGOYLE;                  
    
	public int id() {
		return 0;
	};
	
	@Override
	public PlayerCharacter applyTo(PlayerCharacter character) {
		return character.withBloodline(this);
	}

	@Override
	public PlayerCharacter removeFrom(PlayerCharacter character) {
		return character.withBloodline(null);
	}

	@Override
	public ApplicableTrait applyWith(TraitQualities qualities) {
		return this;
	}
    
}
