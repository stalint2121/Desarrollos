/*==============================================================*/
/* DBMS name:      PostgreSQL 8                                 */
/* Created on:     09/05/2018 17:19:40                          */
/*==============================================================*/


drop index GEN_PERSONA_PK;

drop table GEN_PERSONA;

drop index TIPO_ROL___CAB_ROL_PAGO_FK;

drop index REH_CAB_ROL_PAGO_PK;

drop table REH_CAB_ROL_PAGO;

drop index FORMA_CALCULO___CAB_RUBRO_FK;

drop index ESTADO_RUBRO___CAB_RUBRO_FK;

drop index TIPO_RUBRO___CAB_RUBRO_FK;

drop index REH_CAB_RUBRO_PK;

drop table REH_CAB_RUBRO;

drop index ESTRUC_ORGANI____EMPLEADO_FK;

drop index GEN_PERSONA___REH_EMPLEADO_FK;

drop index REH_EMPLEADO_PK;

drop table REH_EMPLEADO;

drop index CAB_ROL_PAGO___EMPLEADOS_ROL_FK;

drop index EMPLEADO___EMPLEADOS_ROL_FK;

drop index REH_EMPLEADOS_ROL_PK;

drop table REH_EMPLEADOS_ROL;

drop index REH_ESTADO_RUBRO_PK;

drop table REH_ESTADO_RUBRO;

drop index REH_ESTRUC_ORGANI_PK;

drop table REH_ESTRUC_ORGANI;

drop index REH_FORMA_CALCULO_PK;

drop table REH_FORMA_CALCULO;

drop index CAB_RUBRO___RUBROS_ROL_FK;

drop index EMPLEADOS_ROL___RUBROS_ROL_FK;

drop index REH_RUBROS_ROL_PK;

drop table REH_RUBROS_ROL;

drop index REH_TIPO_ROL_PK;

drop table REH_TIPO_ROL;

drop index REH_TIPO_RUBRO_PK;

drop table REH_TIPO_RUBRO;

drop sequence SEQUENCE_1;

create sequence SEQUENCE_1
increment 1;

/*==============================================================*/
/* Table: GEN_PERSONA                                           */
/*==============================================================*/
create table GEN_PERSONA (
   IDE_GEPER            SERIAL not null,
   NOMBRE_COMPLETO_GEPER VARCHAR(100)         null,
   NOMBRES_GEPER        VARCHAR(100)         null,
   ESTADO_GEPER         BOOL                 null,
   DIRECCION_GEPER      VARCHAR(200)         null,
   TELEFONO_GEPER       VARCHAR(20)          null,
   CELULAR_GEPER        VARCHAR(10)          null,
   constraint PK_GEN_PERSONA primary key (IDE_GEPER)
);

/*==============================================================*/
/* Index: GEN_PERSONA_PK                                        */
/*==============================================================*/
create unique index GEN_PERSONA_PK on GEN_PERSONA (
IDE_GEPER
);

/*==============================================================*/
/* Table: REH_CAB_ROL_PAGO                                      */
/*==============================================================*/
create table REH_CAB_ROL_PAGO (
   IDE_RHCRP            SERIAL not null,
   IDE_RHTRO            INT8                 null,
   IDE_RHFPA            INT8                 null,
   MES_RHCRP            VARCHAR(15)          null,
   FECHA_INICIO_RHCRP   DATE                 null,
   FECHA_FIN_RHCRP      DATE                 null,
   FECHA_SISTEMA_RHCRP  DATE                 null,
   ESTADO_RHCRP         BOOL                 null,
   constraint PK_REH_CAB_ROL_PAGO primary key (IDE_RHCRP)
);

/*==============================================================*/
/* Index: REH_CAB_ROL_PAGO_PK                                   */
/*==============================================================*/
create unique index REH_CAB_ROL_PAGO_PK on REH_CAB_ROL_PAGO (
IDE_RHCRP
);

