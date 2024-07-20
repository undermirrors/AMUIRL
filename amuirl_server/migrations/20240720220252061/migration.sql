BEGIN;

--
-- ACTION DROP TABLE
--
DROP TABLE "game" CASCADE;


--
-- MIGRATION VERSION FOR amuirl
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('amuirl', '20240720220252061', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240720220252061', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();


COMMIT;
