BEGIN;

--
-- ACTION DROP TABLE
--
DROP TABLE "game" CASCADE;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "game" (
    "id" bigserial PRIMARY KEY,
    "name" text NOT NULL,
    "players" json NOT NULL,
    "gameParameter" json NOT NULL,
    "playersDead" json NOT NULL,
    "indexOfImpostors" json NOT NULL,
    "taskLeftForEachPlayers" json NOT NULL,
    "totalTask" json NOT NULL,
    "cooldownKillByImpostors" json NOT NULL,
    "startedPoint" json NOT NULL,
    "startedPointTriggered" boolean NOT NULL,
    "isGameEnded" boolean NOT NULL,
    "dangerTriggered" boolean NOT NULL
);


--
-- MIGRATION VERSION FOR amuirl
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('amuirl', '20240722110809862', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240722110809862', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();


COMMIT;