/*==============================================================*/
/* Index: TIPO_ROL___CAB_ROL_PAGO_FK                            */
/*==============================================================*/
create  index TIPO_ROL___CAB_ROL_PAGO_FK on REH_CAB_ROL_PAGO (
IDE_RHTRO
);

/*==============================================================*/
/* Table: REH_CAB_RUBRO                                         */
/*==============================================================*/
create table REH_CAB_RUBRO (
   IDE_RHCRU            SERIAL not null,
   IDE_RHFCA            INT8                 null,
   IDE_RHTRU            INT8                 null,
   IDE_RHERU            INT8                 null,
   NOMBRE_RHCRU         VARCHAR(90)          null,
   IMPRIME_RHCRU        BOOL                 null,
   FECHA_INICIAL_RHCRU  VARCHAR(10)          null,
   FECHA_FINAL_RHCRU    VARCHAR(10)          null,
   FECHA_PAGO_RHCRU     VARCHAR(10)          null,
   FORMULA_RHCRU        VARCHAR(80)          null,
   ESTADO_RHCRU         BOOL                 null,
   OBSERVACION_RHCRU    VARCHAR(190)         null,
   constraint PK_REH_CAB_RUBRO primary key (IDE_RHCRU)
);

/*==============================================================*/
/* Index: REH_CAB_RUBRO_PK                                      */
/*==============================================================*/
create unique index REH_CAB_RUBRO_PK on REH_CAB_RUBRO (
IDE_RHCRU
);

/*==============================================================*/
/* Index: TIPO_RUBRO___CAB_RUBRO_FK                             */
/*==============================================================*/
create  index TIPO_RUBRO___CAB_RUBRO_FK on REH_CAB_RUBRO (
IDE_RHTRU
);

/*==============================================================*/
/* Index: ESTADO_RUBRO___CAB_RUBRO_FK                           */
/*==============================================================*/
create  index ESTADO_RUBRO___CAB_RUBRO_FK on REH_CAB_RUBRO (
IDE_RHERU
);

/*==============================================================*/
/* Index: FORMA_CALCULO___CAB_RUBRO_FK                          */
/*==============================================================*/
create  index FORMA_CALCULO___CAB_RUBRO_FK on REH_CAB_RUBRO (
IDE_RHFCA
);

/*==============================================================*/
/* Table: REH_EMPLEADO                                          */
/*==============================================================*/
create table REH_EMPLEADO (
   IDE_RHEMP            SERIAL not null,
   IDE_GEPER            INT8                 null,
   IDE_RHEOR            INT8                 null,
   ESTADO_RHEMP         BOOL                 null,
   OBSERVACION_RHEMP    VARCHAR(190)         null,
   constraint PK_REH_EMPLEADO primary key (IDE_RHEMP)
);

/*==============================================================*/
/* Index: REH_EMPLEADO_PK                                       */
/*==============================================================*/
create unique index REH_EMPLEADO_PK on REH_EMPLEADO (
IDE_RHEMP
);

/*==============================================================*/
/* Index: GEN_PERSONA___REH_EMPLEADO_FK                         */
/*==============================================================*/
create  index GEN_PERSONA___REH_EMPLEADO_FK on REH_EMPLEADO (
IDE_GEPER
);

/*==============================================================*/
/* Index: ESTRUC_ORGANI____EMPLEADO_FK                          */
/*==============================================================*/
create  index ESTRUC_ORGANI____EMPLEADO_FK on REH_EMPLEADO (
IDE_RHEOR
);

/*==============================================================*/
/* Table: REH_EMPLEADOS_ROL                                     */
/*==============================================================*/
create table REH_EMPLEADOS_ROL (
   IDE_RHERL            SERIAL not null,
   IDE_RHEMP            INT8                 null,
   IDE_RHCRP            INT8                 null,
   ESTADO_RHERL         BOOL                 null,
   OBSERVACION_RHERL    VARCHAR(190)         null,
   constraint PK_REH_EMPLEADOS_ROL primary key (IDE_RHERL)
);

