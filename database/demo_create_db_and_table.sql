CREATE DATABASE IF NOT EXISTS storm_demo;
use storm_demo;
drop table if exists demo_trade_order;

/*==============================================================*/
/* Table: demo_trade_order                                      */
/*==============================================================*/
create table demo_trade_order
(
   id                   bigint not null comment '����ID',
   sku_name             varchar(100) not null comment '��Ʒ����',
   sku_price            float(8,2) not null comment '��Ʒ����',
   order_quantity       int not null comment '�µ�����',
   customer_name        varchar(100) not null comment '�µ��ͻ�',
   delivery_date        date not null comment '��������',
   delivery_place       varchar(200) not null comment '�����ص�',
   order_desc           text comment '��ע',
   primary key (id)
);

alter table demo_trade_order comment '��Ʒ����';
