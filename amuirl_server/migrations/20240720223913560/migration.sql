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
    "gameParameter" json NOT NULL,
    "gameLaunched" boolean NOT NULL
);


--
-- MIGRATION VERSION FOR amuirl
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('amuirl', '20240720223913560', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240720223913560', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();


COMMIT;