/*==============================================================*/
/* Index: REH_EMPLEADOS_ROL_PK                                  */
/*==============================================================*/
create unique index REH_EMPLEADOS_ROL_PK on REH_EMPLEADOS_ROL (
IDE_RHERL
);

/*==============================================================*/
/* Index: EMPLEADO___EMPLEADOS_ROL_FK                           */
/*==============================================================*/
create  index EMPLEADO___EMPLEADOS_ROL_FK on REH_EMPLEADOS_ROL (
IDE_RHEMP
);

/*==============================================================*/
/* Index: CAB_ROL_PAGO___EMPLEADOS_ROL_FK                       */
/*==============================================================*/
create  index CAB_ROL_PAGO___EMPLEADOS_ROL_FK on REH_EMPLEADOS_ROL (
IDE_RHCRP
);

/*==============================================================*/
/* Table: REH_ESTADO_RUBRO                                      */
/*==============================================================*/
create table REH_ESTADO_RUBRO (
   IDE_RHERU            SERIAL not null,
   NOMBRE_RHRU          VARCHAR(50)          null,
   constraint PK_REH_ESTADO_RUBRO primary key (IDE_RHERU)
);

/*==============================================================*/
/* Index: REH_ESTADO_RUBRO_PK                                   */
/*==============================================================*/
create unique index REH_ESTADO_RUBRO_PK on REH_ESTADO_RUBRO (
IDE_RHERU
);

/*==============================================================*/
/* Table: REH_ESTRUC_ORGANI                                     */
/*==============================================================*/
create table REH_ESTRUC_ORGANI (
   IDE_RHEOR            SERIAL not null,
   NOMBRE_RHEOR         VARCHAR(50)          null,
   CODIG_RECUR_RHEOR    VARCHAR(50)          null,
   constraint PK_REH_ESTRUC_ORGANI primary key (IDE_RHEOR)
);

/*==============================================================*/
/* Index: REH_ESTRUC_ORGANI_PK                                  */
/*==============================================================*/
create unique index REH_ESTRUC_ORGANI_PK on REH_ESTRUC_ORGANI (
IDE_RHEOR
);

/*==============================================================*/
/* Table: REH_FORMA_CALCULO                                     */
/*==============================================================*/
create table REH_FORMA_CALCULO (
   IDE_RHFCA            SERIAL not null,
   NOMBRE_RHFCA         VARCHAR(50)          null,
   constraint PK_REH_FORMA_CALCULO primary key (IDE_RHFCA)
);

/*==============================================================*/
/* Index: REH_FORMA_CALCULO_PK                                  */
/*==============================================================*/
create unique index REH_FORMA_CALCULO_PK on REH_FORMA_CALCULO (
IDE_RHFCA
);

/*==============================================================*/
/* Table: REH_RUBROS_ROL                                        */
/*==============================================================*/
create table REH_RUBROS_ROL (
   IDE_RHRRO            SERIAL not null,
   IDE_RHERL            INT8                 null,
   IDE_RHCRU            INT8                 null,
   VALOR_RHRRO          NUMERIC(12,2)        null,
   ORDEN_RHRRO          INT4                 null,
   constraint PK_REH_RUBROS_ROL primary key (IDE_RHRRO)
);

/*==============================================================*/
/* Index: REH_RUBROS_ROL_PK                                     */
/*==============================================================*/
create unique index REH_RUBROS_ROL_PK on REH_RUBROS_ROL (
IDE_RHRRO
);

/*==============================================================*/
/* Index: EMPLEADOS_ROL___RUBROS_ROL_FK                         */
/*==============================================================*/
create  index EMPLEADOS_ROL___RUBROS_ROL_FK on REH_RUBROS_ROL (
IDE_RHERL
);

/*==============================================================*/
/* Index: CAB_RUBRO___RUBROS_ROL_FK                             */
/*==============================================================*/
create  index CAB_RUBRO___RUBROS_ROL_FK on REH_RUBROS_ROL (
IDE_RHCRU
);

