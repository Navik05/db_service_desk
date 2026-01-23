-- Migration: create_foreign_keys_reference
-- Created: Fri Jan 23 19:12:07     2026

BEGIN;

--
ALTER TABLE sd_reference.it_podr
    ADD CONSTRAINT fk_podr_parent
        FOREIGN KEY (id_podr_parent)
        REFERENCES sd_reference.it_podr (id_podr);

--
ALTER TABLE sd_reference.it_role
    ADD CONSTRAINT fk_role_function
        FOREIGN KEY (id_function)
        REFERENCES sd_reference.it_function (id_function);

--
ALTER TABLE sd_reference.it_sklad
    ADD CONSTRAINT fk_sklad_podr
        FOREIGN KEY (id_podr)
        REFERENCES sd_reference.it_podr (id_podr);

--
ALTER TABLE sd_reference.it_function
ADD CONSTRAINT fk_function_service
    FOREIGN KEY (id_service)
    REFERENCES sd_core.it_service (id_service);

--
ALTER TABLE sd_reference.it_operation
    ADD CONSTRAINT fk_operation_function
        FOREIGN KEY (id_function)
        REFERENCES sd_reference.it_function (id_function);

--
ALTER TABLE sd_reference.it_menu
    ADD CONSTRAINT fk_menu_function
        FOREIGN KEY (id_function)
        REFERENCES sd_reference.it_function (id_function);

COMMIT;
