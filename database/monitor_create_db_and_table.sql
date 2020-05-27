CREATE DATABASE IF NOT EXISTS storm_monitor;
use storm_monitor;

drop table if exists apm_business_cfg;
drop table if exists apm_chart_confg;

drop index custom_data_pick_log_Id6 on custom_data_pick_log;

drop index custom_data_pick_log_Id5 on custom_data_pick_log;

drop index custom_data_pick_log_Id4 on custom_data_pick_log;

drop index custom_data_pick_log_Id3 on custom_data_pick_log;

drop index custom_data_pick_log_Id2 on custom_data_pick_log;

drop table if exists custom_data_pick_log;

drop table if exists dao_monitor_log;

drop table if exists dao_monitor_log_day;

drop table if exists dao_monitor_log_hour;

drop table if exists disk_volume_monitor_log;

drop index error_log_Id6 on error_log;

drop index error_log_Id5 on error_log;

drop index error_log_Id4 on error_log;

drop index error_log_Id3 on error_log;

drop index error_log_Id2 on error_log;

drop table if exists error_log;

drop table if exists memory_gc_monitor_log;

drop table if exists service_monitor_log;

drop table if exists service_monitor_log_day;

drop table if exists service_monitor_log_hour;

drop table if exists system_monitor_log;

/*==============================================================*/
/* Table: apm_chart_confg                                       */
/*==============================================================*/
create table apm_chart_confg
(
   id                   varchar(40) not null comment 'ID',
   chart_name           varchar(200) not null comment 'ͼ������',
   description          varchar(400) not null comment 'ͼ��˵��',
   chart_content        text not null comment 'ͼ������',
   create_time          datetime not null comment '����ʱ��',
   modify_time          datetime not null comment '�޸�ʱ��',
   primary key (id)
);

alter table apm_chart_confg comment 'ͼ������';

/*==============================================================*/
/* Table: custom_data_pick_log                                  */
/*==============================================================*/
create table custom_data_pick_log
(
   id                   bigint not null auto_increment comment '����',
   log_time             datetime not null comment '��־ʱ��',
   service_name         varchar(250) not null comment '��������',
   machine_address      varchar(50) not null comment '������ַ',
   trace_id             varchar(100) default ' ' comment '������ID',
   user_key             varchar(50) default ' ' comment '�û���ʶ',
   pick_data            varchar(2000) default ' ' comment 'ץȡ����',
   primary key (id)
);

alter table custom_data_pick_log comment '�Զ���ҵ��ɼ���־��';

/*==============================================================*/
/* Index: custom_data_pick_log_Id2                              */
/*==============================================================*/
create index custom_data_pick_log_Id2 on custom_data_pick_log
(
   log_time
);

/*==============================================================*/
/* Index: custom_data_pick_log_Id3                              */
/*==============================================================*/
create index custom_data_pick_log_Id3 on custom_data_pick_log
(
   service_name
);

/*==============================================================*/
/* Index: custom_data_pick_log_Id4                              */
/*==============================================================*/
create index custom_data_pick_log_Id4 on custom_data_pick_log
(
   machine_address
);

/*==============================================================*/
/* Index: custom_data_pick_log_Id5                              */
/*==============================================================*/
create index custom_data_pick_log_Id5 on custom_data_pick_log
(
   trace_id
);

/*==============================================================*/
/* Index: custom_data_pick_log_Id6                              */
/*==============================================================*/
create index custom_data_pick_log_Id6 on custom_data_pick_log
(
   user_key
);

