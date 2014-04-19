alter table PhysicalAttributeFocus drop foreign key FK_dl819kw7t9nxad92pj55meseh;
alter table PlayerCharacter drop foreign key FK_1wbxymbhm40bq5goo5laqy756;
alter table PlayerCharacter drop foreign key FK_2tvilr6gkaifhe9fei568ij7b;
alter table TroupePlayers drop foreign key FK_jp8wcfbseex1hvlwwm8ig7y2i;
alter table TroupePlayers drop foreign key FK_hqwwgbic7k81k6tmmowmmsu6f;
drop table if exists AuditEvent;
drop table if exists PhysicalAttribute;
drop table if exists PhysicalAttributeFocus;
drop table if exists Player;
drop table if exists PlayerCharacter;
drop table if exists Troupe;
drop table if exists TroupePlayers;
create table AuditEvent (id varchar(255) not null, audit_message varchar(255), audited_type varchar(255), audited_id varchar(255), timestamp datetime, primary key (id));
create table PhysicalAttribute (character_id varchar(255) not null, rating integer, primary key (character_id));
create table PhysicalAttributeFocus (character_id varchar(255) not null, focuses integer);
create table Player (id varchar(255) not null, deleted_at datetime, email varchar(255), name varchar(255), primary key (id));
create table PlayerCharacter (id varchar(255) not null, deleted_at datetime, name varchar(255), player_id varchar(255), troupe_id varchar(255), primary key (id));
create table Troupe (id varchar(255) not null, deleted_at datetime, name varchar(255), setting integer, primary key (id));
create table TroupePlayers (player_id varchar(255) not null, troupe_id varchar(255) not null, primary key (troupe_id, player_id));
alter table PhysicalAttributeFocus add constraint FK_dl819kw7t9nxad92pj55meseh foreign key (character_id) references PhysicalAttribute (character_id);
alter table PlayerCharacter add constraint FK_1wbxymbhm40bq5goo5laqy756 foreign key (player_id) references Player (id);
alter table PlayerCharacter add constraint FK_2tvilr6gkaifhe9fei568ij7b foreign key (troupe_id) references Troupe (id);
alter table TroupePlayers add constraint FK_jp8wcfbseex1hvlwwm8ig7y2i foreign key (troupe_id) references Troupe (id);
alter table TroupePlayers add constraint FK_hqwwgbic7k81k6tmmowmmsu6f foreign key (player_id) references Player (id);
