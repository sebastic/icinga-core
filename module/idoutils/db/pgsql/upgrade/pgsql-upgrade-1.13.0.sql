-- -----------------------------------------
-- upgrade path for Icinga 1.13.0
--
-- -----------------------------------------
-- Copyright (c) 2015 Icinga Development Team (http://www.icinga.org)
--
-- Please check http://docs.icinga.org for upgrading information!
-- -----------------------------------------

-- -----------------------------------------
-- #7765 drop unique constraint
-- -----------------------------------------

ALTER TABLE icinga_servicedependencies DROP CONSTRAINT uq_servicedependencies;
ALTER TABLE icinga_hostdependencies DROP CONSTRAINT uq_hostdependencies;

CREATE INDEX idx_servicedependencies ON icinga_servicedependencies(instance_id,config_type,service_object_id,dependent_service_object_id,dependency_type,inherits_parent,fail_on_ok,fail_on_warning,fail_on_unknown,fail_on_critical);
CREATE INDEX idx_hostdependencies ON icinga_hostdependencies(instance_id,config_type,host_object_id,dependent_host_object_id,dependency_type,inherits_parent,fail_on_up,fail_on_down,fail_on_unreachable);


-- -----------------------------------------
-- update dbversion
-- -----------------------------------------

SELECT updatedbversion('1.13.0');

