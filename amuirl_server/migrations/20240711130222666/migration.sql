BEGIN;

--
-- ACTION DROP TABLE
--
DROP TABLE "lobby" CASCADE;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "lobby" (
    "id" bigserial PRIMARY KEY,
    "name" text NOT NULL,
    "nbPlayer" bigint NOT NULL,
    "players" json NOT NULL,
    "gameParameter" json NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "lobby_info_id_unique_idx" ON "lobby" USING btree ("name");

--
-- ACTION DROP TABLE
--
DROP TABLE "users" CASCADE;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "users" (
    "id" bigserial PRIMARY KEY,
    "name" text NOT NULL,
    "mdp" text NOT NULL,
    "currentlobby" bigint NOT NULL,
    "impostor" boolean NOT NULL,
    "inLife" boolean NOT NULL,
    "nbBuzzerLeft" bigint
);

-- Indexes
CREATE UNIQUE INDEX "users_info_id_unique_idx" ON "users" USING btree ("name");


--
-- MIGRATION VERSION FOR amuirl
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('amuirl', '20240711130222666', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240711130222666', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();


COMMIT;
