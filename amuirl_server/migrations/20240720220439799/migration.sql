BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "game" (
    "id" bigserial PRIMARY KEY,
    "lobby" json NOT NULL,
    "playersDead" json NOT NULL,
    "indexOfImpostors" json NOT NULL,
    "taskLeftForEachPlayers" json NOT NULL,
    "cooldownKillByImpostors" json NOT NULL,
    "startedPoint" json NOT NULL,
    "startedPointTriggered" boolean NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "game_info_id_unique_idx" ON "game" USING btree ("lobby");


--
-- MIGRATION VERSION FOR amuirl
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('amuirl', '20240720220439799', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240720220439799', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();


COMMIT;
