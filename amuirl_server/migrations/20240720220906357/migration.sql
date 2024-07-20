BEGIN;

--
-- ACTION ALTER TABLE
--
DROP INDEX "game_info_id_unique_idx";
--
-- ACTION ALTER TABLE
--
DROP INDEX "lobby_info_id_unique_idx";
--
-- ACTION ALTER TABLE
--
DROP INDEX "users_info_id_unique_idx";

--
-- MIGRATION VERSION FOR amuirl
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('amuirl', '20240720220906357', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240720220906357', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();


COMMIT;
