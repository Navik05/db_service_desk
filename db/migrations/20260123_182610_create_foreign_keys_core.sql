-- Migration: create_foreign_keys_core
-- Created: Fri Jan 23 18:26:10     2026

BEGIN;

--
ALTER TABLE sd_core.it_user
    ADD CONSTRAINT fk_user_podr
        FOREIGN KEY (id_podr)
        REFERENCES sd_core.it_podr (id_podr);

--
ALTER TABLE sd_core.it_document
    ADD CONSTRAINT fk_document_new
        FOREIGN KEY (id_new)
        REFERENCES sd_core.it_new (id_new);

--
ALTER TABLE sd_core.it_new
    ADD CONSTRAINT fk_new_service
        FOREIGN KEY (id_service)
        REFERENCES sd_core.it_service (id_service);

--
ALTER TABLE sd_core.it_service
    ADD CONSTRAINT fk_service_service_type
        FOREIGN KEY (id_service_type)
        REFERENCES sd_core.it_service_type (id_service_type),

    ADD CONSTRAINT fk_service_service_state
        FOREIGN KEY (id_service_state)
        REFERENCES sd_core.it_service_state (id_service_state),

    ADD CONSTRAINT fk_service_exp_type
        FOREIGN KEY (id_exp_type)
        REFERENCES sd_core.it_exp_type (id_exp_type),

    ADD CONSTRAINT fk_service_parent
        FOREIGN KEY (id_service_parent)
        REFERENCES sd_core.it_service (id_service)
        ON DELETE CASCADE;

--
ALTER TABLE sd_core.it_group
    ADD CONSTRAINT fk_group_user
        FOREIGN KEY (id_user)
        REFERENCES sd_core.it_user (id_it_user);

--
ALTER TABLE sd_core.it_work
    ADD CONSTRAINT fk_work_catitem
        FOREIGN KEY (id_catitem)
        REFERENCES sd_core.it_catalogitem (id_catitem),

    ADD CONSTRAINT fk_work_service
        FOREIGN KEY (id_service)
        REFERENCES sd_core.it_service (id_service),

    ADD CONSTRAINT fk_work_group
        FOREIGN KEY (id_group)
        REFERENCES sd_core.it_group (id_group),

    ADD CONSTRAINT fk_work_type
        FOREIGN KEY (id_work_type)
        REFERENCES sd_core.it_work_type (id_work_type),

    ADD CONSTRAINT fk_work_podr
        FOREIGN KEY (id_podr)
        REFERENCES sd_core.it_podr (id_podr);

--
ALTER TABLE sd_core.it_catalogitem
    ADD CONSTRAINT fk_catitem_service
        FOREIGN KEY (id_service)
        REFERENCES sd_core.it_service (id_service),

    ADD CONSTRAINT fk_catitem_exp_type
        FOREIGN KEY (id_exp_type)
        REFERENCES sd_core.it_exp_type (id_exp_type),

    ADD CONSTRAINT fk_catitem_effect
        FOREIGN KEY (id_effect)
        REFERENCES sd_core.it_effect (id_effect),

    ADD CONSTRAINT fk_catitem_scale
        FOREIGN KEY (id_scale)
        REFERENCES sd_core.it_scale (id_scale);

--
ALTER TABLE sd_core.it_order
    ADD CONSTRAINT fk_order_type
        FOREIGN KEY (id_order_type)
        REFERENCES sd_core.it_order_type (id_order_type),

    ADD CONSTRAINT fk_order_catitem
        FOREIGN KEY (id_catitem)
        REFERENCES sd_core.it_catalogitem (id_catitem),

    ADD CONSTRAINT fk_order_service
        FOREIGN KEY (id_service)
        REFERENCES sd_core.it_service (id_service),

    ADD CONSTRAINT fk_order_state
        FOREIGN KEY (id_order_state)
        REFERENCES sd_core.it_order_state (id_order_state),

    ADD CONSTRAINT fk_order_priority
        FOREIGN KEY (id_order_priority)
        REFERENCES sd_core.it_order_priority (id_order_priority),

    ADD CONSTRAINT fk_order_user_creator
        FOREIGN KEY (id_user_creator)
        REFERENCES sd_core.it_user (id_it_user),

    ADD CONSTRAINT fk_order_user_initiator
        FOREIGN KEY (id_user_initiator)
        REFERENCES sd_core.it_user (id_it_user),

    ADD CONSTRAINT fk_order_user_dispatcher
        FOREIGN KEY (id_user_dispatcher)
        REFERENCES sd_core.it_user (id_it_user),

    ADD CONSTRAINT fk_order_user_executor
        FOREIGN KEY (id_user_executor)
        REFERENCES sd_core.it_user (id_it_user),

    ADD CONSTRAINT fk_order_source
        FOREIGN KEY (id_order_source)
        REFERENCES sd_core.it_order_source (id_order_source);

