--------------------------------------------------------
-- Archivo creado  - jueves-mayo-11-2017   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for View AQ$DEF$_AQCALL
--------------------------------------------------------

  CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "SYSTEM"."AQ$DEF$_AQCALL" ("QUEUE", "MSG_ID", "CORR_ID", "MSG_PRIORITY", "MSG_STATE", "DELAY", "DELAY_TIMESTAMP", "EXPIRATION", "ENQ_TIME", "ENQ_TIMESTAMP", "ENQ_USER_ID", "ENQ_TXN_ID", "DEQ_TIME", "DEQ_TIMESTAMP", "DEQ_USER_ID", "DEQ_TXN_ID", "RETRY_COUNT", "EXCEPTION_QUEUE_OWNER", "EXCEPTION_QUEUE", "USER_DATA", "ORIGINAL_QUEUE_NAME", "ORIGINAL_QUEUE_OWNER", "EXPIRATION_REASON") AS 
  SELECT q_name QUEUE, msgid MSG_ID, corrid CORR_ID, priority MSG_PRIORITY, decode(state, 0,   'READY',
                                1,   'WAIT',
                                2,   'PROCESSED',
                                3,   'EXPIRED',
                                10,  'BUFFERED_EXPIRED') MSG_STATE, cast(FROM_TZ(delay, '00:00')
                  at time zone sessiontimezone as date) DELAY, cast(FROM_TZ(delay, '00:00')
               at time zone sessiontimezone as timestamp) DELAY_TIMESTAMP, expiration, cast(FROM_TZ(enq_time, '00:00')
                  at time zone sessiontimezone as date) ENQ_TIME, cast(FROM_TZ(enq_time, '00:00')
                  at time zone sessiontimezone as timestamp) 
                  ENQ_TIMESTAMP, enq_uid ENQ_USER_ID, enq_tid ENQ_TXN_ID, cast(FROM_TZ(deq_time, '00:00')
                  at time zone sessiontimezone as date) DEQ_TIME, cast(FROM_TZ(deq_time, '00:00')
                  at time zone sessiontimezone as timestamp) 
                  DEQ_TIMESTAMP, deq_uid DEQ_USER_ID, deq_tid DEQ_TXN_ID, retry_count,  decode (state, 0, exception_qschema, 
                                  1, exception_qschema, 
                                  2, exception_qschema,  
                                  NULL) EXCEPTION_QUEUE_OWNER,  decode (state, 0, exception_queue, 
                                  1, exception_queue, 
                                  2, exception_queue,  
                                  NULL) EXCEPTION_QUEUE,  user_data,  decode (state, 3, 
                     decode (deq_tid, 'INVALID_TRANSACTION', NULL, 
                             exception_queue), NULL)
                                ORIGINAL_QUEUE_NAME,  decode (state, 3, 
                     decode (deq_tid, 'INVALID_TRANSACTION', NULL, 
                             exception_qschema), NULL)
                                ORIGINAL_QUEUE_OWNER,  decode(state, 3, 
                     decode(deq_time, NULL, 
                       decode(deq_tid, NULL,
                       decode (expiration , NULL , 'MAX_RETRY_EXCEEDED',
                            'TIME_EXPIRATION'),
                              'INVALID_TRANSACTION', NULL,
                              'MAX_RETRY_EXCEEDED'), NULL), NULL) 
                             EXPIRATION_REASON  FROM "DEF$_AQCALL" WHERE state != 7 AND   state != 9 WITH READ ONLY;
--------------------------------------------------------
--  DDL for View AQ$_DEF$_AQCALL_F
--------------------------------------------------------

  CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "SYSTEM"."AQ$_DEF$_AQCALL_F" ("Q_NAME", "ROW_ID", "MSGID", "CORRID", "PRIORITY", "STATE", "DELAY", "EXPIRATION", "ENQ_TIME", "ENQ_UID", "ENQ_TID", "DEQ_TIME", "DEQ_UID", "DEQ_TID", "RETRY_COUNT", "EXCEPTION_QSCHEMA", "EXCEPTION_QUEUE", "CSCN", "DSCN", "CHAIN_NO", "LOCAL_ORDER_NO", "TIME_MANAGER_INFO", "STEP_NO", "USER_DATA", "QUEUE_ID") AS 
  SELECT  /*+ NO_MERGE (qo) USE_NL(qt) */ qt.q_name Q_NAME, qt.rowid ROW_ID, qt.msgid MSGID, qt.corrid CORRID, qt.priority PRIORITY, qt.state STATE, cast(FROM_TZ(qt.delay, '00:00') at time zone sessiontimezone as timestamp) DELAY, qt.expiration EXPIRATION, cast(FROM_TZ(qt.enq_time, '00:00') at time zone sessiontimezone as timestamp) ENQ_TIME, qt.enq_uid ENQ_UID, qt.enq_tid ENQ_TID, cast(FROM_TZ(qt.deq_time, '00:00') at time zone sessiontimezone as timestamp) DEQ_TIME, qt.deq_uid DEQ_UID, qt.deq_tid DEQ_TID, qt.retry_count RETRY_COUNT, qt.exception_qschema EXCEPTION_QSCHEMA, qt.exception_queue EXCEPTION_QUEUE, qt.cscn CSCN, qt.dscn DSCN, qt.chain_no CHAIN_NO, qt.local_order_no LOCAL_ORDER_NO, cast(FROM_TZ(qt.time_manager_info, '00:00') at time zone sessiontimezone as timestamp)   TIME_MANAGER_INFO, qt.step_no STEP_NO, qt.user_data USER_DATA , qo.qid QUEUE_ID  FROM "DEF$_AQCALL" qt, SYS.ALL_INT_DEQUEUE_QUEUES  qo  WHERE qt.q_name = qo.name AND qo.owner = 'SYSTEM' WITH READ ONLY;
--------------------------------------------------------
--  DDL for View AQ$DEF$_AQERROR
--------------------------------------------------------

  CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "SYSTEM"."AQ$DEF$_AQERROR" ("QUEUE", "MSG_ID", "CORR_ID", "MSG_PRIORITY", "MSG_STATE", "DELAY", "DELAY_TIMESTAMP", "EXPIRATION", "ENQ_TIME", "ENQ_TIMESTAMP", "ENQ_USER_ID", "ENQ_TXN_ID", "DEQ_TIME", "DEQ_TIMESTAMP", "DEQ_USER_ID", "DEQ_TXN_ID", "RETRY_COUNT", "EXCEPTION_QUEUE_OWNER", "EXCEPTION_QUEUE", "USER_DATA", "ORIGINAL_QUEUE_NAME", "ORIGINAL_QUEUE_OWNER", "EXPIRATION_REASON") AS 
  SELECT q_name QUEUE, msgid MSG_ID, corrid CORR_ID, priority MSG_PRIORITY, decode(state, 0,   'READY',
                                1,   'WAIT',
                                2,   'PROCESSED',
                                3,   'EXPIRED',
                                10,  'BUFFERED_EXPIRED') MSG_STATE, cast(FROM_TZ(delay, '00:00')
                  at time zone sessiontimezone as date) DELAY, cast(FROM_TZ(delay, '00:00')
               at time zone sessiontimezone as timestamp) DELAY_TIMESTAMP, expiration, cast(FROM_TZ(enq_time, '00:00')
                  at time zone sessiontimezone as date) ENQ_TIME, cast(FROM_TZ(enq_time, '00:00')
                  at time zone sessiontimezone as timestamp) 
                  ENQ_TIMESTAMP, enq_uid ENQ_USER_ID, enq_tid ENQ_TXN_ID, cast(FROM_TZ(deq_time, '00:00')
                  at time zone sessiontimezone as date) DEQ_TIME, cast(FROM_TZ(deq_time, '00:00')
                  at time zone sessiontimezone as timestamp) 
                  DEQ_TIMESTAMP, deq_uid DEQ_USER_ID, deq_tid DEQ_TXN_ID, retry_count,  decode (state, 0, exception_qschema, 
                                  1, exception_qschema, 
                                  2, exception_qschema,  
                                  NULL) EXCEPTION_QUEUE_OWNER,  decode (state, 0, exception_queue, 
                                  1, exception_queue, 
                                  2, exception_queue,  
                                  NULL) EXCEPTION_QUEUE,  user_data,  decode (state, 3, 
                     decode (deq_tid, 'INVALID_TRANSACTION', NULL, 
                             exception_queue), NULL)
                                ORIGINAL_QUEUE_NAME,  decode (state, 3, 
                     decode (deq_tid, 'INVALID_TRANSACTION', NULL, 
                             exception_qschema), NULL)
                                ORIGINAL_QUEUE_OWNER,  decode(state, 3, 
                     decode(deq_time, NULL, 
                       decode(deq_tid, NULL,
                       decode (expiration , NULL , 'MAX_RETRY_EXCEEDED',
                            'TIME_EXPIRATION'),
                              'INVALID_TRANSACTION', NULL,
                              'MAX_RETRY_EXCEEDED'), NULL), NULL) 
                             EXPIRATION_REASON  FROM "DEF$_AQERROR" WHERE state != 7 AND   state != 9 WITH READ ONLY;
--------------------------------------------------------
--  DDL for View AQ$_DEF$_AQERROR_F
--------------------------------------------------------

  CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "SYSTEM"."AQ$_DEF$_AQERROR_F" ("Q_NAME", "ROW_ID", "MSGID", "CORRID", "PRIORITY", "STATE", "DELAY", "EXPIRATION", "ENQ_TIME", "ENQ_UID", "ENQ_TID", "DEQ_TIME", "DEQ_UID", "DEQ_TID", "RETRY_COUNT", "EXCEPTION_QSCHEMA", "EXCEPTION_QUEUE", "CSCN", "DSCN", "CHAIN_NO", "LOCAL_ORDER_NO", "TIME_MANAGER_INFO", "STEP_NO", "USER_DATA", "QUEUE_ID") AS 
  SELECT  /*+ NO_MERGE (qo) USE_NL(qt) */ qt.q_name Q_NAME, qt.rowid ROW_ID, qt.msgid MSGID, qt.corrid CORRID, qt.priority PRIORITY, qt.state STATE, cast(FROM_TZ(qt.delay, '00:00') at time zone sessiontimezone as timestamp) DELAY, qt.expiration EXPIRATION, cast(FROM_TZ(qt.enq_time, '00:00') at time zone sessiontimezone as timestamp) ENQ_TIME, qt.enq_uid ENQ_UID, qt.enq_tid ENQ_TID, cast(FROM_TZ(qt.deq_time, '00:00') at time zone sessiontimezone as timestamp) DEQ_TIME, qt.deq_uid DEQ_UID, qt.deq_tid DEQ_TID, qt.retry_count RETRY_COUNT, qt.exception_qschema EXCEPTION_QSCHEMA, qt.exception_queue EXCEPTION_QUEUE, qt.cscn CSCN, qt.dscn DSCN, qt.chain_no CHAIN_NO, qt.local_order_no LOCAL_ORDER_NO, cast(FROM_TZ(qt.time_manager_info, '00:00') at time zone sessiontimezone as timestamp)   TIME_MANAGER_INFO, qt.step_no STEP_NO, qt.user_data USER_DATA , qo.qid QUEUE_ID  FROM "DEF$_AQERROR" qt, SYS.ALL_INT_DEQUEUE_QUEUES  qo  WHERE qt.q_name = qo.name AND qo.owner = 'SYSTEM' WITH READ ONLY;
