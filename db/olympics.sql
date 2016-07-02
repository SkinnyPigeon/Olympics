DROP TABLE athletes_events;
DROP TABLE events;
DROP TABLE athletes;
DROP TABLE nations;

CREATE TABLE nations (
  id SERIAL4 primary key,
  name VARCHAR(255),
  total_points INT4
);

CREATE TABLE athletes (
  id SERIAL4 primary key,
  name VARCHAR(255),
  nation_id INT4 references nations(id)
);

CREATE TABLE events (
  id SERIAL4 primary key,
  name VARCHAR(255)
);

CREATE TABLE athletes_events (
  id SERIAL4 primary key,
  athlete_id INT4 references athletes(id),
  event_id INT4 references events(id),
  position_id INT4
);