--
ALTER TABLE sd_core.it_order_task
    ADD CONSTRAINT fk_order_task_order
        FOREIGN KEY (id_order)
        REFERENCES sd_core.it_order (id_order),

    ADD CONSTRAINT fk_order_task_work
        FOREIGN KEY (id_work)
        REFERENCES sd_core.it_work (id_work),

    ADD CONSTRAINT fk_order_user_executor
        FOREIGN KEY (id_user_executor)
        REFERENCES sd_core.it_user (id_it_user),

    ADD CONSTRAINT fk_order_task_state
        FOREIGN KEY (id_task_state)
        REFERENCES sd_core.it_task_state (id_task_state),

    ADD CONSTRAINT fk_order_user_creator
        FOREIGN KEY (id_user_creator)
        REFERENCES sd_core.it_user (id_it_user);

--
ALTER TABLE sd_core.it_order_message
    ADD CONSTRAINT fk_order_message_order
        FOREIGN KEY (id_order)
        REFERENCES sd_core.it_order (id_order),

    ADD CONSTRAINT fk_order_message_user
        FOREIGN KEY (id_user)
        REFERENCES sd_core.it_user (id_it_user),

    ADD CONSTRAINT fk_order_message_task
        FOREIGN KEY (id_order_task)
        REFERENCES sd_core.it_order_task (id_order_task);

--
ALTER TABLE sd_core.it_order_binding
    ADD CONSTRAINT fk_order_binding_order
        FOREIGN KEY (id_order)
        REFERENCES sd_core.it_order (id_order),

    ADD CONSTRAINT fk_order_binding_user
        FOREIGN KEY (id_user)
        REFERENCES sd_core.it_user (id_it_user);

--
ALTER TABLE sd_core.it_approve
    ADD CONSTRAINT fk_approve_order
        FOREIGN KEY (id_order)
        REFERENCES sd_core.it_order (id_order),
    
    ADD CONSTRAINT fk_approve_user_creator
        FOREIGN KEY (id_user_creator)
        REFERENCES sd_core.it_user (id_it_user);

--
ALTER TABLE sd_core.it_approve_users
    ADD CONSTRAINT fk_approve_users_approve
        FOREIGN KEY (id_approve)
        REFERENCES sd_core.it_approve (id_approve),
    
    ADD CONSTRAINT fk_approve_users_user
        FOREIGN KEY (id_user)
        REFERENCES sd_core.it_user (id_it_user),
    
    ADD CONSTRAINT fk_approve_users_parent
        FOREIGN KEY (id_approve_users_parent)
        REFERENCES sd_core.it_approve_users (id_approve_users)
        ON DELETE CASCADE;

--
ALTER TABLE sd_core.it_catalog_arh_data
    ADD CONSTRAINT fk_catalog_arh_data_arh
        FOREIGN KEY (id_arh)
        REFERENCES sd_core.it_catalog_arh (id_arh);

--
ALTER TABLE sd_core.it_catitem_user_role
    ADD CONSTRAINT fk_catitem_user_role_catitem
        FOREIGN KEY (id_catitem)
        REFERENCES sd_core.it_catalogitem (id_catitem),

    ADD CONSTRAINT fk_catitem_user_role_user
        FOREIGN KEY (id_user)
        REFERENCES sd_core.it_user (id_it_user),

    ADD CONSTRAINT fk_catitem_user_role_podr
        FOREIGN KEY (id_podr)
        REFERENCES sd_core.it_podr (id_podr),
    
    ADD CONSTRAINT fk_catitem_user_role_user_role
        FOREIGN KEY (id_user_role)
        REFERENCES sd_core.it_user_role (id_user_role),
    
    ADD CONSTRAINT fk_catitem_user_role_service
        FOREIGN KEY (id_service)
        REFERENCES sd_core.it_service (id_service);

COMMIT;
