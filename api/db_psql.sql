CREATE TABLE "ProgramTemplate" (
  "id" uuid PRIMARY KEY,
  "lang" varchar,
  "created_by" uuid,
  "created_at" timestamp,
  "updated_at" timestamp
);

CREATE TABLE "EventTemplate" (
  "id" uuid PRIMARY KEY,
  "program_id" uuid,
  "type" varchar,
  "type_entity_id" uuid,
  "start_at" timestamp,
  "duration" int,
  "created_by" uuid,
  "created_at" timestamp,
  "updated_at" timestamp
);

CREATE TABLE "TopicTemplate" (
  "id" uuid PRIMARY KEY,
  "name" varchar,
  "description" text,
  "links" text[],
  "attachments" text[],
  "content" text,
  "vocab_items" text[],
  "created_by" uuid,
  "created_at" timestamp,
  "updated_at" timestamp
);

CREATE TABLE "TaskTemplate" (
  "id" uuid PRIMARY KEY,
  "topic_id" uuid,
  "name" varchar,
  "description" text,
  "content" text,
  "attachments" text[],
  "created_by" uuid,
  "created_at" timestamp,
  "updated_at" timestamp
);

CREATE TABLE "VoteTemplate" (
  "id" uuid PRIMARY KEY,
  "topic_ids" uuid[],
  "closing_datetime" timestamp,
  "votes" json,
  "created_by" uuid,
  "created_at" timestamp,
  "updated_at" timestamp
);

CREATE TABLE "Event" (
  "id" uuid PRIMARY KEY,
  "type" varchar,
  "type_entity_id" uuid,
  "start_at" timestamp,
  "program_id" uuid,
  "duration" int,
  "created_by" uuid,
  "created_at" timestamp,
  "updated_at" timestamp
);

CREATE TABLE "Program" (
  "id" uuid PRIMARY KEY,
  "lang" varchar,
  "created_by" uuid,
  "created_at" timestamp,
  "updated_at" timestamp
);

CREATE TABLE "Club" (
  "id" uuid PRIMARY KEY,
  "name" varchar,
  "description" text,
  "logo" text,
  "rules" text,
  "language" varchar,
  "program_id" uuid,
  "categories" varchar[],
  "time_zone" varchar,
  "is_public" boolean,
  "invite_code" varchar,
  "created_by" uuid,
  "created_at" timestamp,
  "updated_at" timestamp
);

CREATE TABLE "ClubMembership" (
  "id" uuid PRIMARY KEY,
  "account_id" uuid,
  "club_id" uuid,
  "role" varchar,
  "joined_at" timestamp,
  "active" boolean
);

CREATE TABLE "LangLevel" (
  "account_id" uuid,
  "lang" varchar,
  "level" varchar,
  "updated_at" timestamp,
  "source" varchar
);

CREATE TABLE "Account" (
  "id" uuid PRIMARY KEY,
  "name" varchar,
  "avatar" text,
  "email" varchar,
  "access_token" text,
  "refresh_token" text,
  "verified" boolean,
  "last_login_at" timestamp,
  "pass_hash" text,
  "lang_level_ids" text[]
);

CREATE TABLE "Device" (
  "id" uuid PRIMARY KEY,
  "account_id" uuid,
  "color_theme" varchar,
  "settings" json
);

CREATE TABLE "Topic" (
  "id" uuid PRIMARY KEY,
  "name" varchar,
  "description" text,
  "links" text[],
  "attachments" text[],
  "content" text,
  "vocab_items" text[],
  "created_by" uuid,
  "created_at" timestamp,
  "updated_at" timestamp
);

CREATE TABLE "Task" (
  "id" uuid PRIMARY KEY,
  "topic_id" uuid,
  "name" varchar,
  "description" text,
  "content" text,
  "attachments" text[],
  "created_by" uuid,
  "created_at" timestamp,
  "updated_at" timestamp
);

CREATE TABLE "Vote" (
  "id" uuid PRIMARY KEY,
  "topic_ids" uuid[],
  "closing_datetime" timestamp,
  "votes" json,
  "created_by" uuid,
  "created_at" timestamp,
  "updated_at" timestamp
);

CREATE TABLE "Meeting" (
  "id" uuid PRIMARY KEY,
  "topic_ids" uuid[],
  "start_at" timestamp,
  "duration" int,
  "preparation_task_id" uuid,
  "links" text[],
  "vocab" text[],
  "video_meeting_link" text,
  "created_by" uuid,
  "created_at" timestamp,
  "updated_at" timestamp
);

CREATE TABLE "Session" (
  "id" uuid PRIMARY KEY,
  "duration" int,
  "group_size" int,
  "task_id" uuid,
  "meeting_id" uuid
);

CREATE TABLE "Group" (
  "id" uuid PRIMARY KEY,
  "label" varchar,
  "account_ids" uuid,
  "session_id" uuid,
  "formed_at" timestamp,
  "auto_assigned" boolean
);

