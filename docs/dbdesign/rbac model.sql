CREATE TABLE "users" (
"id" int8 NOT NULL,
"alias" varchar(100) COLLATE "default" NOT NULL DEFAULT ''::character varying,
"name" varchar(100) COLLATE "default" NOT NULL DEFAULT ''::character varying,
"surname" varchar(100) COLLATE "default" NOT NULL DEFAULT ''::character varying,
"email" varchar(100) NOT NULL,
"passwd" char(32) COLLATE "default" NOT NULL DEFAULT ''::bpchar,
"groupid" int8,
"positionid" int8,
"url" varchar(255) COLLATE "default" NOT NULL DEFAULT ''::character varying,
"autologin" int4 NOT NULL DEFAULT 0,
"autologout" varchar(32) COLLATE "default" NOT NULL DEFAULT '15m'::character varying,
"lang" varchar(5) COLLATE "default" NOT NULL DEFAULT 'en_GB'::character varying,
"refresh" varchar(32) COLLATE "default" NOT NULL DEFAULT '30s'::character varying,
"type" int4 NOT NULL DEFAULT 1,
"theme" varchar(128) COLLATE "default" NOT NULL DEFAULT 'default'::character varying,
"attempt_failed" int4 NOT NULL DEFAULT 0,
"attempt_ip" varchar(39) COLLATE "default" NOT NULL DEFAULT ''::character varying,
"attempt_clock" int4 NOT NULL DEFAULT 0,
"rows_per_page" int4 NOT NULL DEFAULT 50,
"created_time" timestamp,
"updated_time" timestamp,
CONSTRAINT "users_pkey" PRIMARY KEY ("id") 
)
WITHOUT OIDS;
CREATE UNIQUE INDEX "users_1" ON "users" USING btree ("alias" "pg_catalog"."text_ops" ASC NULLS LAST);
ALTER TABLE "users" OWNER TO "zabbix";

CREATE TABLE "users_roles" (
"id" int8 NOT NULL,
"userid" int8 NOT NULL,
"roleid" int8 NOT NULL,
"status" int4 NOT NULL,
"created_time" timestamp,
"updated_time" timestamp,
CONSTRAINT "users_groups_pkey" PRIMARY KEY ("id") 
)
WITHOUT OIDS;
CREATE UNIQUE INDEX "users_groups_1" ON "users_roles" USING btree ("userid" "pg_catalog"."int8_ops" ASC NULLS LAST, "roleid" "pg_catalog"."int8_ops" ASC NULLS LAST);
CREATE INDEX "users_groups_2" ON "users_roles" USING btree ("roleid" "pg_catalog"."int8_ops" ASC NULLS LAST);
ALTER TABLE "users_roles" OWNER TO "zabbix";

CREATE TABLE "menu" (
"usrgrpid" int8 NOT NULL,
"name" varchar(64) COLLATE "default" NOT NULL DEFAULT ''::character varying,
"gui_access" int4 NOT NULL DEFAULT 0,
"users_status" int4 NOT NULL DEFAULT 0,
"debug_mode" int4 NOT NULL DEFAULT 0,
CONSTRAINT "usrgrp_pkey" PRIMARY KEY ("usrgrpid") 
)
WITHOUT OIDS;
CREATE UNIQUE INDEX "usrgrp_1" ON "menu" USING btree ("name" "pg_catalog"."text_ops" ASC NULLS LAST);
ALTER TABLE "menu" OWNER TO "zabbix";

CREATE TABLE "sessions" (
"id" int8 NOT NULL DEFAULT ''::character varying,
"userid" int8 NOT NULL,
"lastaccess" int4 NOT NULL DEFAULT 0,
"status" int4 NOT NULL DEFAULT 0,
CONSTRAINT "sessions_pkey" PRIMARY KEY ("id") 
)
WITHOUT OIDS;
CREATE INDEX "sessions_1" ON "sessions" USING btree ("userid" "pg_catalog"."int8_ops" ASC NULLS LAST, "status" "pg_catalog"."int4_ops" ASC NULLS LAST, "lastaccess" "pg_catalog"."int4_ops" ASC NULLS LAST);
ALTER TABLE "sessions" OWNER TO "zabbix";

