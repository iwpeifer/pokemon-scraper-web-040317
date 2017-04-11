ALTER TABLE pokemon ADD COLUMN hp INTEGER DEFAULT 60;
UPDATE pokemon SET hp = hp-1 WHERE name = "Pikachu";