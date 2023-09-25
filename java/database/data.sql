BEGIN TRANSACTION;

INSERT INTO users (username,password_hash,role) VALUES ('user','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (username,password_hash,role) VALUES ('admin','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');
INSERT INTO users (username,password_hash,role) VALUES ('kevin', '$2a$10$Q7v41gLln/w3WG/gXp6JWes5PcmGphkTC0Qdo2sxto4bnBKDTHomq', 'ROLE_TRAINER');
INSERT INTO users (username,password_hash,role) VALUES ('joshua','$2a$10$YiwZQ31wxF03AKBPByXJeOP/xJeDbf2oPrYIrnVjjJKzSLkHWAhZq', 'ROLE_TRAINER');
INSERT INTO users (username,password_hash,role) VALUES ('jose','$2a$10$gPzzMX6n6Wu86GZxy41DBeXgCZL9oeWrNABgFvmYuCgukTA6ZBhFC', 'ROLE_TRAINER');
INSERT INTO users (username,password_hash,role) VALUES ('alejandro', '$2a$10$kEvamjfY0ju9Hme4llBH2eJ0KWbqP/QrK0B7WrSe14zGfr5uvXXlq', 'ROLE_TRAINER');
INSERT INTO users (username,password_hash,role) VALUES ('caroline', '$2a$10$VmhtTJg3l9WMi2tXNMUQpe0oT4tpZNUfPCLhk0YXgxHIQdcDOya22', 'ROLE_TRAINER');

INSERT INTO
COMMIT TRANSACTION;