--------------------------------------------------------
--  DDL for View MVIEW_EVALUATIONS
--------------------------------------------------------

  CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "SYSTEM"."MVIEW_EVALUATIONS" ("RUNID", "MVIEW_OWNER", "MVIEW_NAME", "RANK", "STORAGE_IN_BYTES", "FREQUENCY", "CUMULATIVE_BENEFIT", "BENEFIT_TO_COST_RATIO") AS 
  select
  t1.runid# as runid,
  summary_owner AS mview_owner,
  summary_name AS mview_name,
  rank# as rank,
  storage_in_bytes,
  frequency,
  cumulative_benefit,
  benefit_to_cost_ratio
from SYSTEM.MVIEW$_ADV_OUTPUT t1, SYSTEM.MVIEW$_ADV_LOG t2, ALL_USERS u
where
  t1.runid# = t2.runid# and
  u.username = t2.uname and
  u.user_id = userenv('SCHEMAID') and
  t1.output_type = 1
order by t1.rank#;

   COMMENT ON TABLE "SYSTEM"."MVIEW_EVALUATIONS"  IS 'This view gives DBA access to summary evaluation output';
--------------------------------------------------------
--  DDL for View MVIEW_EXCEPTIONS
--------------------------------------------------------

  CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "SYSTEM"."MVIEW_EXCEPTIONS" ("RUNID", "OWNER", "TABLE_NAME", "DIMENSION_NAME", "RELATIONSHIP", "BAD_ROWID") AS 
  select
  t1.runid# as runid,
  owner,
  table_name,
  dimension_name,
  relationship,
  bad_rowid
from SYSTEM.MVIEW$_ADV_EXCEPTIONS t1, SYSTEM.MVIEW$_ADV_LOG t2, ALL_USERS u
where
  t1.runid# = t2.runid# and
  u.username = t2.uname and
  u.user_id = userenv('SCHEMAID');

   COMMENT ON TABLE "SYSTEM"."MVIEW_EXCEPTIONS"  IS 'This view gives DBA access to dimension validation results';
--------------------------------------------------------
--  DDL for View MVIEW_FILTER
--------------------------------------------------------

  CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "SYSTEM"."MVIEW_FILTER" ("FILTERID", "SUBFILTERNUM", "SUBFILTERTYPE", "STR_VALUE", "NUM_VALUE1", "NUM_VALUE2", "DATE_VALUE1", "DATE_VALUE2") AS 
  select
      a.filterid# as filterid,
      a.subfilternum# as subfilternum,
      decode(a.subfiltertype,1,'APPLICATION',2,'CARDINALITY',3,'LASTUSE',
                             4,'FREQUENCY',5,'USER',6,'PRIORITY',7,'BASETABLE',
                             8,'RESPONSETIME',9,'COLLECTIONID',10,'TRACENAME',
                             11,'SCHEMA','UNKNOWN') AS subfiltertype,
      a.str_value,
      to_number(decode(a.num_value1,-999,NULL,a.num_value1)) AS num_value1,
      to_number(decode(a.num_value2,-999,NULL,a.num_value2)) AS num_value2,
      a.date_value1,
      a.date_value2
   from system.mview$_adv_filter a, system.mview$_adv_log b, ALL_USERS u
   WHERE a.filterid# = b.runid#
   AND b.uname = u.username
   AND u.user_id = userenv('SCHEMAID');

   COMMENT ON TABLE "SYSTEM"."MVIEW_FILTER"  IS 'Workload filter records';
--------------------------------------------------------
--  DDL for View MVIEW_FILTERINSTANCE
--------------------------------------------------------

  CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "SYSTEM"."MVIEW_FILTERINSTANCE" ("RUNID", "FILTERID", "SUBFILTERNUM", "SUBFILTERTYPE", "STR_VALUE", "NUM_VALUE1", "NUM_VALUE2", "DATE_VALUE1", "DATE_VALUE2") AS 
  select
      a.runid# as runid,
      a.filterid# as filterid,
      a.subfilternum# as subfilternum,
      decode(a.subfiltertype,1,'APPLICATION',2,'CARDINALITY',3,'LASTUSE',
                             4,'FREQUENCY',5,'USER',6,'PRIORITY',7,'BASETABLE',
                             8,'RESPONSETIME',9,'COLLECTIONID',10,'TRACENAME',
                             11,'SCHEMA','UNKNOWN') AS subfiltertype,
      a.str_value,
      to_number(decode(a.num_value1,-999,NULL,a.num_value1)) AS num_value1,
      to_number(decode(a.num_value2,-999,NULL,a.num_value2)) AS num_value2,
      a.date_value1,
      a.date_value2
   from system.mview$_adv_filterinstance a;

   COMMENT ON TABLE "SYSTEM"."MVIEW_FILTERINSTANCE"  IS 'Workload filter instance records';
--------------------------------------------------------
--  DDL for View MVIEW_LOG
--------------------------------------------------------

  CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "SYSTEM"."MVIEW_LOG" ("ID", "FILTERID", "RUN_BEGIN", "RUN_END", "TYPE", "STATUS", "MESSAGE", "COMPLETED", "TOTAL", "ERROR_CODE") AS 
  select
      m.runid# as id,
      m.filterid# as filterid,
      m.run_begin,
      m.run_end,
      decode(m.run_type,1,'EVALUATE',2,'EVALUATE_W',3,'RECOMMEND',
                      4,'RECOMMEND_W',5,'VALIDATE',6,'WORKLOAD',
                      7,'FILTER','UNKNOWN') AS type,
      decode(m.status,0,'UNUSED',1,'CANCELLED',2,'IN_PROGRESS',3,'COMPLETED',
                    4,'ERROR','UNKNOWN') AS status,
      m.message,
      m.completed,
      m.total,
      m.error_code
   from system.mview$_adv_log m, all_users u
   where m.uname = u.username
   and   u.user_id = userenv('SCHEMAID');

   COMMENT ON TABLE "SYSTEM"."MVIEW_LOG"  IS 'Advisor session log';
--------------------------------------------------------
--  DDL for View MVIEW_RECOMMENDATIONS
--------------------------------------------------------

  CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "SYSTEM"."MVIEW_RECOMMENDATIONS" ("RUNID", "ALL_TABLES", "FACT_TABLES", "GROUPING_LEVELS", "QUERY_TEXT", "RECOMMENDATION_NUMBER", "RECOMMENDED_ACTION", "MVIEW_OWNER", "MVIEW_NAME", "STORAGE_IN_BYTES", "PCT_PERFORMANCE_GAIN", "BENEFIT_TO_COST_RATIO") AS 
  select
  t1.runid# as runid,
  t1.from_clause as all_tables,
  fact_tables,
  grouping_levels,
  query_text,
  rank# as recommendation_number,
  action_type as recommended_action,
  summary_owner as mview_owner,
  summary_name as mview_name,
  storage_in_bytes,
  pct_performance_gain,
  benefit_to_cost_ratio
from SYSTEM.MVIEW$_ADV_OUTPUT t1, SYSTEM.MVIEW$_ADV_LOG t2, ALL_USERS u
where
  t1.runid# = t2.runid# and
  u.username = t2.uname and
  u.user_id = userenv('SCHEMAID') and
  t1.output_type = 0
order by t1.rank#;

   COMMENT ON TABLE "SYSTEM"."MVIEW_RECOMMENDATIONS"  IS 'This view gives DBA access to summary recommendations';
--------------------------------------------------------
--  DDL for View MVIEW_WORKLOAD
--------------------------------------------------------

  CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "SYSTEM"."MVIEW_WORKLOAD" ("WORKLOADID", "IMPORT_TIME", "QUERYID", "APPLICATION", "CARDINALITY", "RESULTSIZE", "LASTUSE", "FREQUENCY", "OWNER", "PRIORITY", "QUERY", "RESPONSETIME") AS 
  select
  a.collectionid# as workloadid,
  a.collecttime as import_time,
  a.queryid# as queryid,
  a.application,
  a.cardinality,
  a.resultsize,
  a.qdate as lastuse,
  a.frequency,
  a.uname as owner,
  a.priority,
  a.sql_text as query,
  a.exec_time as responsetime
from SYSTEM.MVIEW$_ADV_WORKLOAD A, SYSTEM.MVIEW$_ADV_LOG B, ALL_USERS D
WHERE a.collectionid# = b.runid#
AND b.uname = d.username
AND d.user_id = userenv('SCHEMAID');

   COMMENT ON TABLE "SYSTEM"."MVIEW_WORKLOAD"  IS 'This view gives DBA access to shared workload';
--------------------------------------------------------
--  DDL for View PRODUCT_PRIVS
--------------------------------------------------------

  CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "SYSTEM"."PRODUCT_PRIVS" ("PRODUCT", "USERID", "ATTRIBUTE", "SCOPE", "NUMERIC_VALUE", "CHAR_VALUE", "DATE_VALUE", "LONG_VALUE") AS 
  SELECT PRODUCT, USERID, ATTRIBUTE, SCOPE,
         NUMERIC_VALUE, CHAR_VALUE, DATE_VALUE, LONG_VALUE
  FROM SQLPLUS_PRODUCT_PROFILE
  WHERE USERID = 'PUBLIC' OR USER LIKE USERID;
--------------------------------------------------------
--  DDL for View SCHEDULER_JOB_ARGS
--------------------------------------------------------

  CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "SYSTEM"."SCHEDULER_JOB_ARGS" ("OWNER", "JOB_NAME", "ARGUMENT_NAME", "ARGUMENT_POSITION", "ARGUMENT_TYPE", "VALUE", "ANYDATA_VALUE", "OUT_ARGUMENT") AS 
  SELECT "OWNER","JOB_NAME","ARGUMENT_NAME","ARGUMENT_POSITION","ARGUMENT_TYPE","VALUE","ANYDATA_VALUE","OUT_ARGUMENT" FROM sys.all_scheduler_job_args;
--------------------------------------------------------
--  DDL for View SCHEDULER_PROGRAM_ARGS
--------------------------------------------------------

  CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "SYSTEM"."SCHEDULER_PROGRAM_ARGS" ("OWNER", "PROGRAM_NAME", "ARGUMENT_NAME", "ARGUMENT_POSITION", "ARGUMENT_TYPE", "METADATA_ATTRIBUTE", "DEFAULT_VALUE", "DEFAULT_ANYDATA_VALUE", "OUT_ARGUMENT") AS 
  SELECT "OWNER","PROGRAM_NAME","ARGUMENT_NAME","ARGUMENT_POSITION","ARGUMENT_TYPE","METADATA_ATTRIBUTE","DEFAULT_VALUE","DEFAULT_ANYDATA_VALUE","OUT_ARGUMENT" FROM sys.all_scheduler_program_args;