/*==============================================================*/
/* Table: dao_monitor_log                                       */
/*==============================================================*/
create table dao_monitor_log
(
   log_time             datetime not null comment '��־ʱ��',
   machine_address      varchar(50) not null comment '������ַ',
   service_name         varchar(600) not null comment '��������',
   success_count        bigint comment '�ɹ�����',
   failure_count        bigint comment 'ʧ�ܴ���',
   avg_elapsed          bigint comment 'ƽ����ʱ',
   max_elapsed          bigint comment '�����ʱ',
   min_elapsed          bigint comment '��С��ʱ',
   lastest_error_msg    varchar(400) comment '���´�����',
   primary key (log_time, machine_address, service_name),
   key AK_Identifier_2 (success_count),
   key AK_Identifier_3 (failure_count),
   key AK_Identifier_4 (avg_elapsed),
   key AK_Identifier_5 (max_elapsed)
);

alter table dao_monitor_log comment 'DAO���ʷ��Ӽ�ͳ�Ʊ�';

/*==============================================================*/
/* Table: dao_monitor_log_day                                   */
/*==============================================================*/
create table dao_monitor_log_day
(
   log_time             datetime not null comment '��־ʱ��',
   machine_address      varchar(50) not null comment '������ַ',
   service_name         varchar(600) not null comment '��������',
   success_count        bigint comment '�ɹ�����',
   failure_count        bigint comment 'ʧ�ܴ���',
   avg_elapsed          bigint comment 'ƽ����ʱ',
   max_elapsed          bigint comment '�����ʱ',
   min_elapsed          bigint comment '��С��ʱ',
   lastest_error_msg    varchar(400) comment '���´�����',
   primary key (log_time, machine_address, service_name),
   key AK_Identifier_2 (success_count),
   key AK_Identifier_3 (failure_count),
   key AK_Identifier_4 (avg_elapsed),
   key AK_Identifier_5 (max_elapsed)
);

alter table dao_monitor_log_day comment 'DAO�������ܱ�';

/*==============================================================*/
/* Table: dao_monitor_log_hour                                  */
/*==============================================================*/
create table dao_monitor_log_hour
(
   log_time             datetime not null comment '��־ʱ��',
   machine_address      varchar(50) not null comment '������ַ',
   service_name         varchar(600) not null comment '��������',
   success_count        bigint comment '�ɹ�����',
   failure_count        bigint comment 'ʧ�ܴ���',
   avg_elapsed          bigint comment 'ƽ����ʱ',
   max_elapsed          bigint comment '�����ʱ',
   min_elapsed          bigint comment '��С��ʱ',
   lastest_error_msg    varchar(400) comment '���´�����',
   primary key (log_time, machine_address, service_name),
   key AK_Identifier_2 (success_count),
   key AK_Identifier_3 (failure_count),
   key AK_Identifier_4 (avg_elapsed),
   key AK_Identifier_5 (max_elapsed)
);

alter table dao_monitor_log_hour comment 'DAO���Сʱ���ܱ�';

/*==============================================================*/
/* Table: disk_volume_monitor_log                               */
/*==============================================================*/
create table disk_volume_monitor_log
(
   log_time             datetime not null comment '��־ʱ��',
   machine_address      varchar(50) not null comment '������ַ',
   volume_id            varchar(100) not null comment '���̾�ID',
   volume_total         bigint comment '���̾�������',
   volume_free          bigint comment '���̾�δ��������',
   volume_usable        bigint comment '���̾��������',
   primary key (log_time, machine_address, volume_id)
);

alter table disk_volume_monitor_log comment '���̼����־��';

/*==============================================================*/
/* Table: error_log                                             */
/*==============================================================*/
create table error_log
(
   id                   bigint not null auto_increment comment '����',
   log_time             datetime not null comment '��־ʱ��',
   machine_address      varchar(50) not null comment '������ַ',
   service_name         varchar(250) not null comment '��������',
   error_type           int comment '1��ҵ�����0��ϵͳ����',
   trace_id             varchar(100) default ' ' comment '������ID',
   user_key             varchar(50) default ' ' comment '�û���ʶ',
   error_code           varchar(400) default ' ' comment '�������',
   error_msg            varchar(4000) default ' ' comment '������Ϣ',
   primary key (id)
);

alter table error_log comment '�쳣��Ϣ���ܱ�';