CREATE TABLE "permissions" (
"rightid" int8 NOT NULL,
"groupid" int8 NOT NULL,
"permission" int4 NOT NULL DEFAULT 0,
"id" int8 NOT NULL,
CONSTRAINT "rights_pkey" PRIMARY KEY ("rightid") 
)
WITHOUT OIDS;
CREATE INDEX "rights_1" ON "permissions" USING btree ("groupid" "pg_catalog"."int8_ops" ASC NULLS LAST);
CREATE INDEX "rights_2" ON "permissions" USING btree ("id" "pg_catalog"."int8_ops" ASC NULLS LAST);
ALTER TABLE "permissions" OWNER TO "zabbix";

CREATE TABLE "opgroup" (
"opgroupid" int8 NOT NULL,
"operationid" int8 NOT NULL,
"groupid" int8 NOT NULL,
CONSTRAINT "opgroup_pkey" PRIMARY KEY ("opgroupid") 
)
WITHOUT OIDS;
CREATE UNIQUE INDEX "opgroup_1" ON "opgroup" USING btree ("operationid" "pg_catalog"."int8_ops" ASC NULLS LAST, "groupid" "pg_catalog"."int8_ops" ASC NULLS LAST);
CREATE INDEX "opgroup_2" ON "opgroup" USING btree ("groupid" "pg_catalog"."int8_ops" ASC NULLS LAST);
ALTER TABLE "opgroup" OWNER TO "zabbix";

CREATE TABLE "groups" (
"id" int8 NOT NULL,
"usrgrpid" int8 NOT NULL,
"userid" int8 NOT NULL,
CONSTRAINT "users_groups_pkey" PRIMARY KEY ("id") 
)
WITHOUT OIDS;
CREATE UNIQUE INDEX "users_groups_1" ON "groups" USING btree ("usrgrpid" "pg_catalog"."int8_ops" ASC NULLS LAST, "userid" "pg_catalog"."int8_ops" ASC NULLS LAST);
CREATE INDEX "users_groups_2" ON "groups" USING btree ("userid" "pg_catalog"."int8_ops" ASC NULLS LAST);
ALTER TABLE "groups" OWNER TO "zabbix";

CREATE TABLE "groups" (
"id" int8 NOT NULL,
"name" varchar(100) NOT NULL,
"enname" varchar(100) NOT NULL,
"description" varchar(300),
"status" int4 NOT NULL,
"created_time" timestamp,
"updated_time" timestamp,
PRIMARY KEY ("id") 
)
WITHOUT OIDS;
CREATE INDEX "index_groups_name" ON "groups" USING btree ("name" ASC NULLS LAST);
CREATE INDEX "index_groups_enname" ON "groups" USING btree ("enname" ASC NULLS LAST);