--------------------------------------------------------
--  DDL for Type LOGMNR$COL_GG_REC
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYSTEM"."LOGMNR$COL_GG_REC" as object
(
LOGMNR_UID NUMBER,
OBJ# NUMBER,
MD_COL_NAME VARCHAR2(128),
MD_COL_NUM NUMBER,                 /* col# */
MD_COL_SEGCOL NUMBER,              /* segcol# */
MD_COL_TYPE NUMBER,                /* type# */
MD_COL_LEN NUMBER,
MD_COL_PREC NUMBER,                /* precision */
MD_COL_SCALE NUMBER,
MD_COL_CHARSETID NUMBER,           /* character set id */
MD_COL_CHARSETFORM NUMBER,         /* character set form */
MD_COL_ALT_TYPE VARCHAR2(4000),    /* adt type if any */
MD_COL_ALT_PREC NUMBER,            /* precision of the adt attribute */
MD_COL_ALT_CHAR_USED VARCHAR2(2),  /* charset used by the adt attribute */
MD_COL_ALT_LENGTH NUMBER,          /* length of the adt attribute */
MD_COL_ALT_XML_TYPE NUMBER,        /* 0/1. is xml_type column */
MD_COL_ALT_BINARYXML_TYPE NUMBER,  /* 0/1. is xml_type stored as binary */
MD_COL_ENC_ISENC VARCHAR2(3) ,     /* 'YES'/'NO' */
MD_COL_ENC_NOSALT VARCHAR2(3) ,    /* 'YES'/'NO' */
MD_COL_ENC_ISLOB VARCHAR2(3) ,     /* 'YES'/'NO' */
MD_COL_ALT_OBJECTXML_TYPE NUMBER,  /* 0/1 xml_type stored as object */
MD_COL_HASNOTNULLDEFAULT VARCHAR2(3) ,   /* 'YES'/'NO' */
MD_COL_ALT_TYPE_OWNER VARCHAR2(128),  /* owner of the adt type if any */
PROPERTY NUMBER,
XCOLTYPEFLAGS NUMBER,
XOPQTYPEFLAGS NUMBER,
EAFLAGS NUMBER,
XFQCOLNAME VARCHAR2(4000),
SPARE1  NUMBER,
SPARE2  NUMBER,
SPARE3  NUMBER,
SPARE4  VARCHAR2(4000),
SPARE5  VARCHAR2(4000),
SPARE6  VARCHAR2(4000),
/* Following fields added in 12.1.0.2 */
OBJV# NUMBER,
INTCOL# NUMBER,
INTERVAL_LEADING_PRECISION NUMBER,
INTERVAL_TRAILING_PRECISION NUMBER,
TOID RAW(16),
TYPENAME VARCHAR2(128),
NUMINTCOLS NUMBER,
NUMATTRS NUMBER,
ADTORDER NUMBER,
LOGMNR_SPARE1 NUMBER,
LOGMNR_SPARE2 NUMBER,
LOGMNR_SPARE3 VARCHAR2(1000),
LOGMNR_SPARE4 DATE,
LOGMNR_SPARE5 NUMBER,
LOGMNR_SPARE6 NUMBER,
LOGMNR_SPARE7 NUMBER,
LOGMNR_SPARE8 NUMBER,
LOGMNR_SPARE9 NUMBER,
XTYPENAME VARCHAR2(4000),
XTOPINTCOL NUMBER,
XREFFEDTABLEOBJN NUMBER,
XREFFEDTABLEOBJV NUMBER,
XOPQTYPETYPE NUMBER,
XOPQLOBINTCOL NUMBER,
XOPQOBJINTCOL NUMBER,
XXMLINTCOL    NUMBER,
LOGMNRDERIVEDFLAGS NUMBER
);

/
--------------------------------------------------------
--  DDL for Type LOGMNR$COL_GG_RECS
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYSTEM"."LOGMNR$COL_GG_RECS" AS TABLE OF  SYSTEM.LOGMNR$COL_GG_REC;

/
--------------------------------------------------------
--  DDL for Type LOGMNR$KEY_GG_REC
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYSTEM"."LOGMNR$KEY_GG_REC" as object
(
LOGMNR_UID NUMBER,
KEY# NUMBER,                   /* index obj# or con# */
KEY_FLAGS NUMBER,              /* index or constraint */
KEY_NAME VARCHAR2(128),        /* index name or constraint name */
INDEX_OWNER# NUMBER,
INDEX_OWNERNAME VARCHAR2(128),
COLNAME VARCHAR2(128),
INTCOL# NUMBER,
which number,
KEY_ORDER VARCHAR2(10),              /* asc or desc */
KEYCOL_FLAGS NUMBER,           /* Column properties such as is_null */
SPARE1  NUMBER,
SPARE2  NUMBER,
SPARE3  NUMBER,
SPARE4  VARCHAR2(4000),
SPARE5  VARCHAR2(4000),
SPARE6  VARCHAR2(4000)
);

/
--------------------------------------------------------
--  DDL for Type LOGMNR$KEY_GG_RECS
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYSTEM"."LOGMNR$KEY_GG_RECS" AS TABLE OF  SYSTEM.LOGMNR$KEY_GG_REC;

/
--------------------------------------------------------
--  DDL for Type LOGMNR$SEQ_GG_REC
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYSTEM"."LOGMNR$SEQ_GG_REC" as object
(
LOGMNR_UID NUMBER,
OBJ# NUMBER,
NAME VARCHAR2(128),
OWNER# NUMBER,
OWNERNAME VARCHAR2(128),
FLAGS NUMBER,
MD_TAB_SEQCACHE NUMBER,
MD_TAB_SEQINCREMENTBY NUMBER,
SPARE1  NUMBER,
SPARE2  NUMBER,
SPARE3  NUMBER,
SPARE4  VARCHAR2(4000),
SPARE5  VARCHAR2(4000),
SPARE6  VARCHAR2(4000)
);

/
--------------------------------------------------------
--  DDL for Type LOGMNR$SEQ_GG_RECS
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYSTEM"."LOGMNR$SEQ_GG_RECS" AS TABLE OF  SYSTEM.LOGMNR$SEQ_GG_REC;

/
--------------------------------------------------------
--  DDL for Type LOGMNR$TAB_GG_REC
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYSTEM"."LOGMNR$TAB_GG_REC" as object
(
LOGMNR_UID NUMBER,
OBJ# NUMBER,
BASEOBJV# NUMBER,
MD_TAB_USERID NUMBER,                /* owner# */
MD_TAB_COLCOUNT NUMBER,              /* user column count */
MD_TAB_TOTAL_COL_NUM NUMBER,         /* kernal column count */
MD_TAB_LOG_GROUP_EXISTS NUMBER,      /* Any log group exists for this table */
MD_TAB_IOT VARCHAR2(3) ,             /* 'YES'/'NO' IS IOT? */
MD_TAB_IOT_OVERFLOW VARCHAR2(3) ,    /* 'YES'/'NO' IOT with overflow ? */
MD_TAB_PARTITION  VARCHAR2(3) ,      /* 'YES'/'NO' is partitioned ? */
MD_TAB_SUBPARTITION VARCHAR2(3) ,    /* 'YES'/'NO' is sub partitioned? */
MD_TAB_XMLTYPETABLE VARCHAR2(3) ,    /* 'YES'/'NO' is xmltype table? */
MD_TAB_OBJECTID NUMBER,              /* object id if table object */
MD_TAB_OWNER VARCHAR2(128),          /* owner name */
MD_TAB_NAME VARCHAR2(128),           /* table name */
MD_TAB_OBJTYPE VARCHAR2(128),        /* Object type name */
MD_TAB_SCN NUMBER,                   /* COMMIT_SCN of this table version */
TAB_FLAGS NUMBER,
TRIGFLAG NUMBER,
OBJ_FLAGS NUMBER,
PROPERTY NUMBER,
PARTTYPE NUMBER,
SUBPARTTYPE NUMBER,
SPARE1  NUMBER,
SPARE2  NUMBER,
SPARE3  NUMBER,
SPARE4  VARCHAR2(4000),
SPARE5  VARCHAR2(4000),
SPARE6  VARCHAR2(4000),
/* Following fields added in 12.1.0.2 */
LVLCNT NUMBER,
LVL1OBJ# NUMBER,
LVL2OBJ# NUMBER,
LVL1TYPE# NUMBER,
LVL2TYPE# NUMBER,
LVL1NAME  VARCHAR2(128),
LVL2NAME  VARCHAR2(128),
INTCOLS   NUMBER,
ASSOC#    NUMBER,
XIDUSN    NUMBER,
XIDSLT    NUMBER,
XIDSQN    NUMBER,
DROP_SCN  NUMBER,
FLAGS     NUMBER,
LOGMNR_SPARE1   NUMBER,
LOGMNR_SPARE2   NUMBER,
LOGMNR_SPARE3   VARCHAR2(1000),
LOGMNR_SPARE4   DATE,
LOGMNR_SPARE5   NUMBER,
LOGMNR_SPARE6   NUMBER,
LOGMNR_SPARE7   NUMBER,
LOGMNR_SPARE8   NUMBER,
LOGMNR_SPARE9   NUMBER,
UNSUPPORTEDCOLS  NUMBER,
COMPLEXTYPECOLS  NUMBER,
NTPARENTOBJNUM   NUMBER,
NTPARENTOBJVERSION NUMBER,
NTPARENTINTCOLNUM  NUMBER,
LOGMNRTLOFLAGS    NUMBER,
LOGMNRMCV VARCHAR2(30)
);

/
--------------------------------------------------------
--  DDL for Type LOGMNR$TAB_GG_RECS
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYSTEM"."LOGMNR$TAB_GG_RECS" AS TABLE OF  SYSTEM.LOGMNR$TAB_GG_REC;

/
--------------------------------------------------------
--  DDL for Type REPCAT$_OBJECT_NULL_VECTOR
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TYPE "SYSTEM"."REPCAT$_OBJECT_NULL_VECTOR" AS OBJECT
(
  -- type owner, name, hashcode for the type represented by null_vector
  type_owner      VARCHAR2(30),
  type_name       VARCHAR2(30),
  type_hashcode   RAW(17),
  -- null_vector for a particular object instance
  -- ROBJ REVISIT: should only contain the null image, and not version#
  null_vector     RAW(2000)
)