/*==============================================================*/
/* Index: error_log_Id2                                         */
/*==============================================================*/
create index error_log_Id2 on error_log
(
   log_time
);

/*==============================================================*/
/* Index: error_log_Id3                                         */
/*==============================================================*/
create index error_log_Id3 on error_log
(
   machine_address
);

/*==============================================================*/
/* Index: error_log_Id4                                         */
/*==============================================================*/
create index error_log_Id4 on error_log
(
   service_name
);

/*==============================================================*/
/* Index: error_log_Id5                                         */
/*==============================================================*/
create index error_log_Id5 on error_log
(
   trace_id
);

/*==============================================================*/
/* Index: error_log_Id6                                         */
/*==============================================================*/
create index error_log_Id6 on error_log
(
   user_key
);

/*==============================================================*/
/* Table: memory_gc_monitor_log                                 */
/*==============================================================*/
create table memory_gc_monitor_log
(
   log_time             datetime not null comment '��־ʱ��',
   machine_address      varchar(50) not null comment '������ַ',
   gc_name              varchar(100) not null comment 'GC����',
   gc_count             bigint comment 'GC����',
   gc_time              bigint comment 'GC��ʱ',
   primary key (log_time, machine_address, gc_name)
);

alter table memory_gc_monitor_log comment '�ڴ�GC�����־��';

/*==============================================================*/
/* Table: service_monitor_log                                   */
/*==============================================================*/
create table service_monitor_log
(
   log_time             datetime not null comment '��־ʱ��',
   machine_address      varchar(50) not null comment '������ַ',
   service_name         varchar(600) not null comment '��������',
   success_count        bigint comment '�ɹ�����',
   failure_count        bigint comment 'ʧ�ܴ���',
   avg_elapsed          bigint comment 'ƽ����ʱ',
   max_elapsed          bigint comment '�����ʱ',
   min_elapsed          bigint comment '��С��ʱ',
   lastest_error_msg    varchar(400) comment '���´�����',
   primary key (log_time, machine_address, service_name),
   key AK_Identifier_2 (success_count),
   key AK_Identifier_3 (failure_count),
   key AK_Identifier_4 (avg_elapsed),
   key AK_Identifier_5 (max_elapsed)
);

alter table service_monitor_log comment 'Ӧ�÷�����ʷ��Ӽ�ͳ�Ʊ�';

/*==============================================================*/
/* Table: service_monitor_log_day                               */
/*==============================================================*/
create table service_monitor_log_day
(
   log_time             datetime not null comment '��־ʱ��',
   machine_address      varchar(50) not null comment '������ַ',
   service_name         varchar(600) not null comment '��������',
   success_count        bigint comment '�ɹ�����',
   failure_count        bigint comment 'ʧ�ܴ���',
   avg_elapsed          bigint comment 'ƽ����ʱ',
   max_elapsed          bigint comment '�����ʱ',
   min_elapsed          bigint comment '��С��ʱ',
   lastest_error_msg    varchar(400) comment '���´�����',
   primary key (log_time, machine_address, service_name),
   key AK_Identifier_2 (success_count),
   key AK_Identifier_3 (failure_count),
   key AK_Identifier_4 (avg_elapsed),
   key AK_Identifier_5 (max_elapsed)
);

alter table service_monitor_log_day comment '����������ܱ�';

/*==============================================================*/
/* Table: service_monitor_log_hour                              */
/*==============================================================*/
create table service_monitor_log_hour
(
   log_time             datetime not null comment '��־ʱ��',
   machine_address      varchar(50) not null comment '������ַ',
   service_name         varchar(600) not null comment '��������',
   success_count        bigint comment '�ɹ�����',
   failure_count        bigint comment 'ʧ�ܴ���',
   avg_elapsed          bigint comment 'ƽ����ʱ',
   max_elapsed          bigint comment '�����ʱ',
   min_elapsed          bigint comment '��С��ʱ',
   lastest_error_msg    varchar(400) comment '���´�����',
   primary key (log_time, machine_address, service_name),
   key AK_Identifier_2 (success_count),
   key AK_Identifier_3 (failure_count),
   key AK_Identifier_4 (avg_elapsed),
   key AK_Identifier_5 (max_elapsed)
);