CREATE TABLE "positions" (
"id" int8 NOT NULL,
"name" varchar(100) NOT NULL,
"enname" varchar(100) NOT NULL,
"description" varchar(300),
"status" int4 NOT NULL,
"created_time" timestamp,
"updated_time" timestamp,
PRIMARY KEY ("id") 
)
WITHOUT OIDS;
CREATE TABLE "roles" (
"id" int8 NOT NULL,
"name" varchar(100) NOT NULL,
"enname" varchar(100) NOT NULL,
"description" varchar(300),
"status" int4 NOT NULL,
"created_time" timestamp,
"updated_time" timestamp,
PRIMARY KEY ("id") 
)
WITHOUT OIDS;
CREATE TABLE "menus" (
"id" int8 NOT NULL,
"name" varchar(100) NOT NULL,
"enname" varchar(100) NOT NULL,
"url" varchar(300),
"status" int4 NOT NULL,
"icon" varchar(100),
"fid" int8,
"rank" int8 NOT NULL,
"created_time" timestamp,
"updated_time" timestamp,
PRIMARY KEY ("id") 
)
WITHOUT OIDS;
CREATE TABLE "profiles" (
"id" int8 NOT NULL,
"userid" int8 NOT NULL,
"idx" varchar(96) COLLATE "default" NOT NULL DEFAULT ''::character varying,
"idx2" int8 NOT NULL DEFAULT '0'::bigint,
"value_id" int8 NOT NULL DEFAULT '0'::bigint,
"value_int" int4 NOT NULL DEFAULT 0,
"value_str" varchar(255) COLLATE "default" NOT NULL DEFAULT ''::character varying,
"source" varchar(96) COLLATE "default" NOT NULL DEFAULT ''::character varying,
"type" int4 NOT NULL DEFAULT 0,
"created_time" timestamp,
"updated_time" timestamp,
CONSTRAINT "profiles_pkey" PRIMARY KEY ("id") 
)
WITHOUT OIDS;
CREATE INDEX "profiles_1" ON "profiles" USING btree ("userid" "pg_catalog"."int8_ops" ASC NULLS LAST, "idx" "pg_catalog"."text_ops" ASC NULLS LAST, "idx2" "pg_catalog"."int8_ops" ASC NULLS LAST);
CREATE INDEX "profiles_2" ON "profiles" USING btree ("userid" "pg_catalog"."int8_ops" ASC NULLS LAST, "id" "pg_catalog"."int8_ops" ASC NULLS LAST);
ALTER TABLE "profiles" OWNER TO "zabbix";

CREATE TABLE "permissions" (
"id" int8 NOT NULL,
"name" varchar(100) NOT NULL,
"enname" varchar(100) NOT NULL,
"roleid" int8,
"menuid" int8,
"status" int4 NOT NULL,
"created_time" timestamp,
"updated_time" timestamp,
"type" int4 NOT NULL,
PRIMARY KEY ("id") 
)
WITHOUT OIDS;
CREATE TABLE "reports" (
)
WITHOUT OIDS;
CREATE TABLE "dashboards" (
)
WITHOUT OIDS;
CREATE TABLE "alerts" (
)
WITHOUT OIDS;
CREATE TABLE "actions" (
)
WITHOUT OIDS;
CREATE TABLE "datasources" (
)
WITHOUT OIDS;

ALTER TABLE "profiles" ADD CONSTRAINT "fk_profiles_users_1" FOREIGN KEY ("userid") REFERENCES "users" ("id");
ALTER TABLE "menus" ADD CONSTRAINT "fk_menus_menus_1" FOREIGN KEY ("fid") REFERENCES "menus" ("id");
ALTER TABLE "users_roles" ADD CONSTRAINT "fk_users_roles_users_1" FOREIGN KEY ("userid") REFERENCES "users" ("id");
ALTER TABLE "users_roles" ADD CONSTRAINT "fk_users_roles_roles_1" FOREIGN KEY ("roleid") REFERENCES "roles" ("id");
ALTER TABLE "users" ADD CONSTRAINT "fk_users_groups_1" FOREIGN KEY ("groupid") REFERENCES "groups" ("id");
ALTER TABLE "users" ADD CONSTRAINT "fk_users_positions_1" FOREIGN KEY ("positionid") REFERENCES "positions" ("id");
ALTER TABLE "sessions" ADD CONSTRAINT "fk_sessions_users_1" FOREIGN KEY ("userid") REFERENCES "users" ("id");
ALTER TABLE "permissions" ADD CONSTRAINT "fk_permissions_menus_1" FOREIGN KEY ("menuid") REFERENCES "menus" ("id");
ALTER TABLE "permissions" ADD CONSTRAINT "fk_permissions_roles_1" FOREIGN KEY ("roleid") REFERENCES "roles" ("id");

