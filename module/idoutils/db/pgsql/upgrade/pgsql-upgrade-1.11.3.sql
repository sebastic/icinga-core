-- -----------------------------------------
-- upgrade path for Icinga IDOUtils 1.11.3
--
-- -----------------------------------------
-- Copyright (c) 2014 Icinga Development Team (http://www.icinga.org)
--
-- Please check http://docs.icinga.org for upgrading information!
-- -----------------------------------------


ALTER TABLE icinga_hosts ADD COLUMN check_service_object_id bigint default NULL;

ALTER TABLE icinga_hostgroups ADD COLUMN notes TEXT default NULL;
ALTER TABLE icinga_hostgroups ADD COLUMN notes_url TEXT default NULL;
ALTER TABLE icinga_hostgroups ADD COLUMN action_url TEXT default NULL;
ALTER TABLE icinga_servicegroups ADD COLUMN notes TEXT default NULL;
ALTER TABLE icinga_servicegroups ADD COLUMN notes_url TEXT default NULL;
ALTER TABLE icinga_servicegroups ADD COLUMN action_url TEXT default NULL;

ALTER TABLE icinga_hoststatus ADD COLUMN is_reachable smallint(6) DEFAULT NULL;
ALTER TABLE icinga_servicestatus ADD COLUMN is_reachable smallint(6) DEFAULT NULL;

-- -----------------------------------------
-- update dbversion
-- -----------------------------------------

SELECT updatedbversion('1.11.3');

