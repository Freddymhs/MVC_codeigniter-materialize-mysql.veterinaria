/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     02-05-2019 11:37:42                          */
/*==============================================================*/


drop table if exists ATENCIONBASICA;

drop table if exists CARGOTRABAJADOR;

drop table if exists CITAVETERINARIA;

drop table if exists CLIENTE;

drop table if exists ESPECIEANIMAL;

drop table if exists ESTADOSALUDANIMAL;

drop table if exists EXAMEN;

drop table if exists MARCAPRODUCTO;

drop table if exists MASCOTA;

drop table if exists MEDIDAPRODUCTO;

drop table if exists PERSONA;

drop table if exists PRODUCTO;

drop table if exists RAZAANIMAL;

drop table if exists TIPOPRODUCTO;

drop table if exists TRABAJADOR;

drop table if exists TRATAMIENTO;

/*==============================================================*/
/* Table: ATENCIONBASICA                                        */
/*==============================================================*/
create table ATENCIONBASICA
(
   NOMBREATENCION       char(24) not null,
   IDCITAVETERINARIA    int(6),
   ANTECEDENTES         char(24),
   DIAGNOSTICOGENERAL   char(24),
   TRATAMIENTO          char(24),
   PRECIOATENCIONBASICA int,
   primary key (NOMBREATENCION)
);

/*==============================================================*/
/* Table: CARGOTRABAJADOR                                       */
/*==============================================================*/
create table CARGOTRABAJADOR
(
   TIPOCARGO            char(22) not null,
   primary key (TIPOCARGO)
);

/*==============================================================*/
/* Table: CITAVETERINARIA                                       */
/*==============================================================*/
create table CITAVETERINARIA
(
   IDCITAVETERINARIA    int(6) not null auto_increment,
   IDCLIENTE            int(6),
   IDTRABAJADOR         int(6),
   FECHA_CREACION       date,
   HORARIO_ATENCION     datetime,
   PRECIOTOTALATENCION  int,
   ESTADOFINALIZADO     bool,
   primary key (IDCITAVETERINARIA)
);

/*==============================================================*/
/* Table: CLIENTE                                               */
/*==============================================================*/
create table CLIENTE
(
   IDCLIENTE            int(6) not null auto_increment,
   IDTRABAJADOR         int(6),
   FECHAREGISTROCLIENTE date,
   NOMBRE               char(22),
   APELLIDOS            char(22),
   EDAD                 char(6),
   CORREO               char(22),
   TELEFONO             char(22),
   primary key (IDCLIENTE)
);

/*==============================================================*/
/* Table: ESPECIEANIMAL                                         */
/*==============================================================*/
create table ESPECIEANIMAL
(
   IDESPECIEMASCOTA     char(22) not null,
   primary key (IDESPECIEMASCOTA)
);

/*==============================================================*/
/* Table: ESTADOSALUDANIMAL                                     */
/*==============================================================*/
create table ESTADOSALUDANIMAL
(
   ESTADOSALUDANIMAL    char(22) not null,
   DEFINICIONDELESTADO  char(22),
   primary key (ESTADOSALUDANIMAL)
);

/*==============================================================*/
/* Table: EXAMEN                                                */
/*==============================================================*/
create table EXAMEN
(
   NOMBREEXAMEN         char(30) not null,
   IDCITAVETERINARIA    int(6),
   DURACIONEXAMEN       char(20),
   PRECIOEXAMEN         int,
   primary key (NOMBREEXAMEN)
);

/*==============================================================*/
/* Table: MARCAPRODUCTO                                         */
/*==============================================================*/
create table MARCAPRODUCTO
(
   MARCAPRODUCTO        char(24) not null,
   WEB_MARCA            char(24),
   TELEFONO_MARCA       char(24),
   UBICACION            char(22),
   primary key (MARCAPRODUCTO)
);

/*==============================================================*/
/* Table: MASCOTA                                               */
/*==============================================================*/
create table MASCOTA
(
   IDMASCOTA            int(6) not null auto_increment,
   RAZAANIMAL           char(22),
   IDESPECIEMASCOTA     char(22),
   IDCLIENTE            int(6),
   IDTRABAJADOR         int(6),
   ESTADOSALUDANIMAL    char(22),
   FECHAALTA            datetime,
   EDAD                 char(6),
   COMENTARIO           char(22),
   primary key (IDMASCOTA)
);

/*==============================================================*/
/* Table: MEDIDAPRODUCTO                                        */
/*==============================================================*/
create table MEDIDAPRODUCTO
(
   TIPO_MEDIDA          char(22) not null,
   DEFINICION           char(22),
   primary key (TIPO_MEDIDA)
);

/*==============================================================*/
/* Table: PERSONA                                               */
/*==============================================================*/
create table PERSONA
(
   RUTPERSONA           char(22) not null,
   NOMBRES              char(24),
   APELLIDOS            char(22),
   EDAD                 char(6),
   CORREO               char(22),
   TELEFONO             char(22),
   primary key (RUTPERSONA)
);