/*==============================================================*/
/* Table: REH_TIPO_ROL                                          */
/*==============================================================*/
create table REH_TIPO_ROL (
   IDE_RHTRO            SERIAL not null,
   NOMBRE_RHTRO         VARCHAR(30)          null,
   constraint PK_REH_TIPO_ROL primary key (IDE_RHTRO)
);

/*==============================================================*/
/* Index: REH_TIPO_ROL_PK                                       */
/*==============================================================*/
create unique index REH_TIPO_ROL_PK on REH_TIPO_ROL (
IDE_RHTRO
);

/*==============================================================*/
/* Table: REH_TIPO_RUBRO                                        */
/*==============================================================*/
create table REH_TIPO_RUBRO (
   IDE_RHTRU            SERIAL not null,
   NOMBRE_RHTRU         VARCHAR(100)         null,
   SIGNO_RHTRU          INT4                 null,
   constraint PK_REH_TIPO_RUBRO primary key (IDE_RHTRU)
);

/*==============================================================*/
/* Index: REH_TIPO_RUBRO_PK                                     */
/*==============================================================*/
create unique index REH_TIPO_RUBRO_PK on REH_TIPO_RUBRO (
IDE_RHTRU
);

alter table REH_CAB_ROL_PAGO
   add constraint FK_REH_CAB__TIPO_ROL__REH_TIPO foreign key (IDE_RHTRO)
      references REH_TIPO_ROL (IDE_RHTRO)
      on delete restrict on update restrict;

alter table REH_CAB_RUBRO
   add constraint FK_REH_CAB__ESTADO_RU_REH_ESTA foreign key (IDE_RHERU)
      references REH_ESTADO_RUBRO (IDE_RHERU)
      on delete restrict on update restrict;

alter table REH_CAB_RUBRO
   add constraint FK_REH_CAB__FORMA_CAL_REH_FORM foreign key (IDE_RHFCA)
      references REH_FORMA_CALCULO (IDE_RHFCA)
      on delete restrict on update restrict;

alter table REH_CAB_RUBRO
   add constraint FK_REH_CAB__TIPO_RUBR_REH_TIPO foreign key (IDE_RHTRU)
      references REH_TIPO_RUBRO (IDE_RHTRU)
      on delete restrict on update restrict;

alter table REH_EMPLEADO
   add constraint FK_REH_EMPL_ESTRUC_OR_REH_ESTR foreign key (IDE_RHEOR)
      references REH_ESTRUC_ORGANI (IDE_RHEOR)
      on delete restrict on update restrict;

alter table REH_EMPLEADO
   add constraint FK_REH_EMPL_GEN_PERSO_GEN_PERS foreign key (IDE_GEPER)
      references GEN_PERSONA (IDE_GEPER)
      on delete restrict on update restrict;

alter table REH_EMPLEADOS_ROL
   add constraint FK_REH_EMPL_CAB_ROL_P_REH_CAB_ foreign key (IDE_RHCRP)
      references REH_CAB_ROL_PAGO (IDE_RHCRP)
      on delete restrict on update restrict;

alter table REH_EMPLEADOS_ROL
   add constraint FK_REH_EMPL_EMPLEADO__REH_EMPL foreign key (IDE_RHEMP)
      references REH_EMPLEADO (IDE_RHEMP)
      on delete restrict on update restrict;

alter table REH_RUBROS_ROL
   add constraint FK_REH_RUBR_CAB_RUBRO_REH_CAB_ foreign key (IDE_RHCRU)
      references REH_CAB_RUBRO (IDE_RHCRU)
      on delete restrict on update restrict;

alter table REH_RUBROS_ROL
   add constraint FK_REH_RUBR_EMPLEADOS_REH_EMPL foreign key (IDE_RHERL)
      references REH_EMPLEADOS_ROL (IDE_RHERL)
      on delete restrict on update restrict;

