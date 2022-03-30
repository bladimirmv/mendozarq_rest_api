use mendozarq;

CREATE PROCEDURE usuario_procedure(
    IN operacion CHAR(1),
    IN creadoEn TIMESTAMP,
    IN creadoPor TEXT,
    IN uuidCreadoPor TEXT,
    IN hostname TEXT,
    IN uuidRow varchar(100)
)
BEGIN
    INSERT INTO log_usuario(operacion,
                            creadoEn,
                            creadoPor,
                            uuidCreadoPor,
                            hostname,
                            uuidRow)
    SELECT operacion,
           creadoEn,
           creadoPor,
           uuidCreadoPor,
           hostname,
           uuidRow;
END;


CREATE TRIGGER insert_usuario_trigger
    AFTER
        INSERT
    ON usuario
    FOR EACH ROW
BEGIN
    CALL usuario_procedure(
            'I',
            CURRENT_TIMESTAMP,
            @creadoPor,
            @uuidCreadoPor,
            @@hostname,
            NEW.uuid
        );

    set @uuidCreadoPor = '', @creadoPor = '';
END;

CREATE TRIGGER update_usuario_trigger
    AFTER
        UPDATE
    ON usuario
    FOR EACH ROW
BEGIN
    CALL usuario_procedure(
            'U',
            CURRENT_TIMESTAMP,
            @creadoPor,
            @uuidCreadoPor,
            @@hostname,
            NEW.uuid
        );
    set @uuidCreadoPor = '', @creadoPor = '';
END;


CREATE TRIGGER delete_usuario_trigger
    AFTER
        delete
    ON usuario
    FOR EACH ROW
BEGIN
    CALL usuario_procedure(
            'D',
            CURRENT_TIMESTAMP,
            @creadoPor,
            @uuidCreadoPor,
            @@hostname,
            OLD.uuid
        );

    set @uuidCreadoPor = '', @creadoPor = '';
END;


# PERSONAL

CREATE PROCEDURE personal_procedure(
    IN operacion CHAR(1),
    IN creadoEn TIMESTAMP,
    IN creadoPor TEXT,
    IN uuidCreadoPor TEXT,
    IN hostname TEXT,
    IN uuidRow varchar(100)
)
BEGIN
    INSERT INTO log_personal(operacion,
                             creadoEn,
                             creadoPor,
                             uuidCreadoPor,
                             hostname,
                             uuidRow)
    SELECT operacion,
           creadoEn,
           creadoPor,
           uuidCreadoPor,
           hostname,
           uuidRow;
END;

CREATE TRIGGER insert_personal_trigger
    AFTER
        INSERT
    ON personal
    FOR EACH ROW
BEGIN
    CALL personal_procedure(
            'I',
            CURRENT_TIMESTAMP,
            @creadoPor,
            @uuidCreadoPor,
            @@hostname,
            NEW.uuid
        );

    set @uuidCreadoPor = '', @creadoPor = '';
END;

CREATE TRIGGER update_personal_trigger
    AFTER
        UPDATE
    ON personal
    FOR EACH ROW
BEGIN
    CALL personal_procedure(
            'U',
            CURRENT_TIMESTAMP,
            @creadoPor,
            @uuidCreadoPor,
            @@hostname,
            NEW.uuid
        );
    set @uuidCreadoPor = '', @creadoPor = '';
END;


CREATE TRIGGER delete_personal_trigger
    AFTER
        delete
    ON personal
    FOR EACH ROW
BEGIN
    CALL personal_procedure(
            'D',
            CURRENT_TIMESTAMP,
            @creadoPor,
            @uuidCreadoPor,
            @@hostname,
            OLD.uuid
        );

    set @uuidCreadoPor = '', @creadoPor = '';
END;


# PROYECTO

CREATE PROCEDURE proyecto_procedure(
    IN operacion CHAR(1),
    IN creadoEn TIMESTAMP,
    IN creadoPor TEXT,
    IN uuidCreadoPor TEXT,
    IN hostname TEXT,
    IN uuidRow varchar(100)
)
BEGIN
    INSERT INTO log_proyecto (operacion,
                              creadoEn,
                              creadoPor,
                              uuidCreadoPor,
                              hostname,
                              uuidRow)
    SELECT operacion,
           creadoEn,
           creadoPor,
           uuidCreadoPor,
           hostname,
           uuidRow;
END;

CREATE TRIGGER insert_proyecto_trigger
    AFTER
        INSERT
    ON proyecto
    FOR EACH ROW
BEGIN
    CALL proyecto_procedure(
            'I',
            CURRENT_TIMESTAMP,
            @creadoPor,
            @uuidCreadoPor,
            @@hostname,
            NEW.uuid
        );

    set @uuidCreadoPor = '', @creadoPor = '';
END;

CREATE TRIGGER update_proyecto_trigger
    AFTER
        UPDATE
    ON proyecto
    FOR EACH ROW
BEGIN
    CALL proyecto_procedure(
            'U',
            CURRENT_TIMESTAMP,
            @creadoPor,
            @uuidCreadoPor,
            @@hostname,
            NEW.uuid
        );
    set @uuidCreadoPor = '', @creadoPor = '';
END;


CREATE TRIGGER delete_proyecto_trigger
    AFTER
        delete
    ON proyecto
    FOR EACH ROW
BEGIN
    CALL proyecto_procedure(
            'D',
            CURRENT_TIMESTAMP,
            @creadoPor,
            @uuidCreadoPor,
            @@hostname,
            OLD.uuid
        );

    set @uuidCreadoPor = '', @creadoPor = '';
END;


#DOCUMENTOS