alter table service_monitor_log_hour comment '������Сʱ���ܱ�';

/*==============================================================*/
/* Table: system_monitor_log                                    */
/*==============================================================*/
create table system_monitor_log
(
   log_time             datetime not null comment '��־ʱ��',
   machine_address      varchar(50) not null comment '������ַ',
   disk_total           bigint comment '����������',
   disk_free            bigint comment '����δ��������',
   disk_usable          bigint comment '���̿�������',
   memory_max           bigint comment '����ڴ���',
   memory_total         bigint comment '�ڴ�����',
   memory_free          bigint comment '�����ڴ���',
   memory_heapUsage     bigint comment '���ڴ���',
   memory_nonHeapUsage  bigint comment '�Ƕ��ڴ���',
   os_arch              varchar(100) comment '����ϵͳ�ļܹ�',
   os_name              varchar(100) comment '����ϵͳ����',
   os_version           varchar(100) comment '����ϵͳ�İ汾',
   os_availableProcessors int comment 'Java���������ʹ�õĴ�������Ŀ',
   os_systemLoadAverage float comment '���һ������ϵͳ����ƽ��ֵ',
   os_totalPhysicalMemory bigint comment '�������ڴ���',
   os_freePhysicalMemory bigint comment 'δ���������ڴ���',
   os_totalSwapSpace    bigint comment '�ܽ����ռ���',
   os_freeSwapSpace     bigint comment 'δ���佻���ռ���',
   os_processTime       bigint comment 'java����ǰΪֹ��ռ�õ�CPU����ʱ��',
   os_committedVirtualMemory bigint comment 'java���н��̱�֤���õ������ڴ��С',
   runtime_javaVersion  varchar(100) comment 'java�汾',
   runtime_startTime    bigint comment 'JVM����ʱ��',
   runtime_upTime       bigint comment 'JVM����ʱ��',
   runtime_userDir      varchar(1000) comment 'ϵͳ�û�Ŀ¼',
   runtime_userName     varchar(400) comment 'ϵͳ�û�����',
   thread_active        int comment '��߳���',
   thread_cat_count     int comment 'APM�������߳���',
   thread_count         int comment '��ǰ�ܴ���߳���',
   thread_daemon_count  int comment '��ǰ�ػ��߳���',
   thread_http          int comment '��ǰHTTP�߳���',
   thread_peek          int comment '��ֵ��̼߳���',
   thread_started       int comment '�������߳���',
   thread_total_started int comment '�������߳���',
   primary key (log_time, machine_address),
   key AK_Identifier_2 (thread_peek)
);

alter table system_monitor_log comment 'ϵͳ�����־��';



CREATE TABLE `apm_business_cfg` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `business_key` varchar(200) DEFAULT NULL COMMENT 'ҵ������',
  `title` varchar(200) DEFAULT NULL COMMENT '����',
  `description` varchar(500) DEFAULT NULL COMMENT '����',
  `class_method_name` varchar(500) DEFAULT NULL COMMENT '����������',
  `parameters` varchar(1000) DEFAULT NULL COMMENT '����JSON,��ʽ:[{name:''token'',type:''String''},{name:''fundCode'',type:''String''},{name:''productCode'',type:''String''}]',
  `return_result` varchar(1000) DEFAULT NULL COMMENT '���ز���,��ʽ:[{name:''investCount'',type:''int''},{name:''assets'',type:''Object''}]',
  `create_time` datetime DEFAULT NULL COMMENT '����ʱ��',
  `modify_time` datetime DEFAULT NULL COMMENT '�޸�ʱ��',
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_business_key` (`business_key`)
);