/
--------------------------------------------------------
--  DDL for Table AVISOS
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."AVISOS" 
   (	"TRABAJADOR_USUARIO" VARCHAR2(15 BYTE), 
	"FECHA_AVISO" DATE, 
	"COMENTARIO" VARCHAR2(200 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table CENTRO
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."CENTRO" 
   (	"NOMBRE" VARCHAR2(33 BYTE), 
	"CALLE" VARCHAR2(33 BYTE), 
	"NUMERO" VARCHAR2(4 BYTE), 
	"CODIGO_POSTAL" VARCHAR2(6 BYTE), 
	"TELEFONO" VARCHAR2(16 BYTE), 
	"CIUDAD" VARCHAR2(33 BYTE), 
	"PROVINCIA" VARCHAR2(20 BYTE), 
	"CENTRO_ID" NUMBER(10,0)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table PARTE
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."PARTE" 
   (	"NUM_PARTE" NUMBER(10,0), 
	"KM_PRINCIPIO" NUMBER(8,2), 
	"KM_FINAL" NUMBER(8,2), 
	"FECHA" DATE, 
	"ESTADO" VARCHAR2(9 BYTE), 
	"GASTO_GASOIL" NUMBER(8,2), 
	"GASTO_AUTOPISTA" NUMBER(8,2), 
	"GASTO_DIETAS" NUMBER(8,2), 
	"GASTOS_VARIOS" NUMBER(8,2), 
	"INCIDENCIAS" VARCHAR2(300 BYTE), 
	"VALIDADO" VARCHAR2(4 BYTE), 
	"TRABAJADOR_USUARIO" VARCHAR2(20 BYTE), 
	"TOTAL_HORAS" NUMBER(8,2)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table TRABAJADOR
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."TRABAJADOR" 
   (	"USUARIO" VARCHAR2(20 BYTE), 
	"CONTRASENA" VARCHAR2(20 BYTE), 
	"DNI" VARCHAR2(10 BYTE), 
	"NOMBRE" VARCHAR2(20 BYTE), 
	"APELLIDO_1" VARCHAR2(33 BYTE), 
	"APELLIDO_2" VARCHAR2(33 BYTE), 
	"CALLE" VARCHAR2(33 BYTE), 
	"PORTAL" VARCHAR2(5 BYTE), 
	"PISO" VARCHAR2(4 BYTE), 
	"MANO" VARCHAR2(4 BYTE), 
	"CATEGORIA" VARCHAR2(14 BYTE), 
	"TELEFONO_EMPRESA" VARCHAR2(9 BYTE), 
	"TELEFONO_PERSONAL" VARCHAR2(9 BYTE), 
	"SALARIO" NUMBER(8,2), 
	"FECHA_NACIMIENTO" DATE, 
	"CENTRO_ID" NUMBER(10,0)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table VEHICULO
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."VEHICULO" 
   (	"MATRICULA" VARCHAR2(12 BYTE), 
	"MARCA" VARCHAR2(15 BYTE), 
	"MODELO" VARCHAR2(15 BYTE), 
	"PARTE_NUM_PARTE" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table VIAJE
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."VIAJE" 
   (	"ID_VIAJE" NUMBER(10,0), 
	"FECHA" DATE, 
	"HORA_SALIDA" DATE, 
	"HORA_LLEGADA" DATE, 
	"VEHICULO_MATRICULA" VARCHAR2(10 BYTE), 
	"PARTE_NUM_PARTE" NUMBER(10,0), 
	"USUARIO" VARCHAR2(20 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Sequence CENTRO_ID_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "SYSTEM"."CENTRO_ID_SEQ"  MINVALUE 1 MAXVALUE 9999999999 INCREMENT BY 1 START WITH 11 NOCACHE  NOORDER  NOCYCLE  NOPARTITION ;
--------------------------------------------------------
--  DDL for Sequence PARTE_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "SYSTEM"."PARTE_SEQ"  MINVALUE 1 MAXVALUE 9999999999 INCREMENT BY 1 START WITH 9 NOCACHE  NOORDER  NOCYCLE  NOPARTITION ;
--------------------------------------------------------
--  DDL for Sequence SEQ_VIAJE
--------------------------------------------------------

   CREATE SEQUENCE  "SYSTEM"."SEQ_VIAJE"  MINVALUE 1 MAXVALUE 9999999999 INCREMENT BY 1 START WITH 77 NOCACHE  NOORDER  NOCYCLE  NOPARTITION ;
REM INSERTING into SYSTEM.AVISOS
SET DEFINE OFF;
REM INSERTING into SYSTEM.CENTRO
SET DEFINE OFF;
Insert into SYSTEM.CENTRO (NOMBRE,CALLE,NUMERO,CODIGO_POSTAL,TELEFONO,CIUDAD,PROVINCIA,CENTRO_ID) values ('HIMEVITORIA','PORTAL DE FORONDA','80','01010','945 66 66 66','VITORIA','ALAVA','1');
Insert into SYSTEM.CENTRO (NOMBRE,CALLE,NUMERO,CODIGO_POSTAL,TELEFONO,CIUDAD,PROVINCIA,CENTRO_ID) values ('HIMEDONOSTI','PORTAL DE DONOSTI','16','20102','945 66 66 66','DONOSTI','GIPUZKOA','2');
Insert into SYSTEM.CENTRO (NOMBRE,CALLE,NUMERO,CODIGO_POSTAL,TELEFONO,CIUDAD,PROVINCIA,CENTRO_ID) values ('HIMEBILBAO','PORTAL DE BILBAO','6','10203','945 66 66 66','BILBAO','VIZCAYA','3');
Insert into SYSTEM.CENTRO (NOMBRE,CALLE,NUMERO,CODIGO_POSTAL,TELEFONO,CIUDAD,PROVINCIA,CENTRO_ID) values ('HIMELOGROÑO','PORTAL DE LOGROÑO','7','13205','945 66 66 66','LOGROÑO','RIOJA','4');
Insert into SYSTEM.CENTRO (NOMBRE,CALLE,NUMERO,CODIGO_POSTAL,TELEFONO,CIUDAD,PROVINCIA,CENTRO_ID) values ('HIMEPAMPLONA','PORTAL DE PAMPLONA','9','30805','945 66 66 66','PAMPLONA','NAVARR','5');
Insert into SYSTEM.CENTRO (NOMBRE,CALLE,NUMERO,CODIGO_POSTAL,TELEFONO,CIUDAD,PROVINCIA,CENTRO_ID) values ('HIMEZARAGOZA','PORTAL DE ZARAGOZA','8','50950','945 66 66 66','ZARAGOZA','ZARAGOZA','6');
Insert into SYSTEM.CENTRO (NOMBRE,CALLE,NUMERO,CODIGO_POSTAL,TELEFONO,CIUDAD,PROVINCIA,CENTRO_ID) values ('HIMETOLEDO','PORTAL DE TOLEDO','0','40536','945 66 66 66','TOLEDO','TOLEDO','7');
Insert into SYSTEM.CENTRO (NOMBRE,CALLE,NUMERO,CODIGO_POSTAL,TELEFONO,CIUDAD,PROVINCIA,CENTRO_ID) values ('HIMEMADRID','PORTAL DE MADRID','5','40586','945 66 66 66','MADRID','MADRID','8');
Insert into SYSTEM.CENTRO (NOMBRE,CALLE,NUMERO,CODIGO_POSTAL,TELEFONO,CIUDAD,PROVINCIA,CENTRO_ID) values (null,null,null,null,null,null,null,'9');
Insert into SYSTEM.CENTRO (NOMBRE,CALLE,NUMERO,CODIGO_POSTAL,TELEFONO,CIUDAD,PROVINCIA,CENTRO_ID) values ('HIMEZAMORA','PORTAL DEZAMORA','80','50505','945 66 66 66','ZAMORA','ZAMORA','10');
REM INSERTING into SYSTEM.PARTE
SET DEFINE OFF;
Insert into SYSTEM.PARTE (NUM_PARTE,KM_PRINCIPIO,KM_FINAL,FECHA,ESTADO,GASTO_GASOIL,GASTO_AUTOPISTA,GASTO_DIETAS,GASTOS_VARIOS,INCIDENCIAS,VALIDADO,TRABAJADOR_USUARIO,TOTAL_HORAS) values ('14','989','989',to_date('20/02/17','DD/MM/RR'),'ABIERTO','989','989','989','989','9898','NO','BAJO','0');
Insert into SYSTEM.PARTE (NUM_PARTE,KM_PRINCIPIO,KM_FINAL,FECHA,ESTADO,GASTO_GASOIL,GASTO_AUTOPISTA,GASTO_DIETAS,GASTOS_VARIOS,INCIDENCIAS,VALIDADO,TRABAJADOR_USUARIO,TOTAL_HORAS) values ('15','989','989',to_date('20/02/17','DD/MM/RR'),'ABIERTO','989','989','989','989','9898','NO','BAJO','0');
Insert into SYSTEM.PARTE (NUM_PARTE,KM_PRINCIPIO,KM_FINAL,FECHA,ESTADO,GASTO_GASOIL,GASTO_AUTOPISTA,GASTO_DIETAS,GASTOS_VARIOS,INCIDENCIAS,VALIDADO,TRABAJADOR_USUARIO,TOTAL_HORAS) values ('22','989','989',to_date('20/02/17','DD/MM/RR'),'ABIERTO','989','989','989','989','9898','NO','BAJO','0');
Insert into SYSTEM.PARTE (NUM_PARTE,KM_PRINCIPIO,KM_FINAL,FECHA,ESTADO,GASTO_GASOIL,GASTO_AUTOPISTA,GASTO_DIETAS,GASTOS_VARIOS,INCIDENCIAS,VALIDADO,TRABAJADOR_USUARIO,TOTAL_HORAS) values ('23','989','989',to_date('20/02/17','DD/MM/RR'),'ABIERTO','989','989','989','989','9898','NO','BAJO','0');
Insert into SYSTEM.PARTE (NUM_PARTE,KM_PRINCIPIO,KM_FINAL,FECHA,ESTADO,GASTO_GASOIL,GASTO_AUTOPISTA,GASTO_DIETAS,GASTOS_VARIOS,INCIDENCIAS,VALIDADO,TRABAJADOR_USUARIO,TOTAL_HORAS) values ('24','10','80',to_date('01/02/16','DD/MM/RR'),'ABIERTO','24','80','30','30,2',null,'SI','BAJO','0');
Insert into SYSTEM.PARTE (NUM_PARTE,KM_PRINCIPIO,KM_FINAL,FECHA,ESTADO,GASTO_GASOIL,GASTO_AUTOPISTA,GASTO_DIETAS,GASTOS_VARIOS,INCIDENCIAS,VALIDADO,TRABAJADOR_USUARIO,TOTAL_HORAS) values ('25','989','989',to_date('05/03/16','DD/MM/RR'),'ABIERTO','989','989','989','989','9898','NO','BAJO','0');
Insert into SYSTEM.PARTE (NUM_PARTE,KM_PRINCIPIO,KM_FINAL,FECHA,ESTADO,GASTO_GASOIL,GASTO_AUTOPISTA,GASTO_DIETAS,GASTOS_VARIOS,INCIDENCIAS,VALIDADO,TRABAJADOR_USUARIO,TOTAL_HORAS) values ('2','989','989',to_date('04/05/17','DD/MM/RR'),'ABIERTO','989','989','989','989','9898','NO','BAJO','0');
Insert into SYSTEM.PARTE (NUM_PARTE,KM_PRINCIPIO,KM_FINAL,FECHA,ESTADO,GASTO_GASOIL,GASTO_AUTOPISTA,GASTO_DIETAS,GASTOS_VARIOS,INCIDENCIAS,VALIDADO,TRABAJADOR_USUARIO,TOTAL_HORAS) values ('6','333','333',to_date('03/05/17','DD/MM/RR'),'CERRADO','333','33','3333','335','555','NO','NITA','0');
Insert into SYSTEM.PARTE (NUM_PARTE,KM_PRINCIPIO,KM_FINAL,FECHA,ESTADO,GASTO_GASOIL,GASTO_AUTOPISTA,GASTO_DIETAS,GASTOS_VARIOS,INCIDENCIAS,VALIDADO,TRABAJADOR_USUARIO,TOTAL_HORAS) values ('7','23','67',to_date('20/02/17','DD/MM/RR'),'CERRADO','22','22','32','22','NO','NO','PEPI','0');
REM INSERTING into SYSTEM.TRABAJADOR
SET DEFINE OFF;
Insert into SYSTEM.TRABAJADOR (USUARIO,CONTRASENA,DNI,NOMBRE,APELLIDO_1,APELLIDO_2,CALLE,PORTAL,PISO,MANO,CATEGORIA,TELEFONO_EMPRESA,TELEFONO_PERSONAL,SALARIO,FECHA_NACIMIENTO,CENTRO_ID) values ('perico','per','11111','PEDRO','ALVAREZ','RODRIGUEZ','PANAMA','1','2','B','ADMINISTRATIVO','111111111','222222222','1500',to_date('20/01/62','DD/MM/RR'),'1');
Insert into SYSTEM.TRABAJADOR (USUARIO,CONTRASENA,DNI,NOMBRE,APELLIDO_1,APELLIDO_2,CALLE,PORTAL,PISO,MANO,CATEGORIA,TELEFONO_EMPRESA,TELEFONO_PERSONAL,SALARIO,FECHA_NACIMIENTO,CENTRO_ID) values ('JUANITO','JUA','11111','JUAN','PERES','SALAZAR','PANAMA','1','2','B','ADMINISTRATIVO','111111111','222222222','1500',to_date('20/01/62','DD/MM/RR'),'2');
Insert into SYSTEM.TRABAJADOR (USUARIO,CONTRASENA,DNI,NOMBRE,APELLIDO_1,APELLIDO_2,CALLE,PORTAL,PISO,MANO,CATEGORIA,TELEFONO_EMPRESA,TELEFONO_PERSONAL,SALARIO,FECHA_NACIMIENTO,CENTRO_ID) values ('JOSEBA','JOS','11111','ANTONIO','ROSALES','JUAREZ','PANAMA','1','2','B','ADMINISTRATIVO','111111111','222222222','1500',to_date('20/01/62','DD/MM/RR'),'3');
Insert into SYSTEM.TRABAJADOR (USUARIO,CONTRASENA,DNI,NOMBRE,APELLIDO_1,APELLIDO_2,CALLE,PORTAL,PISO,MANO,CATEGORIA,TELEFONO_EMPRESA,TELEFONO_PERSONAL,SALARIO,FECHA_NACIMIENTO,CENTRO_ID) values ('PEPE','PEP','11111','JOSE MARIA','SANTIAGUEZ','MERLO','PANAMA','1','2','B','ADMINISTRATIVO','111111111','222222222','1500',to_date('20/01/62','DD/MM/RR'),'4');
Insert into SYSTEM.TRABAJADOR (USUARIO,CONTRASENA,DNI,NOMBRE,APELLIDO_1,APELLIDO_2,CALLE,PORTAL,PISO,MANO,CATEGORIA,TELEFONO_EMPRESA,TELEFONO_PERSONAL,SALARIO,FECHA_NACIMIENTO,CENTRO_ID) values ('CHARLY','CHARL','11111','CARLOS','SANCHEZ','GRACIA','PANAMA','1','2','B','ADMINISTRATIVO','111111111','222222222','1500',to_date('20/01/62','DD/MM/RR'),'5');
Insert into SYSTEM.TRABAJADOR (USUARIO,CONTRASENA,DNI,NOMBRE,APELLIDO_1,APELLIDO_2,CALLE,PORTAL,PISO,MANO,CATEGORIA,TELEFONO_EMPRESA,TELEFONO_PERSONAL,SALARIO,FECHA_NACIMIENTO,CENTRO_ID) values ('PERCA','CARPA','11111','ANTONIO','ALVAREZ','RODRIGUEZ','PANAMA','1','2','B','TRANSPORTISTA','111111111','222222222','1500',to_date('20/01/62','DD/MM/RR'),'1');
Insert into SYSTEM.TRABAJADOR (USUARIO,CONTRASENA,DNI,NOMBRE,APELLIDO_1,APELLIDO_2,CALLE,PORTAL,PISO,MANO,CATEGORIA,TELEFONO_EMPRESA,TELEFONO_PERSONAL,SALARIO,FECHA_NACIMIENTO,CENTRO_ID) values ('NITA','AJU','11111','JUANA','JUAREZ','SALAZAR','PANAMA','1','2','B','TRANSPORTISTA','111111111','222222222','1500',to_date('20/01/62','DD/MM/RR'),'2');
Insert into SYSTEM.TRABAJADOR (USUARIO,CONTRASENA,DNI,NOMBRE,APELLIDO_1,APELLIDO_2,CALLE,PORTAL,PISO,MANO,CATEGORIA,TELEFONO_EMPRESA,TELEFONO_PERSONAL,SALARIO,FECHA_NACIMIENTO,CENTRO_ID) values ('BAJO','SEA','11111','MARIA','SALVOT','JUAREZ','PANAMA','1','2','B','TRANSPORTISTA','111111111','222222222','1500',to_date('20/01/62','DD/MM/RR'),'3');
Insert into SYSTEM.TRABAJADOR (USUARIO,CONTRASENA,DNI,NOMBRE,APELLIDO_1,APELLIDO_2,CALLE,PORTAL,PISO,MANO,CATEGORIA,TELEFONO_EMPRESA,TELEFONO_PERSONAL,SALARIO,FECHA_NACIMIENTO,CENTRO_ID) values ('GRAPA','PCA3','11111','JOSE MARIA','SANTIAGUEZ','MERLO','PANAMA','1','2','B','TRANSPORTISTA','111111111','222222222','1500',to_date('20/01/62','DD/MM/RR'),'4');
Insert into SYSTEM.TRABAJADOR (USUARIO,CONTRASENA,DNI,NOMBRE,APELLIDO_1,APELLIDO_2,CALLE,PORTAL,PISO,MANO,CATEGORIA,TELEFONO_EMPRESA,TELEFONO_PERSONAL,SALARIO,FECHA_NACIMIENTO,CENTRO_ID) values ('LYLA','A235','11111','EDUARDO','SOLCHIGO','TROJO','PANAMA','1','2','B','TRANSPORTISTA','111111111','222222222','1500',to_date('20/01/62','DD/MM/RR'),'5');
Insert into SYSTEM.TRABAJADOR (USUARIO,CONTRASENA,DNI,NOMBRE,APELLIDO_1,APELLIDO_2,CALLE,PORTAL,PISO,MANO,CATEGORIA,TELEFONO_EMPRESA,TELEFONO_PERSONAL,SALARIO,FECHA_NACIMIENTO,CENTRO_ID) values ('PEPI','PUP','167','PEDRO','ALVAREZ','RODRIGUEZ','PANAMA','1','2','B','TRANSPORTISTA','1234','12345','1500',to_date('20/01/62','DD/MM/RR'),'1');
Insert into SYSTEM.TRABAJADOR (USUARIO,CONTRASENA,DNI,NOMBRE,APELLIDO_1,APELLIDO_2,CALLE,PORTAL,PISO,MANO,CATEGORIA,TELEFONO_EMPRESA,TELEFONO_PERSONAL,SALARIO,FECHA_NACIMIENTO,CENTRO_ID) values ('COPA','1243','126877','PACO','TRETTT','TTTTT','RTTTT','2','2','C','TRANSPORTISTA','3333','67878','3445',to_date('01/05/17','DD/MM/RR'),'2');
REM INSERTING into SYSTEM.VEHICULO
SET DEFINE OFF;
Insert into SYSTEM.VEHICULO (MATRICULA,MARCA,MODELO,PARTE_NUM_PARTE) values ('9999','SEAT','PANDA','14');
Insert into SYSTEM.VEHICULO (MATRICULA,MARCA,MODELO,PARTE_NUM_PARTE) values ('1234','mercedes','gst','6');
Insert into SYSTEM.VEHICULO (MATRICULA,MARCA,MODELO,PARTE_NUM_PARTE) values ('567','mercedes','gst','6');
REM INSERTING into SYSTEM.VIAJE
SET DEFINE OFF;
--------------------------------------------------------
--  DDL for Index CENTRO_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."CENTRO_PK" ON "SYSTEM"."CENTRO" ("CENTRO_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index PARTE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."PARTE_PK" ON "SYSTEM"."PARTE" ("NUM_PARTE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index SYS_C002098
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."SYS_C002098" ON "SYSTEM"."AQ$_INTERNET_AGENTS" ("AGENT_NAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index SYS_C003934
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."SYS_C003934" ON "SYSTEM"."REPCAT$_EXTENSION" ("EXTENSION_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index SYS_C004385
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."SYS_C004385" ON "SYSTEM"."LOGSTDBY$FLASHBACK_SCN" ("PRIMARY_SCN") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" ;
--------------------------------------------------------
--  DDL for Index SYS_C004730
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."SYS_C004730" ON "SYSTEM"."DEF$_AQCALL" ("ENQ_TID", "STEP_NO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index SYS_C004733
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."SYS_C004733" ON "SYSTEM"."DEF$_AQERROR" ("ENQ_TID", "STEP_NO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index TRABAJADOR_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."TRABAJADOR_PK" ON "SYSTEM"."TRABAJADOR" ("USUARIO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index VEHICULO_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."VEHICULO_PK" ON "SYSTEM"."VEHICULO" ("MATRICULA", "PARTE_NUM_PARTE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index VIAJE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."VIAJE_PK" ON "SYSTEM"."VIAJE" ("ID_VIAJE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Trigger CENTRO_ID_TRG
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TRIGGER "SYSTEM"."CENTRO_ID_TRG" BEFORE
  INSERT ON CENTRO FOR EACH ROW  WHEN (NEW.CENTRO_ID IS NULL) BEGIN :NEW.CENTRO_ID := CENTRO_ID_SEQ.NEXTVAL;
END;
/
ALTER TRIGGER "SYSTEM"."CENTRO_ID_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger NOMBRECENTRO_TRG
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TRIGGER "SYSTEM"."NOMBRECENTRO_TRG" BEFORE
  INSERT ON CENTRO FOR EACH ROW  WHEN (NEW.CENTRO_ID IS NULL) BEGIN :NEW.CENTRO_ID := CENTRO_ID_SEQ.NEXTVAL;
END;
/
ALTER TRIGGER "SYSTEM"."NOMBRECENTRO_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger NUM_PARTE_ID_TRG
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TRIGGER "SYSTEM"."NUM_PARTE_ID_TRG" BEFORE
  INSERT ON PARTE FOR EACH ROW  WHEN (NEW.NUM_PARTE IS NULL) BEGIN :NEW.NUM_PARTE := PARTE_SEQ.NEXTVAL;
END;
/
ALTER TRIGGER "SYSTEM"."NUM_PARTE_ID_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Procedure LISPARTESPORRANGO
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYSTEM"."LISPARTESPORRANGO" 
(FECHA1 IN PARTE.FECHA%TYPE, FECHA2 IN PARTE.FECHA%TYPE, TODO OUT sys_refcursor)
IS  
BEGIN
open todo for
SELECT NUM_PARTE, TRABAJADOR_USUARIO, FECHA, ESTADO,  KM_PRINCIPIO, KM_FINAL, GASTO_GASOIL, GASTO_AUTOPISTA, 
GASTO_DIETAS, GASTOS_VARIOS, INCIDENCIAS, VALIDADO,  TOTAL_HORAS  FROM PARTE
WHERE (PARTE.FECHA BETWEEN FECHA1 AND FECHA2);
EXCEPTION
WHEN NO_DATA_FOUND THEN RAISE_APPLICATION_ERROR (-20007, 'No existe el parte');
WHEN OTHERS THEN raise_application_error (-20009, 'Error');
END LISPARTESPORRANGO;

/
--------------------------------------------------------
--  DDL for Procedure LISPARTESPORRANGOABIERTOS
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYSTEM"."LISPARTESPORRANGOABIERTOS" 
(FECHA1 IN PARTE.FECHA%TYPE, FECHA2 IN PARTE.FECHA%TYPE, TODO OUT sys_refcursor)
IS  
BEGIN
open todo for
SELECT NUM_PARTE, TRABAJADOR_USUARIO, FECHA, ESTADO,  KM_PRINCIPIO, KM_FINAL, GASTO_GASOIL, GASTO_AUTOPISTA, 
GASTO_DIETAS, GASTOS_VARIOS, INCIDENCIAS, VALIDADO,  TOTAL_HORAS  FROM PARTE
WHERE (PARTE.FECHA BETWEEN FECHA1 AND FECHA2) AND PARTE.ESTADO = 'ABIERTO';
EXCEPTION
WHEN NO_DATA_FOUND THEN RAISE_APPLICATION_ERROR (-20007, 'No existe el parte');
WHEN OTHERS THEN raise_application_error (-20009, 'Error');
END LISPARTESPORRANGOABIERTOS;

/
--------------------------------------------------------
--  DDL for Procedure LISPARTESPORRANGOCERRADOS
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYSTEM"."LISPARTESPORRANGOCERRADOS" 
(FECHA1 IN PARTE.FECHA%TYPE, FECHA2 IN PARTE.FECHA%TYPE, TODO OUT sys_refcursor)
IS  
BEGIN
open todo for
SELECT NUM_PARTE, TRABAJADOR_USUARIO, FECHA, ESTADO,  KM_PRINCIPIO, KM_FINAL, GASTO_GASOIL, GASTO_AUTOPISTA, 
GASTO_DIETAS, GASTOS_VARIOS, INCIDENCIAS, VALIDADO,  TOTAL_HORAS  FROM PARTE
WHERE (PARTE.FECHA BETWEEN FECHA1 AND FECHA2) AND PARTE.ESTADO = 'CERRADO';
EXCEPTION
WHEN NO_DATA_FOUND THEN RAISE_APPLICATION_ERROR (-20007, 'No existe el parte');
WHEN OTHERS THEN raise_application_error (-20009, 'Error');
END LISPARTESPORRANGOCERRADOS;

/
--------------------------------------------------------
--  DDL for Procedure LISPARTESPORTRABAJADORYRANGO
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYSTEM"."LISPARTESPORTRABAJADORYRANGO" 
(TRAB IN PARTE.TRABAJADOR_USUARIO%TYPE, FECHA1 IN PARTE.FECHA%TYPE, FECHA2 IN PARTE.FECHA%TYPE, TODO OUT sys_refcursor)
IS  
BEGIN
open todo for
SELECT NUM_PARTE, TRABAJADOR_USUARIO, FECHA, ESTADO,  KM_PRINCIPIO, KM_FINAL, GASTO_GASOIL, GASTO_AUTOPISTA, 
GASTO_DIETAS, GASTOS_VARIOS, INCIDENCIAS, VALIDADO,  TOTAL_HORAS  FROM PARTE
WHERE (PARTE.FECHA BETWEEN FECHA1 AND FECHA2) and PARTE.TRABAJADOR_USUARIO= TRAB;
EXCEPTION
WHEN NO_DATA_FOUND THEN RAISE_APPLICATION_ERROR (-20007, 'No existe el parte');
WHEN OTHERS THEN raise_application_error (-20009, 'Error');
END LISPARTESPORTRABAJADORYRANGO;

/
--------------------------------------------------------
--  DDL for Procedure LISPARTESTRABAJADORYRANGOABI
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYSTEM"."LISPARTESTRABAJADORYRANGOABI" 
(TRAB IN PARTE.TRABAJADOR_USUARIO%TYPE, FECHA1 IN PARTE.FECHA%TYPE, FECHA2 IN PARTE.FECHA%TYPE, TODO OUT sys_refcursor)
IS  
BEGIN
open todo for
SELECT NUM_PARTE, TRABAJADOR_USUARIO, FECHA, ESTADO,  KM_PRINCIPIO, KM_FINAL, GASTO_GASOIL, GASTO_AUTOPISTA, 
GASTO_DIETAS, GASTOS_VARIOS, INCIDENCIAS, VALIDADO,  TOTAL_HORAS  FROM PARTE
WHERE (PARTE.FECHA BETWEEN FECHA1 AND FECHA2) and PARTE.TRABAJADOR_USUARIO= TRAB AND PARTE.ESTADO = 'ABIERTO';
EXCEPTION
WHEN NO_DATA_FOUND THEN RAISE_APPLICATION_ERROR (-20007, 'No existe el parte');
WHEN OTHERS THEN raise_application_error (-20009, 'Error');
END LISPARTESTRABAJADORYRANGOABI;

/
--------------------------------------------------------
--  DDL for Procedure LISPARTESTRABAJADORYRANGOCER
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYSTEM"."LISPARTESTRABAJADORYRANGOCER" 
(TRAB IN PARTE.TRABAJADOR_USUARIO%TYPE, FECHA1 IN PARTE.FECHA%TYPE, FECHA2 IN PARTE.FECHA%TYPE, TODO OUT sys_refcursor)
IS  
BEGIN
open todo for
SELECT NUM_PARTE, TRABAJADOR_USUARIO, FECHA, ESTADO,  KM_PRINCIPIO, KM_FINAL, GASTO_GASOIL, GASTO_AUTOPISTA, 
GASTO_DIETAS, GASTOS_VARIOS, INCIDENCIAS, VALIDADO,  TOTAL_HORAS  FROM PARTE
WHERE (PARTE.FECHA BETWEEN FECHA1 AND FECHA2) and PARTE.TRABAJADOR_USUARIO= TRAB AND PARTE.ESTADO = 'CERRADO';
EXCEPTION
WHEN NO_DATA_FOUND THEN RAISE_APPLICATION_ERROR (-20007, 'No existe el parte');
WHEN OTHERS THEN raise_application_error (-20009, 'Error');
END LISPARTESTRABAJADORYRANGOCER;

/
--------------------------------------------------------
--  DDL for Procedure LISTAPARTESABIERTOS
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYSTEM"."LISTAPARTESABIERTOS" (LISTA OUT SYS_REFCURSOR)
AS
VACIO EXCEPTION;
MAS_ERRORES EXCEPTION;
BEGIN
OPEN LISTA FOR
SELECT NUM_PARTE, KM_PRINCIPIO, KM_FINAL, FECHA, ESTADO, GASTO_GASOIL, GASTO_AUTOPISTA, 
GASTO_DIETAS, GASTOS_VARIOS, INCIDENCIAS, VALIDADO, TRABAJADOR_USUARIO, TOTAL_HORAS  FROM PARTE
WHERE ESTADO = 'ABIERTO'
ORDER BY TRABAJADOR_USUARIO, FECHA;
EXCEPTION
WHEN NO_DATA_FOUND THEN RAISE VACIO;
WHEN OTHERS THEN RAISE MAS_ERRORES;
END LISTAPARTESABIERTOS;

/
--------------------------------------------------------
--  DDL for Procedure LISTAPARTESCERRADOS
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYSTEM"."LISTAPARTESCERRADOS" (LISTA OUT SYS_REFCURSOR)
AS
BEGIN
OPEN LISTA FOR
SELECT NUM_PARTE, KM_PRINCIPIO, KM_FINAL, FECHA, ESTADO, GASTO_GASOIL, GASTO_AUTOPISTA, 
GASTO_DIETAS, GASTOS_VARIOS, INCIDENCIAS, VALIDADO, TRABAJADOR_USUARIO, TOTAL_HORAS  FROM PARTE
WHERE ESTADO = 'CERRADO'
ORDER BY TRABAJADOR_USUARIO, FECHA;
EXCEPTION
WHEN NO_DATA_FOUND THEN RAISE_APPLICATION_ERROR (-20007, 'No existe el trabajador');
WHEN TOO_MANY_ROWS THEN raise_application_error (-2008, 'Más de un resultado');
WHEN OTHERS THEN raise_application_error (-2009, 'Error');
END LISTAPARTESCERRADOS;

/
--------------------------------------------------------
--  DDL for Procedure LISTARPARTES
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYSTEM"."LISTARPARTES" (LISTA OUT SYS_REFCURSOR)
AS
VACIO EXCEPTION;
MAS_ERRORES EXCEPTION;
BEGIN
OPEN LISTA FOR
SELECT NUM_PARTE, KM_PRINCIPIO, KM_FINAL, FECHA, ESTADO, GASTO_GASOIL, GASTO_AUTOPISTA, 
GASTO_DIETAS, GASTOS_VARIOS, INCIDENCIAS, VALIDADO, TRABAJADOR_USUARIO, TOTAL_HORAS  FROM PARTE
ORDER BY TRABAJADOR_USUARIO, FECHA;
EXCEPTION
WHEN NO_DATA_FOUND THEN RAISE VACIO;
WHEN OTHERS THEN RAISE MAS_ERRORES;
END LISTARPARTES;

/
--------------------------------------------------------
--  DDL for Procedure LISTARUNCENTRO
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYSTEM"."LISTARUNCENTRO" (  NOMBRE_CENTRO IN CENTRO.NOMBRE%TYPE, todo OUT sys_refcursor)
IS
VACIO EXCEPTION;
MAS_ERRORES EXCEPTION;  
BEGIN
open todo for
SELECT NOMBRE, CALLE, NUMERO, CODIGO_POSTAL, TELEFONO, CIUDAD, PROVINCIA, CENTRO_ID FROM CENTRO WHERE NOMBRE = NOMBRE_CENTRO;
EXCEPTION
WHEN NO_DATA_FOUND THEN RAISE VACIO;
END LISTARUNCENTRO;

/
--------------------------------------------------------
--  DDL for Procedure LISTARUNTRABAJADOR
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYSTEM"."LISTARUNTRABAJADOR" ( dni_trabajador IN TRABAJADOR.DNI%TYPE, TODO OUT sys_refcursor)
IS  
BEGIN
open todo for
SELECT DNI, NOMBRE, APELLIDO_1, APELLIDO_2, CALLE, PORTAL, PISO, MANO, CATEGORIA, CENTRO_ID, TELEFONO_EMPRESA, TELEFONO_PERSONAL, SALARIO, FECHA_NACIMIENTO
FROM TRABAJADOR WHERE DNI = dni_trabajador;
EXCEPTION
WHEN NO_DATA_FOUND THEN RAISE_APPLICATION_ERROR (-20007, 'No existe el trabajador');
WHEN TOO_MANY_ROWS THEN raise_application_error (-2008, 'Más de un resultado');
WHEN OTHERS THEN raise_application_error (-2009, 'Error');
END LISTARUNTRABAJADOR;

/
--------------------------------------------------------
--  DDL for Procedure LISTATRABAJADORES
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYSTEM"."LISTATRABAJADORES" (LISTA OUT SYS_REFCURSOR)
AS
VACIO EXCEPTION;
MAS_ERRORES EXCEPTION;
BEGIN
OPEN LISTA FOR
SELECT * FROM TRABAJADOR;
EXCEPTION
WHEN NO_DATA_FOUND THEN RAISE VACIO;
WHEN OTHERS THEN RAISE MAS_ERRORES;
END LISTATRABAJADORES;

/
--------------------------------------------------------
--  DDL for Procedure LISTAVEHICULOS
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYSTEM"."LISTAVEHICULOS" (LISTAV OUT SYS_REFCURSOR)
AS
VACIO EXCEPTION;
MAS_ERRORES EXCEPTION;
BEGIN
OPEN LISTAV FOR
SELECT * FROM VEHICULO;
EXCEPTION
WHEN NO_DATA_FOUND THEN RAISE VACIO;
WHEN OTHERS THEN RAISE MAS_ERRORES;
END LISTAVEHICULOS;

/
--------------------------------------------------------
--  DDL for Procedure LISTACENTROS
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "SYSTEM"."LISTACENTROS" (LISTAC OUT SYS_REFCURSOR)
AS
VACIO EXCEPTION;
MAS_ERRORES EXCEPTION;
BEGIN
OPEN LISTAC FOR
SELECT * FROM CENTRO;
EXCEPTION
WHEN NO_DATA_FOUND THEN RAISE VACIO;
WHEN OTHERS THEN RAISE MAS_ERRORES;
END LISTACENTROS;

/
--------------------------------------------------------
--  DDL for Package Body DBMS_REPCAT_AUTH
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE PACKAGE BODY "SYSTEM"."DBMS_REPCAT_AUTH" wrapped
a000000
1
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
b
bcd 3bd
UD4sZ8/8PJg/Os0vxpYCUrIxzj0wg5UrzCCDfC8Zx6oCSS7hFCveVRpIhBB8+pRR09oNpCtB
UYkwYv0vjhUdCarkfkmy0S6I6ZQNabj/M/5Vv78tpHDBnv6mMiba5vrNfogBwH9KThaHQ/7n
Tre2RooP3U0dSIWmviEGsdYbH1SpKKLK0A6oydwsAwNh7DrYf4+H0I/7JYKYicumt2+bMAI7
j2ZJkW5louadmdiMX0h9+Izhj7NN2Ex9QtvIVG0/h8rEHsfNPD6yqYkzSljq8DZ1UhFIpw1t
qEetfFLyFrLf7KPN10XuQgqiZRwxkbgd3BZ+UDxvJoIOdpctzd64hmfKevJQZCIvouksBID8
k+fS0Q1gB0WpIocOchckvJCqMV/sCBjUhvdvSIK0Xv71WnjK4ubRGYq84AqbTffzahwHzUJF
6neAF5h+emapJj3zKIiMAJR949BTnr8DxnzzNFDDlFp5bD0hW7byUWlDUOJqp+JwRub/aQH2
P3NIw8s3MnhgkGhJMmNGp8uT+yH2w4v9yecqHIxjvaCIveUcKCiu8p6FMlqNWawQEUjkfowM
eo9pYHbDvxNGr8iHNbLZbIz5a3or0dmWtKU+2DkH+1dRO+FNCIMWdHGNHBqex76Hi8Cfo36y
T5diFVcOzyPxUWbJO3PncYHR3Rsldd9xhq1OwM+WF1LpvCyG0T4pzSytIlQusosPvkrUKfUq
E5YPQ8myd5Bu2Vb/AZvhUP0CQhfdPbUh7RIB3Zm5q+mhZRBsw+4/ELlvk0VXhYL9n7URVsKh
7C6bgdppYL+TRXvoK2pJt8Lx0FpxLxxMIBucGFdPGk6/qPDJZZ2ut+/AxgqRUblCQkEuSOq+
eidAwZ2wtvZyEB4LhqpRmg7oKIwP25PY02IDTNF1gpJj9vG+aZB1maci+Ig2y2/zy+mdTu4s
TUOORg==

/
--------------------------------------------------------
--  DDL for Package DBMS_REPCAT_AUTH
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE PACKAGE "SYSTEM"."DBMS_REPCAT_AUTH" wrapped
a000000
1
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
9
bf d6
0cfc6e4Sm6mfaMYwsbW2JygBepcwg/BKmJ4VZy/pO06UXsVUMejsissTcGWYR4qeK4TPqfDK
q7UPH+SmKP6nW9zmxMZnuK1VDzM0Iv9O4E4SvvsnHWn+EPF9hR+oBFe3fEro6RQ5R5Ejd1nr
e+fAK010dExf76gg/c6ZB3YxGPHDOqkGI4lV6HNsd57gKLwTd0bxan5UwJriIpt7Vjc=

/
--------------------------------------------------------
--  DDL for Function LOGMNR$COL_GG_TABF_PUBLIC
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE FUNCTION "SYSTEM"."LOGMNR$COL_GG_TABF_PUBLIC" wrapped
a000000
1
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
3c36 9ca
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
2LyIDQ8tBH+MqpIsGqIsNg==

/
--------------------------------------------------------
--  DDL for Function LOGMNR$KEY_GG_TABF_PUBLIC
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE FUNCTION "SYSTEM"."LOGMNR$KEY_GG_TABF_PUBLIC" wrapped
a000000
1
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
2e13 be5
O/KmLl1NP2JZ5iwpk0PI9iaI0cMwgw2jkyCG3y+5A6pENzZUJtUEYfGfLRNFqVmzSqOTwDJX
E0n7AKlh3WEoBTPeqs8HnKIJFOl4uvvMfpsT7rhXbtaLa2S46neUxR6GJidInUlyaghX9TH5
fG74EJNwoOaK9JfrUPFhRKWy5ZLrQSG9rGFe+U0/VRdiJv6aLi814tJMISNxT9zpeKBT8Tue
lWtHSjsRgK2tkRAxay5WWN8aHhOeDXJ5gNz2EJ6yr2J7HxcJb5T6zLPiqU0SIrYharKT63TY
mWnguFBnoWkQuGWc3VGX+hKgqmD4UZfswWtNe8AU12oYSurDU4rHZcMyMvqXZnJ7L0SxXAUB
XBdpDr/aoBBp46sJIu86MOMlW3uOEW3ZV9Lp0cNgvioaRGOvJTJB9F7Kuf2R7rw4WfxJVE0Z
e3pEppEBqi8G2AVFNXy42nCOOFwl4HG/RkkezKPqhc9L4KGrvuAMCxJWb435DRoUU4zAaBHP
JmDliqLJ8Ef5oCthaIRzw/c5MFcjyTS4TP+DZwJQz7d9hOa3BFzeqiNWpe9zPxH8thgwKKpt
PjdC2H9VWO/v8H8DTyqUr24IdNvEbmv7slyBAfR2q702/wcin1NMmSqtjtRd1koNUG4u1u+L
ccRZiKWdDsv/nidyk4RhSO3voJD1lqBkOh0nwJR+G5d8LfXM4jQfIiZusn0t1faiD/o0W2gE
EDtGbMhA2NKUXt/ry94SDPvJXNEXpF+w4UzWQJQ0YKeBUwW//Dy/HZarm+ACxdGPE5C501Z9
NCZy2Lu6lok+4V+RzFQ5dJyn4jkFDZjeHQXMJV2/cdebCm1DV/eQJo4FUfTeJhWWclkJh0h0
XbypV42A2LV0kmwu/m5oY39QfnQXSGlgrMM5+aKZAok3klVfmS9wNgCQZZqDwGjOJEoK1Hky
zw0AWkoS8hAsulnIQukcTsrrJtruKqRmShx7+ySov7qHj0jdiD8Ud1oHvMU/faFfvDpveeQV
YlJ7eJW9UQAXbEZbuTIB0Ge6SK88jwNDs4DUpBodaGZLNLD63Y+zHpMbLzXc4x5uolcP6yGL
G6GcF7dHthgxx8TYGYicsQkEJo/PsojVFBv+UoXI/kGogLoM305SCyBuh+P/GXVfOuz6VH7S
OoylBNbN+1TiBezyUhN+02S9iR0CbF4GICK5pkH/4VMcOAe8bNdi/IFZhAdwVMa6RseW6OJI
WJAeoWs3rBA/bSckT9POFBymgN26+uchQO3angp8i6mb1Uv1tluMHtUED/uBi5bHiIv7BdPh
G4pWkQUtJQVQZu/yt5i0HKNWiZZtuOX+p/8Bf91zKPP/G8Z63Qg3+2fFowzBJ89teebyp/nY
NVZvxxFQMWQpObxYZLNTM634IbtPCcXYyVQrt7c0PMknITWRHJwDrm+3WNPtzVbrtwR/3AC2
WJwlQCc+sGHZq6cxACoX0mxFrpoZnXOSLpIzHgTh8UqmA0ButO41PdKxdvTiq0IPoExtZvPN
xJmVafxtMGgBzMNU7Y8wRl7yc+xMDnNZ4UaOpAxxdpVaNJtJhy8VvlVHTtGDY2NMTkiHudpl
59TsuyGuZn9RMM0ch4sFbc8OD1abRGCOOjOOhHCi8Lv/L7mn8s9wojur+Wyn0cwGTq61gPRy
0ph+6Hdf24lq3Tc9c5Rj7S84a+J4af9lkwbh35xG0Y1OOA3PuKhkTXG4/f5RRFFcQ9TbVrgS
lZ1F5Z8oVmiQXNplHUvDIQW8IVZQdFrOqDyL0J6HF1dgAh86XdUorKdTNnYvYi11nuT6Im8n
KXsyQvV9s6RF0aFd4lHOu47VD5WjWdWd8LfN4LJ61YXJbLjluDQFSBkaLc67TeNV74salRqX
bfwRPN1Ok7hJT0gZvDE/RO9I4hyKCaBEGtiLWi2GePthVmbcRWqRlqf/D8CwvOzaTOMYVxpd
3CQM181KsP4MlHgWj2+UGDnwSCuPb/KyfgrIXurEFi3t7dzgUgTIg2ZS82kwZbXjHTdXsjY8
a1NpQBDOhWGeg12V1UtVoJlZJhr+utBsUxCJ4O1kIFkBJ9vo4VzmXX3YwYkCK/ljyfVc71GL
jvvtkPQgUp9lSNzdCMFpLn9hV3tzCcGyZU5a2kE1bPvu+j8VAoera4SG4PmtVAQHfNlGN9gf
rt7hzl++mMFXxgg2T5vkxD7ih00dhtsRMjvFNEkMr6stbng68JXAnjJMeyYcuw6lUipJRuDX
HaKP4TRbVyed/s7UQkbHPTrXwyno+7ZduamsD6ct9mMCiFbisLVuwjTY43x1rXK/MEhYjUNn
IIWpDcEaa3gY6BQPyfV9NwfI4vp8iPLAqEMwPRcNScZRUXMhO9n+sJ8v2QXIViyFlcx242+P
XDL0l61haNUjxMcU8IAlCGBn6dFVFuqF0z8yVrNIqZUoVglFCU6w6H2F3Wx6HO/pwwxAtfJo
n/zC7VKMzVUKrk9Wzr8sqjrOCMlbkBh1n10HT6qNZ3XWpE7+ICQMRxok2tJyLKqcaVgBrTe1
BIVtHZLrTywi5DOxpQiwJDaHPWWdjVx2X5VjiAz+WlNOj78eFolpHSJ8C48b32D3s1DUR7yM
6S6+6G05/Ix4lRFJ+SIlYBgCiCzdLdaEUeqzEQTB/mr1TZ8mfLNI89HorZLYrUXYHgPKjB8Z
3UEpnbHki6RPxDSWHzWuVlYZI0R84JTxzZRByuMs4LbSwIeeLMban1kJgVj1FUWTU+N9KTZe
KA81M1XWlJytMuEZzql6kXof34VUjPZ8DTnqvT2fwchgQkp2dDThX/60jqMxi2/sse+DuNj6
jOstNnjSgmGYEZP04tMtQFuBVhiSW/cy129Wva1NOD4KjypFlLHFTg5b4e2Xo+TyGC6Xpzbx
s1JJe+7CzklFwSxUcai7f60DZ576DAInLwreSe7m5JMPk3OItnzVo2Y5lCIzRHYN9sRorszo
dxcJnET5wG089kQDJTT97ZJZ2syRfWI8dxVA8+I/6UP5Bg/qXx8p

/
--------------------------------------------------------
--  DDL for Function LOGMNR$SEQ_GG_TABF_PUBLIC
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE FUNCTION "SYSTEM"."LOGMNR$SEQ_GG_TABF_PUBLIC" wrapped
a000000
1
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
11c6 58f
gySaLpM2/dy/FuJ95b/w61eAZaYwg81Ur0gFVy9VA52sZ+HDJ0RrvayO9BPh0yorU9XMh/Hl
HrepeR8RmZEShbk7LJqICcKhk8A0Z0rzLzEULCz6WEJu9Oo7XWAh8Vwukwwy4u5y4lbat0MK
SFWLjY9+r4q2XDKwNfY2T38xPK1NRjgPTGj41xu1AASLLkyZ697R+BkwysNwo2xYGScdMqvi
ZKn2YW/2TUZGrL3t3aHJmDmfqR5lY3vaRhbGR7j4lEvJKgwipgJWj7bZxFYfZV4F3FodbE1s
YgcTv05FK45zi5yZg8RI1Xrzde8TqMoglP3zAwXaMzzxIf0hLtXXdN0usfDgWuLaHFKqguB8
yRWQr3PLcgZmfCMgLLKUpTi7opx0HC0oCAIA9TRcjY3sMf7nvPcO/7SisEcncFtoYZyH+hG9
QQgScDI1LbGyzX9aWkoPM8p+1U017M/299U9d2vrQsE0hANikcconk2NIzntCzcQgpNWrDJe
9gHmMZYHhkGzmrZH9u918FACJzyfioTnDVIfzgCCSRIZeFy1bnZ0Lnv9y7l9hk0WqXhEor58
MDRNoUyRcdS9mFmF+x0PqFMp2NVemx2SAVUWX/5deeSLPmHVkZh71EDvbFoa4K7ATHHGzpx2
7hXewrjaE0td7oYwgOjA4Lgsa6QFd2D53IgL1a4e5mFclDbka8XLyq72rGbBbir6TcQ9Dv+T
2XpYIUltGrL3r9svMXaUXhMl3/9W6SD/L6nRPRte3+h4J9eHAwrZEwoTHr+ceLEE50f9/4IA
K4bCF8IsYAF2RZ4i5g2YmscWAhSICU2OQjuYGVqewlHW0LP154EAWmwuBrbGtr42u87ep9Nf
HqLDIR8ChxzccfkurHr9llU66Jy0FjgOx/1W2YUFKdtEmydhxVMQgU7BNvkzCLvGxgPadtKf
rfDPzpsypgbz6H+1EPhlcDOLE0D5zh74pmNN7DkQ+Qilpc2auQhOJAB3xIMVoy7YYP8Vz0dH
AIWVvMmoFo870Ss8vpjIKWonH60AmWOfd8+N8f1Qyom53si180QMvmk1r4MFnVEjrNHNvKbn
DpgJ9sMLlXU8EzKq9eUkfHd9hrKYVLmX4mvP9LgUudZSwvLg80zRvU4ZSUzwjMbcz8tKF1gZ
nU/WbEEt3nslRU5jsdp4chkHGXQncjh5FaVLd0FDMh8mcn4SSgbGmYp7wcm+q7MTONqLUIxu
i3L9sgDXj2M03hwoj7RavBSNh8BNIwYULcbczdz/gDb0jTFtFA8UOmb6wZxdUPxO1c8GS2Ek
CXDMxZPWksMjT7euocQ7blnEM+dYUFAX0gFpznOqvI8sErDH4Oj41hTQv8ZEDF4ohGPu+Z8O
LHoRyOnvmNSElS2YwkDmkTWY+c0fvRhsDg==

/
--------------------------------------------------------
--  DDL for Function LOGMNR$TAB_GG_TABF_PUBLIC
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE FUNCTION "SYSTEM"."LOGMNR$TAB_GG_TABF_PUBLIC" wrapped
a000000
1
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
8
3aea c6f
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

/
--------------------------------------------------------
--  DDL for Synonymn CATALOG
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE SYNONYM "SYSTEM"."CATALOG" FOR "SYS"."CATALOG";
--------------------------------------------------------
--  DDL for Synonymn COL
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE SYNONYM "SYSTEM"."COL" FOR "SYS"."COL";
--------------------------------------------------------
--  DDL for Synonymn PRODUCT_USER_PROFILE
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE SYNONYM "SYSTEM"."PRODUCT_USER_PROFILE" FOR "SYSTEM"."SQLPLUS_PRODUCT_PROFILE";
--------------------------------------------------------
--  DDL for Synonymn PUBLICSYN
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE SYNONYM "SYSTEM"."PUBLICSYN" FOR "SYS"."PUBLICSYN";
--------------------------------------------------------
--  DDL for Synonymn SYSCATALOG
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE SYNONYM "SYSTEM"."SYSCATALOG" FOR "SYS"."SYSCATALOG";
--------------------------------------------------------
--  DDL for Synonymn SYSFILES
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE SYNONYM "SYSTEM"."SYSFILES" FOR "SYS"."SYSFILES";
--------------------------------------------------------
--  DDL for Synonymn TAB
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE SYNONYM "SYSTEM"."TAB" FOR "SYS"."TAB";
--------------------------------------------------------
--  DDL for Synonymn TABQUOTAS
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE SYNONYM "SYSTEM"."TABQUOTAS" FOR "SYS"."TABQUOTAS";
--------------------------------------------------------
--  DDL for Queue DEF$_AQERROR
--------------------------------------------------------

   BEGIN DBMS_AQADM.CREATE_QUEUE(
     Queue_name          => 'SYSTEM.DEF$_AQERROR',
     Queue_table         => 'SYSTEM.DEF$_AQERROR',
     Queue_type          =>  0,
     Max_retries         =>  5,
     Retry_delay         =>  0,
     dependency_tracking =>  TRUE,
     comment             => 'Error Queue for Deferred RPCs');
  END;
/
--------------------------------------------------------
--  DDL for Queue DEF$_AQCALL
--------------------------------------------------------

   BEGIN DBMS_AQADM.CREATE_QUEUE(
     Queue_name          => 'SYSTEM.DEF$_AQCALL',
     Queue_table         => 'SYSTEM.DEF$_AQCALL',
     Queue_type          =>  0,
     Max_retries         =>  5,
     Retry_delay         =>  0,
     dependency_tracking =>  TRUE,
     comment             => 'Deferred RPC Queue');
  END;
/
--------------------------------------------------------
--  DDL for Queue Table DEF$_AQCALL
--------------------------------------------------------

   BEGIN DBMS_AQADM.CREATE_QUEUE_TABLE(
     Queue_table        => '"SYSTEM"."DEF$_AQCALL"',
     Queue_payload_type => 'VARIANT',
     storage_clause     => 'PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 TABLESPACE SYSTEM',
     Sort_list          => 'ENQ_TIME',
     Compatible         => '8.0.3');
  END;
/
--------------------------------------------------------
--  DDL for Queue Table DEF$_AQERROR
--------------------------------------------------------

   BEGIN DBMS_AQADM.CREATE_QUEUE_TABLE(
     Queue_table        => '"SYSTEM"."DEF$_AQERROR"',
     Queue_payload_type => 'VARIANT',
     storage_clause     => 'PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 TABLESPACE SYSTEM',
     Sort_list          => 'ENQ_TIME',
     Compatible         => '8.0.3');
  END;
/
--------------------------------------------------------
--  Constraints for Table AVISOS
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."AVISOS" MODIFY ("FECHA_AVISO" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."AVISOS" MODIFY ("TRABAJADOR_USUARIO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CENTRO
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."CENTRO" ADD CONSTRAINT "CENTRO_PK" PRIMARY KEY ("CENTRO_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "SYSTEM"."CENTRO" MODIFY ("CENTRO_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PARTE
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."PARTE" ADD CONSTRAINT "PARTE_PK" PRIMARY KEY ("NUM_PARTE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "SYSTEM"."PARTE" ADD CONSTRAINT "PAR_VALID_CK" CHECK (Validado IN ('SI', 'NO')) ENABLE;
  ALTER TABLE "SYSTEM"."PARTE" ADD CONSTRAINT "PAR_EST_CK" CHECK (ESTADO IN ('ABIERTO', 'CERRADO')) ENABLE;
  ALTER TABLE "SYSTEM"."PARTE" MODIFY ("TRABAJADOR_USUARIO" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."PARTE" MODIFY ("VALIDADO" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."PARTE" MODIFY ("ESTADO" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."PARTE" MODIFY ("FECHA" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."PARTE" MODIFY ("KM_FINAL" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."PARTE" MODIFY ("KM_PRINCIPIO" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."PARTE" MODIFY ("NUM_PARTE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table TRABAJADOR
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."TRABAJADOR" ADD CONSTRAINT "TRABAJADOR_PK" PRIMARY KEY ("USUARIO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "SYSTEM"."TRABAJADOR" ADD CONSTRAINT "TRAB_CAT_CK" CHECK (CATEGORIA IN ('ADMINISTRATIVO', 'TRANSPORTISTA')) ENABLE;
  ALTER TABLE "SYSTEM"."TRABAJADOR" MODIFY ("CENTRO_ID" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."TRABAJADOR" MODIFY ("TELEFONO_EMPRESA" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."TRABAJADOR" MODIFY ("CATEGORIA" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."TRABAJADOR" MODIFY ("PORTAL" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."TRABAJADOR" MODIFY ("CALLE" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."TRABAJADOR" MODIFY ("APELLIDO_2" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."TRABAJADOR" MODIFY ("APELLIDO_1" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."TRABAJADOR" MODIFY ("NOMBRE" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."TRABAJADOR" MODIFY ("DNI" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."TRABAJADOR" MODIFY ("CONTRASENA" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."TRABAJADOR" MODIFY ("USUARIO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table VEHICULO
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."VEHICULO" ADD CONSTRAINT "VEHICULO_PK" PRIMARY KEY ("MATRICULA", "PARTE_NUM_PARTE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "SYSTEM"."VEHICULO" MODIFY ("PARTE_NUM_PARTE" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."VEHICULO" MODIFY ("MATRICULA" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table VIAJE
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."VIAJE" ADD CONSTRAINT "VIAJE_PK" PRIMARY KEY ("ID_VIAJE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "SYSTEM"."VIAJE" MODIFY ("USUARIO" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."VIAJE" MODIFY ("PARTE_NUM_PARTE" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."VIAJE" MODIFY ("VEHICULO_MATRICULA" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."VIAJE" MODIFY ("HORA_LLEGADA" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."VIAJE" MODIFY ("HORA_SALIDA" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."VIAJE" MODIFY ("FECHA" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."VIAJE" MODIFY ("ID_VIAJE" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table PARTE
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."PARTE" ADD CONSTRAINT "PARTE_TRABAJADOR_FK" FOREIGN KEY ("TRABAJADOR_USUARIO")
	  REFERENCES "SYSTEM"."TRABAJADOR" ("USUARIO") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table TRABAJADOR
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."TRABAJADOR" ADD CONSTRAINT "TRABAJADOR_CENTRO_FK" FOREIGN KEY ("CENTRO_ID")
	  REFERENCES "SYSTEM"."CENTRO" ("CENTRO_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table VEHICULO
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."VEHICULO" ADD CONSTRAINT "VEHICULO_PARTE_FK" FOREIGN KEY ("PARTE_NUM_PARTE")
	  REFERENCES "SYSTEM"."PARTE" ("NUM_PARTE") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table VIAJE
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."VIAJE" ADD CONSTRAINT "VIAJE_PARTE_FK" FOREIGN KEY ("PARTE_NUM_PARTE")
	  REFERENCES "SYSTEM"."PARTE" ("NUM_PARTE") ENABLE;