COMMENT ON TABLE "LangLevel" IS 'Composite key (account_id, lang)';

ALTER TABLE "ProgramTemplate" ADD FOREIGN KEY ("created_by") REFERENCES "Account" ("id");

ALTER TABLE "EventTemplate" ADD FOREIGN KEY ("program_id") REFERENCES "ProgramTemplate" ("id");

ALTER TABLE "EventTemplate" ADD FOREIGN KEY ("created_by") REFERENCES "Account" ("id");

ALTER TABLE "TopicTemplate" ADD FOREIGN KEY ("created_by") REFERENCES "Account" ("id");

ALTER TABLE "EventTemplate" ADD FOREIGN KEY ("type_entity_id") REFERENCES "TaskTemplate" ("id");

ALTER TABLE "TaskTemplate" ADD FOREIGN KEY ("topic_id") REFERENCES "TopicTemplate" ("id");

ALTER TABLE "TaskTemplate" ADD FOREIGN KEY ("created_by") REFERENCES "Account" ("id");

ALTER TABLE "EventTemplate" ADD FOREIGN KEY ("type_entity_id") REFERENCES "VoteTemplate" ("id");

ALTER TABLE "VoteTemplate" ADD FOREIGN KEY ("topic_ids") REFERENCES "TopicTemplate" ("id");

ALTER TABLE "VoteTemplate" ADD FOREIGN KEY ("created_by") REFERENCES "Account" ("id");

ALTER TABLE "Event" ADD FOREIGN KEY ("program_id") REFERENCES "Program" ("id");

ALTER TABLE "Event" ADD FOREIGN KEY ("created_by") REFERENCES "Account" ("id");

ALTER TABLE "Program" ADD FOREIGN KEY ("created_by") REFERENCES "Account" ("id");

ALTER TABLE "Club" ADD FOREIGN KEY ("program_id") REFERENCES "Program" ("id");

ALTER TABLE "Club" ADD FOREIGN KEY ("created_by") REFERENCES "Account" ("id");

ALTER TABLE "ClubMembership" ADD FOREIGN KEY ("account_id") REFERENCES "Account" ("id");

ALTER TABLE "ClubMembership" ADD FOREIGN KEY ("club_id") REFERENCES "Club" ("id");

ALTER TABLE "LangLevel" ADD FOREIGN KEY ("account_id") REFERENCES "Account" ("id");

ALTER TABLE "Device" ADD FOREIGN KEY ("account_id") REFERENCES "Account" ("id");

ALTER TABLE "Topic" ADD FOREIGN KEY ("created_by") REFERENCES "Account" ("id");

ALTER TABLE "Event" ADD FOREIGN KEY ("type_entity_id") REFERENCES "Task" ("id");

ALTER TABLE "Task" ADD FOREIGN KEY ("topic_id") REFERENCES "Topic" ("id");

ALTER TABLE "Task" ADD FOREIGN KEY ("created_by") REFERENCES "Account" ("id");

ALTER TABLE "Event" ADD FOREIGN KEY ("type_entity_id") REFERENCES "Vote" ("id");

ALTER TABLE "Vote" ADD FOREIGN KEY ("topic_ids") REFERENCES "Topic" ("id");

ALTER TABLE "Vote" ADD FOREIGN KEY ("created_by") REFERENCES "Account" ("id");

ALTER TABLE "Event" ADD FOREIGN KEY ("type_entity_id") REFERENCES "Meeting" ("id");

ALTER TABLE "Meeting" ADD FOREIGN KEY ("topic_ids") REFERENCES "Topic" ("id");

ALTER TABLE "Meeting" ADD FOREIGN KEY ("preparation_task_id") REFERENCES "Task" ("id");

ALTER TABLE "Meeting" ADD FOREIGN KEY ("created_by") REFERENCES "Account" ("id");

ALTER TABLE "Session" ADD FOREIGN KEY ("task_id") REFERENCES "Task" ("id");

ALTER TABLE "Session" ADD FOREIGN KEY ("meeting_id") REFERENCES "Meeting" ("id");

CREATE TABLE "Account_Group" (
  "Account_id" uuid,
  "Group_account_ids" uuid,
  PRIMARY KEY ("Account_id", "Group_account_ids")
);

ALTER TABLE "Account_Group" ADD FOREIGN KEY ("Account_id") REFERENCES "Account" ("id");

ALTER TABLE "Account_Group" ADD FOREIGN KEY ("Group_account_ids") REFERENCES "Group" ("account_ids");


ALTER TABLE "Group" ADD FOREIGN KEY ("session_id") REFERENCES "Session" ("id");

ALTER TABLE "Vote" ADD FOREIGN KEY ("topic_ids") REFERENCES "Vote" ("id");

ALTER TABLE "Program" ADD FOREIGN KEY ("created_at") REFERENCES "Program" ("created_by");
