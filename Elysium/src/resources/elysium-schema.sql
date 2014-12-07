alter table CharacterBackground_focuses drop foreign key CharacterBackground_focuses_FK;
alter table CharacterSkill_focuses drop foreign key CharacterSkill_focuses_FK;
alter table Merits drop foreign key FK_9k3p7r9j3j79htxbukb5kngky;
alter table Player drop foreign key Troupe_Players_FK;
alter table PlayerCharacter drop foreign key Player_PlayerCharacters_FK;
alter table PlayerCharacter drop foreign key Troupe_PlayerCharacters_FK;
alter table PlayerCharacter_Backgrounds drop foreign key Backgrounds_PlayerCharacter_FK;
alter table PlayerCharacter_Backgrounds drop foreign key PlayerCharacter_Backgrounds_FK;
alter table PlayerCharacter_Disciplines drop foreign key Disciplines_PlayerCharacter_FK;
alter table PlayerCharacter_Disciplines drop foreign key PlayerCharacter_Disciplines_FK;
alter table PlayerCharacter_Flaws drop foreign key Flaws_PlayerCharacter_FK;
alter table PlayerCharacter_Flaws drop foreign key PlayerCharacter_Flaws_FK;
alter table PlayerCharacter_NecromanticPaths drop foreign key NecromanticPaths_PlayerCharacter_FK;
alter table PlayerCharacter_NecromanticPaths drop foreign key PlayerCharacter_NecromanticPaths_FK;
alter table PlayerCharacter_Skills drop foreign key Skills_PlayerCharacter_FK;
alter table PlayerCharacter_Skills drop foreign key PlayerCharacter_Skills_FK;
alter table PlayerCharacter_ThaumaturgicalPaths drop foreign key ThaumaturgicalPaths_PlayerCharacter_FK;
alter table PlayerCharacter_ThaumaturgicalPaths drop foreign key PlayerCharacter_ThaumaturgicalPaths_FK;
alter table PlayerCharacter_TraitChanges drop foreign key TraitChanges_PlayerCharacter_FK;
alter table PlayerCharacter_TraitChanges drop foreign key PlayerCharacter_TraitChanges_FK;
alter table PlayerCharacter_elderPowers drop foreign key PlayerCharacter_ElderPowers_FK;
alter table PlayerCharacter_inClanDisciplines drop foreign key PlayerCharacter_InClanDisciplines_FK;
alter table PlayerCharacter_inClanNecromanticPaths drop foreign key PlayerCharacter_InClanNecromanticPaths_FK;
alter table PlayerCharacter_inClanThaumaturgicalPaths drop foreign key PlayerCharacter_InClanThaumaturgicalPaths_FK;
alter table PlayerCharacter_mentalAttrbuteFocuses drop foreign key PlayerCharacter_MentalAttributeFocuses_FK;
alter table PlayerCharacter_necromanticRituals drop foreign key PlayerCharacter_CharacterNecromanticRituals_FK;
alter table PlayerCharacter_physicalAttributeFocuses drop foreign key PlayerCharacter_PhysicalAttributeFocuses_FK;
alter table PlayerCharacter_socialAttributeFocuses drop foreign key PlayerCharacter_SocialAttributeFocuses_FK;
alter table PlayerCharacter_techniques drop foreign key PlayerCharacter_Techniques_FK;
alter table PlayerCharacter_thaumaturgicalRituals drop foreign key PlayerCharacter_CharacterThaumaturgicalRituals_FK;
alter table TraitChanges drop foreign key TraitChange_ChildTraitChange_FK;
alter table TraitChanges drop foreign key TraitChange_TraitToRemove_FK;
drop table if exists AttributeValue;
drop table if exists AuditEvent;
drop table if exists Backgrounds;
drop table if exists CharacterBackground_focuses;
drop table if exists CharacterSkill_focuses;
drop table if exists Disciplines;
drop table if exists Experience;
drop table if exists Flaws;
drop table if exists Merits;
drop table if exists NecromanticPaths;
drop table if exists Player;
drop table if exists PlayerCharacter;
drop table if exists PlayerCharacter_Backgrounds;
drop table if exists PlayerCharacter_Disciplines;
drop table if exists PlayerCharacter_Flaws;
drop table if exists PlayerCharacter_NecromanticPaths;
drop table if exists PlayerCharacter_Skills;
drop table if exists PlayerCharacter_ThaumaturgicalPaths;
drop table if exists PlayerCharacter_TraitChanges;
drop table if exists PlayerCharacter_elderPowers;
drop table if exists PlayerCharacter_inClanDisciplines;
drop table if exists PlayerCharacter_inClanNecromanticPaths;
drop table if exists PlayerCharacter_inClanThaumaturgicalPaths;
drop table if exists PlayerCharacter_mentalAttrbuteFocuses;
drop table if exists PlayerCharacter_necromanticRituals;
drop table if exists PlayerCharacter_physicalAttributeFocuses;
drop table if exists PlayerCharacter_socialAttributeFocuses;
drop table if exists PlayerCharacter_techniques;
drop table if exists PlayerCharacter_thaumaturgicalRituals;
drop table if exists Skills;
drop table if exists ThaumaturgicalPaths;
drop table if exists TraitChanges;
drop table if exists Troupe;
create table AttributeValue (attribute_type varchar(31) not null, id varchar(255) not null, value integer, primary key (id));
create table AuditEvent (id varchar(255) not null, audit_message varchar(255), audited_type varchar(255), audited_id varchar(255), timestamp datetime, primary key (id));
create table Backgrounds (id varchar(255) not null, rating integer, specialization varchar(255), background integer, primary key (id));
create table CharacterBackground_focuses (CharacterBackground_id varchar(255) not null, focuses varchar(255));
create table CharacterSkill_focuses (CharacterSkill_id varchar(255) not null, focuses varchar(255));
create table Disciplines (id varchar(255) not null, rating integer, trait integer not null, primary key (id));
create table Experience (experience_type varchar(31) not null, id varchar(255) not null, xp integer, primary key (id));
create table Flaws (id varchar(255) not null, specialization varchar(255), trait integer not null, primary key (id));
create table Merits (id varchar(255) not null, specialization varchar(255), trait integer not null, character_id varchar(255), primary key (id));
create table NecromanticPaths (id varchar(255) not null, rating integer, trait integer not null, primary key (id));
create table Player (id varchar(255) not null, deleted_at datetime, email varchar(255), name varchar(255), troupe_id varchar(255), primary key (id));
create table PlayerCharacter (id varchar(255) not null, bloodline integer, clan integer, deleted_at datetime, mental_attribute integer, name varchar(255), physical_attribute integer, primary_necromantic_path integer, primary_thaumaturgical_path integer, social_attribute integer, xp integer, player_id varchar(255), troupe_id varchar(255), primary key (id));
create table PlayerCharacter_Backgrounds (PlayerCharacter_id varchar(255) not null, backgrounds_id varchar(255) not null, primary key (PlayerCharacter_id, backgrounds_id));
create table PlayerCharacter_Disciplines (PlayerCharacter_id varchar(255) not null, disciplines_id varchar(255) not null, primary key (PlayerCharacter_id, disciplines_id));
create table PlayerCharacter_Flaws (PlayerCharacter_id varchar(255) not null, flaws_id varchar(255) not null, primary key (PlayerCharacter_id, flaws_id));
create table PlayerCharacter_NecromanticPaths (PlayerCharacter_id varchar(255) not null, necromanticPaths_id varchar(255) not null, primary key (PlayerCharacter_id, necromanticPaths_id));
create table PlayerCharacter_Skills (PlayerCharacter_id varchar(255) not null, skills_id varchar(255) not null, primary key (PlayerCharacter_id, skills_id));
create table PlayerCharacter_ThaumaturgicalPaths (PlayerCharacter_id varchar(255) not null, thaumaturgicalPaths_id varchar(255) not null, primary key (PlayerCharacter_id, thaumaturgicalPaths_id));
create table PlayerCharacter_TraitChanges (PlayerCharacter_id varchar(255) not null, traitChangeEvents_id varchar(255) not null, order_by integer not null, primary key (PlayerCharacter_id, order_by));
create table PlayerCharacter_elderPowers (PlayerCharacter_id varchar(255) not null, elderPowers integer);
create table PlayerCharacter_inClanDisciplines (PlayerCharacter_id varchar(255) not null, inClanDisciplines integer);
create table PlayerCharacter_inClanNecromanticPaths (PlayerCharacter_id varchar(255) not null, inClanNecromanticPaths integer);
create table PlayerCharacter_inClanThaumaturgicalPaths (PlayerCharacter_id varchar(255) not null, inClanThaumaturgicalPaths integer);
create table PlayerCharacter_mentalAttrbuteFocuses (PlayerCharacter_id varchar(255) not null, mentalAttrbuteFocuses integer);
create table PlayerCharacter_necromanticRituals (PlayerCharacter_id varchar(255) not null, necromanticRituals integer);
create table PlayerCharacter_physicalAttributeFocuses (PlayerCharacter_id varchar(255) not null, physicalAttributeFocuses integer);
create table PlayerCharacter_socialAttributeFocuses (PlayerCharacter_id varchar(255) not null, socialAttributeFocuses integer);
create table PlayerCharacter_techniques (PlayerCharacter_id varchar(255) not null, techniques integer);
create table PlayerCharacter_thaumaturgicalRituals (PlayerCharacter_id varchar(255) not null, thaumaturgicalRituals integer);
create table Skills (id varchar(255) not null, rating integer, specialization varchar(255), skill integer, primary key (id));
create table ThaumaturgicalPaths (id varchar(255) not null, rating integer, trait integer not null, primary key (id));
create table TraitChanges (trait_change_type varchar(31) not null, id varchar(255) not null, status integer, applicable_trait_ordinal integer, child_id varchar(255), traitToRemove_id varchar(255), applicable_trait_id varchar(255), primary key (id));
create table Troupe (id varchar(255) not null, deleted_at datetime, name varchar(255), setting integer, primary key (id));
alter table PlayerCharacter_Backgrounds add constraint PlayerCharacter_Backgrounds_UC  unique (backgrounds_id);
alter table PlayerCharacter_Disciplines add constraint PlayerCharacter_Disciplines_UC  unique (disciplines_id);
alter table PlayerCharacter_Flaws add constraint PlayerCharacter_Flaws_UC  unique (flaws_id);
alter table PlayerCharacter_NecromanticPaths add constraint PlayerCharacter_NecromanticPaths_UC  unique (necromanticPaths_id);
alter table PlayerCharacter_Skills add constraint PlayerCharacter_Skills_UC  unique (skills_id);
alter table PlayerCharacter_ThaumaturgicalPaths add constraint PlayerCharacter_ThaumaturgicalPaths_UC  unique (thaumaturgicalPaths_id);
alter table PlayerCharacter_TraitChanges add constraint PlayerCharacter_TraitChanges_UC  unique (traitChangeEvents_id);
alter table CharacterBackground_focuses add constraint CharacterBackground_focuses_FK foreign key (CharacterBackground_id) references Backgrounds (id);
alter table CharacterSkill_focuses add constraint CharacterSkill_focuses_FK foreign key (CharacterSkill_id) references Skills (id);
alter table Merits add constraint FK_9k3p7r9j3j79htxbukb5kngky foreign key (character_id) references PlayerCharacter (id);
alter table Player add constraint Troupe_Players_FK foreign key (troupe_id) references Troupe (id);
alter table PlayerCharacter add constraint Player_PlayerCharacters_FK foreign key (player_id) references Player (id);
alter table PlayerCharacter add constraint Troupe_PlayerCharacters_FK foreign key (troupe_id) references Troupe (id);
alter table PlayerCharacter_Backgrounds add constraint Backgrounds_PlayerCharacter_FK foreign key (backgrounds_id) references Backgrounds (id);
alter table PlayerCharacter_Backgrounds add constraint PlayerCharacter_Backgrounds_FK foreign key (PlayerCharacter_id) references PlayerCharacter (id);
alter table PlayerCharacter_Disciplines add constraint Disciplines_PlayerCharacter_FK foreign key (disciplines_id) references Disciplines (id);
alter table PlayerCharacter_Disciplines add constraint PlayerCharacter_Disciplines_FK foreign key (PlayerCharacter_id) references PlayerCharacter (id);
alter table PlayerCharacter_Flaws add constraint Flaws_PlayerCharacter_FK foreign key (flaws_id) references Flaws (id);
alter table PlayerCharacter_Flaws add constraint PlayerCharacter_Flaws_FK foreign key (PlayerCharacter_id) references PlayerCharacter (id);
alter table PlayerCharacter_NecromanticPaths add constraint NecromanticPaths_PlayerCharacter_FK foreign key (necromanticPaths_id) references NecromanticPaths (id);
alter table PlayerCharacter_NecromanticPaths add constraint PlayerCharacter_NecromanticPaths_FK foreign key (PlayerCharacter_id) references PlayerCharacter (id);
alter table PlayerCharacter_Skills add constraint Skills_PlayerCharacter_FK foreign key (skills_id) references Skills (id);
alter table PlayerCharacter_Skills add constraint PlayerCharacter_Skills_FK foreign key (PlayerCharacter_id) references PlayerCharacter (id);
alter table PlayerCharacter_ThaumaturgicalPaths add constraint ThaumaturgicalPaths_PlayerCharacter_FK foreign key (thaumaturgicalPaths_id) references ThaumaturgicalPaths (id);
alter table PlayerCharacter_ThaumaturgicalPaths add constraint PlayerCharacter_ThaumaturgicalPaths_FK foreign key (PlayerCharacter_id) references PlayerCharacter (id);
alter table PlayerCharacter_TraitChanges add constraint TraitChanges_PlayerCharacter_FK foreign key (traitChangeEvents_id) references TraitChanges (id);
alter table PlayerCharacter_TraitChanges add constraint PlayerCharacter_TraitChanges_FK foreign key (PlayerCharacter_id) references PlayerCharacter (id);
alter table PlayerCharacter_elderPowers add constraint PlayerCharacter_ElderPowers_FK foreign key (PlayerCharacter_id) references PlayerCharacter (id);
alter table PlayerCharacter_inClanDisciplines add constraint PlayerCharacter_InClanDisciplines_FK foreign key (PlayerCharacter_id) references PlayerCharacter (id);
alter table PlayerCharacter_inClanNecromanticPaths add constraint PlayerCharacter_InClanNecromanticPaths_FK foreign key (PlayerCharacter_id) references PlayerCharacter (id);
alter table PlayerCharacter_inClanThaumaturgicalPaths add constraint PlayerCharacter_InClanThaumaturgicalPaths_FK foreign key (PlayerCharacter_id) references PlayerCharacter (id);
alter table PlayerCharacter_mentalAttrbuteFocuses add constraint PlayerCharacter_MentalAttributeFocuses_FK foreign key (PlayerCharacter_id) references PlayerCharacter (id);
alter table PlayerCharacter_necromanticRituals add constraint PlayerCharacter_CharacterNecromanticRituals_FK foreign key (PlayerCharacter_id) references PlayerCharacter (id);
alter table PlayerCharacter_physicalAttributeFocuses add constraint PlayerCharacter_PhysicalAttributeFocuses_FK foreign key (PlayerCharacter_id) references PlayerCharacter (id);
alter table PlayerCharacter_socialAttributeFocuses add constraint PlayerCharacter_SocialAttributeFocuses_FK foreign key (PlayerCharacter_id) references PlayerCharacter (id);
alter table PlayerCharacter_techniques add constraint PlayerCharacter_Techniques_FK foreign key (PlayerCharacter_id) references PlayerCharacter (id);
alter table PlayerCharacter_thaumaturgicalRituals add constraint PlayerCharacter_CharacterThaumaturgicalRituals_FK foreign key (PlayerCharacter_id) references PlayerCharacter (id);
alter table TraitChanges add constraint TraitChange_ChildTraitChange_FK foreign key (child_id) references TraitChanges (id);
alter table TraitChanges add constraint TraitChange_TraitToRemove_FK foreign key (traitToRemove_id) references TraitChanges (id);
