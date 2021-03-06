package com.dstevens.character.trait.skill;

import com.dstevens.character.trait.ApplicableTrait;
import com.dstevens.character.trait.DetailLevel;
import com.dstevens.character.trait.Trait;
import com.dstevens.character.trait.TraitQualities;

public enum Skill implements Trait {
    
    ACADEMICS(0, DetailLevel.REQUIRES_FOCUS),
    ANIMAL_KEN(1),
    ATHLETICS(2),
    AWARENESS(3),
    BRAWL(4),
    COMPUTER(5),
    CRAFTS(6, DetailLevel.REQUIRES_SPECIALIZATION),
    DODGE(7, DetailLevel.REQUIRES_FOCUS),
    DRIVE(8),
    EMPATHY(9),
    FIREARMS(10),
    INTIMIDATION(11),
    INVESTIGATION(12),
    LEADERSHIP(13),
    LINGUISTICS(14, DetailLevel.REQUIRES_FOCUS),
    LORE(15, DetailLevel.REQUIRES_FOCUS),
    MEDICINE(16),
    MELEE(17),
    OCCULT(18),
    PERFORMANCE(19, DetailLevel.REQUIRES_SPECIALIZATION),
    SCIENCE(20, DetailLevel.REQUIRES_SPECIALIZATION),
    SECURITY(21),
    STEALTH(22),
    STREETWISE(23),
    SUBTERFUGE(24),
    SURVIVAL(25);
    
    private final int id;
    private final DetailLevel detailLevel;

    private Skill(int id) {
        this(id, DetailLevel.NONE);
    }
    
    private Skill(int id, DetailLevel detailLevel) {
        this.id = id;
		this.detailLevel = detailLevel;
    }
    
	@Override
	public Integer getId() {
		return id;
	}
    
    public DetailLevel detailLevel() {
    	return detailLevel;
    }
    
    public ApplicableTrait applyWith(TraitQualities qualities) {
    	return new CharacterSkill(this, qualities.rating, qualities.specialization, qualities.focuses);
    }
}