/*==============================================================*/
/* Table: PRODUCTO                                              */
/*==============================================================*/
create table PRODUCTO
(
   IDPRODUCTO           int(6) not null auto_increment,
   IDTRABAJADOR         int(6),
   TIPOPRODUCTO         char(22),
   MARCAPRODUCTO        char(24),
   IDCITAVETERINARIA    int(6),
   TIPO_MEDIDA          char(22),
   NOMBRE               char(22),
   FECHELABORACION      date,
   FECHVENCIMIENTO      date,
   ESTADO_DISPONIBLE    bool,
   PRECIO               int,
   UBICACIONINTERNA     char(23),
   primary key (IDPRODUCTO)
);

/*==============================================================*/
/* Table: RAZAANIMAL                                            */
/*==============================================================*/
create table RAZAANIMAL
(
   RAZAANIMAL           char(22) not null,
   primary key (RAZAANIMAL)
);

/*==============================================================*/
/* Table: TIPOPRODUCTO                                          */
/*==============================================================*/
create table TIPOPRODUCTO
(
   TIPOPRODUCTO         char(22) not null,
   FUNCIONDELPRODUCTO   char(26),
   primary key (TIPOPRODUCTO)
);

/*==============================================================*/
/* Table: TRABAJADOR                                            */
/*==============================================================*/
create table TRABAJADOR
(
   IDTRABAJADOR         int(6) not null auto_increment,
   TIPOCARGO            char(22),
   RUTPERSONA           char(22),
   USER                 char(22),
   PASSWORD             char(21),
   primary key (IDTRABAJADOR)
);

/*==============================================================*/
/* Table: TRATAMIENTO                                           */
/*==============================================================*/
create table TRATAMIENTO
(
   NOMBRETRATAMIENTO    char(24) not null,
   IDCITAVETERINARIA    int(6),
   TIPO                 char(24),
   CRITERIOAPLICACION   char(24),
   TIEMPOAPLICACION     char(24),
   PRECIOTRATAMIENTO    int,
   primary key (NOMBRETRATAMIENTO)
);

alter table ATENCIONBASICA add constraint FK_DIAGNOSTICA foreign key (IDCITAVETERINARIA)
      references CITAVETERINARIA (IDCITAVETERINARIA) on delete restrict on update restrict;

alter table CITAVETERINARIA add constraint FK_ESTABLECE_NUEVA foreign key (IDTRABAJADOR)
      references TRABAJADOR (IDTRABAJADOR) on delete restrict on update restrict;

alter table CITAVETERINARIA add constraint FK_PUEDE_TOMAR foreign key (IDCLIENTE)
      references CLIENTE (IDCLIENTE) on delete restrict on update restrict;

alter table CLIENTE add constraint FK_REGISTRA_A foreign key (IDTRABAJADOR)
      references TRABAJADOR (IDTRABAJADOR) on delete restrict on update restrict;

alter table EXAMEN add constraint FK_AGREGA foreign key (IDCITAVETERINARIA)
      references CITAVETERINARIA (IDCITAVETERINARIA) on delete restrict on update restrict;

alter table MASCOTA add constraint FK_CONTIENE foreign key (ESTADOSALUDANIMAL)
      references ESTADOSALUDANIMAL (ESTADOSALUDANIMAL) on delete restrict on update restrict;

alter table MASCOTA add constraint FK_ES_DE foreign key (RAZAANIMAL)
      references RAZAANIMAL (RAZAANIMAL) on delete restrict on update restrict;

alter table MASCOTA add constraint FK_ES_DEE foreign key (IDESPECIEMASCOTA)
      references ESPECIEANIMAL (IDESPECIEMASCOTA) on delete restrict on update restrict;

alter table MASCOTA add constraint FK_PERTENECE foreign key (IDCLIENTE)
      references CLIENTE (IDCLIENTE) on delete restrict on update restrict;

alter table MASCOTA add constraint FK_REGISTRA foreign key (IDTRABAJADOR)
      references TRABAJADOR (IDTRABAJADOR) on delete restrict on update restrict;

alter table PRODUCTO add constraint FK_ADMINISTRA foreign key (IDTRABAJADOR)
      references TRABAJADOR (IDTRABAJADOR) on delete restrict on update restrict;

alter table PRODUCTO add constraint FK_PROVEE foreign key (MARCAPRODUCTO)
      references MARCAPRODUCTO (MARCAPRODUCTO) on delete restrict on update restrict;

alter table PRODUCTO add constraint FK_SE_MIDE foreign key (TIPO_MEDIDA)
      references MEDIDAPRODUCTO (TIPO_MEDIDA) on delete restrict on update restrict;

alter table PRODUCTO add constraint FK_TIENE_UN foreign key (TIPOPRODUCTO)
      references TIPOPRODUCTO (TIPOPRODUCTO) on delete restrict on update restrict;

alter table PRODUCTO add constraint FK_USA_DE foreign key (IDCITAVETERINARIA)
      references CITAVETERINARIA (IDCITAVETERINARIA) on delete restrict on update restrict;

alter table TRABAJADOR add constraint FK_PUEDESER foreign key (TIPOCARGO)
      references CARGOTRABAJADOR (TIPOCARGO) on delete restrict on update restrict;

alter table TRABAJADOR add constraint FK_PUEDE_SER foreign key (RUTPERSONA)
      references PERSONA (RUTPERSONA) on delete restrict on update restrict;

alter table TRATAMIENTO add constraint FK_MUESTRA foreign key (IDCITAVETERINARIA)
      references CITAVETERINARIA (IDCITAVETERINARIA) on delete restrict on update restrict;

