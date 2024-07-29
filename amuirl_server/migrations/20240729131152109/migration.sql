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
    "playersPosition" json NOT NULL,
    "players" json NOT NULL,
    "timeBetweenImpostorKill" bigint NOT NULL,
    "killDistance" bigint NOT NULL,
    "nbUrgencyCall" bigint NOT NULL,
    "timeDiscutionVote" bigint NOT NULL,
    "playersDead" json NOT NULL,
    "indexOfImpostors" json NOT NULL,
    "taskLeftForEachPlayers" json NOT NULL,
    "totalTask" json NOT NULL,
    "cooldownKillByImpostors" json NOT NULL,
    "startedPoint" json NOT NULL,
    "startedPointTriggeredBy" text NOT NULL,
    "isGameEnded" boolean NOT NULL,
    "dangerTriggered" boolean NOT NULL
);


--
-- MIGRATION VERSION FOR amuirl
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('amuirl', '20240729131152109', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240729131152109', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();


COMMIT;