CREATE PROCEDURE documentos_procedure(
    IN operacion CHAR(1),
    IN creadoEn TIMESTAMP,
    IN creadoPor TEXT,
    IN uuidCreadoPor TEXT,
    IN hostname TEXT,
    IN uuidRow varchar(100)
)
BEGIN
    INSERT INTO log_documentos (operacion,
                                creadoEn,
                                creadoPor,
                                uuidCreadoPor,
                                hostname,
                                uuidRow)
    SELECT operacion,
           creadoEn,
           creadoPor,
           uuidCreadoPor,
           hostname,
           uuidRow;
END;

CREATE TRIGGER insert_documentos_trigger
    AFTER
        INSERT
    ON documentoproyecto
    FOR EACH ROW
BEGIN
    CALL documentos_procedure(
            'I',
            CURRENT_TIMESTAMP,
            @creadoPor,
            @uuidCreadoPor,
            @@hostname,
            NEW.uuid
        );

    set @uuidCreadoPor = '', @creadoPor = '';
END;

CREATE TRIGGER update_documentos_trigger
    AFTER
        UPDATE
    ON documentoproyecto
    FOR EACH ROW
BEGIN
    CALL documentos_procedure(
            'U',
            CURRENT_TIMESTAMP,
            @creadoPor,
            @uuidCreadoPor,
            @@hostname,
            NEW.uuid
        );
    set @uuidCreadoPor = '', @creadoPor = '';
END;


CREATE TRIGGER delete_documentos_trigger
    AFTER
        delete
    ON documentoproyecto
    FOR EACH ROW
BEGIN
    CALL documentos_procedure(
            'D',
            CURRENT_TIMESTAMP,
            @creadoPor,
            @uuidCreadoPor,
            @@hostname,
            OLD.uuid
        );

    set @uuidCreadoPor = '', @creadoPor = '';
END;



#producto
CREATE PROCEDURE producto_procedure(
    IN operacion CHAR(1),
    IN creadoEn TIMESTAMP,
    IN creadoPor TEXT,
    IN uuidCreadoPor TEXT,
    IN hostname TEXT,
    IN uuidRow varchar(100)
)
BEGIN
    INSERT INTO log_producto (operacion,
                              creadoEn,
                              creadoPor,
                              uuidCreadoPor,
                              hostname,
                              uuidRow)
    SELECT operacion,
           creadoEn,
           creadoPor,
           uuidCreadoPor,
           hostname,
           uuidRow;
END;

CREATE TRIGGER insert_producto_trigger
    AFTER
        INSERT
    ON producto
    FOR EACH ROW
BEGIN
    CALL producto_procedure(
            'I',
            CURRENT_TIMESTAMP,
            @creadoPor,
            @uuidCreadoPor,
            @@hostname,
            NEW.uuid
        );

    set @uuidCreadoPor = '', @creadoPor = '';
END;

CREATE TRIGGER update_producto_trigger
    AFTER
        UPDATE
    ON producto
    FOR EACH ROW
BEGIN
    CALL producto_procedure(
            'U',
            CURRENT_TIMESTAMP,
            @creadoPor,
            @uuidCreadoPor,
            @@hostname,
            NEW.uuid
        );
    set @uuidCreadoPor = '', @creadoPor = '';
END;


CREATE TRIGGER delete_prodducto_trigger
    AFTER
        delete
    ON producto
    FOR EACH ROW
BEGIN
    CALL producto_procedure(
            'D',
            CURRENT_TIMESTAMP,
            @creadoPor,
            @uuidCreadoPor,
            @@hostname,
            OLD.uuid
        );

    set @uuidCreadoPor = '', @creadoPor = '';
END;


# =============================== trigger ventas

CREATE TRIGGER insert_conceptoVenta_trigger
    AFTER
        INSERT
    ON conceptoVenta
    FOR EACH ROW
BEGIN
    UPDATE producto AS p
        INNER JOIN conceptoventa c on p.uuid = c.uuidProducto
        INNER JOIN venta v on c.uuidVenta = v.uuid
    SET p.stock = p.stock - NEW.cantidad
    WHERE p.uuid = NEW.uuidProducto
      AND v.estado != 'pendiente' AND v.estado!= 'pagando' AND NEW.uuid = c.uuid;
END;

drop trigger insert_conceptoVenta_trigger;




CREATE TRIGGER delete_venta_trigger
    BEFORE
        DELETE
    ON venta
    FOR EACH ROW
BEGIN
    UPDATE producto AS p INNER JOIN conceptoventa c on p.uuid = c.uuidProducto
    INNER JOIN venta v on c.uuidVenta = v.uuid
    SET p.stock = p.stock + c.cantidad
    WHERE c.uuidVenta = OLD.uuid AND v.estado != 'pendiente' AND v.estado!= 'pagando';
END;


CREATE TRIGGER delete_ventaConcepto_trigger
    AFTER
        DELETE
    ON conceptoventa
    FOR EACH ROW
BEGIN
    UPDATE producto AS p
    INNER JOIN conceptoventa c on p.uuid = c.uuidProducto
    INNER JOIN venta v on c.uuidVenta = v.uuid
    SET p.stock = p.stock + OLD.cantidad
    WHERE p.uuid = OLD.uuidProducto AND v.estado != 'pendiente' AND v.estado!= 'pagando';
END;


CREATE TRIGGER update_venta_trigger
    AFTER
        UPDATE
    ON venta
    FOR EACH ROW
BEGIN
    UPDATE producto AS p
    INNER JOIN conceptoventa c on p.uuid = c.uuidProducto
    INNER JOIN venta v on c.uuidVenta = v.uuid
    SET p.stock = p.stock - c.cantidad
    WHERE  v.estado != 'pendiente' AND v.estado!= 'pagando' AND v.uuid = NEW.uuid AND v.tipoVenta = 'online';
END;

