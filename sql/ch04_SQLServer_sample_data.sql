DROP TABLE IF EXISTS tour;
DROP TABLE IF EXISTS waterfall;
DROP TABLE IF EXISTS county;
DROP TABLE IF EXISTS owner;


CREATE TABLE county (
    id          INTEGER NOT NULL,
    name        VARCHAR(10),
    population  INTEGER,
    CONSTRAINT pk_county
        PRIMARY KEY (id)
);

CREATE TABLE owner (
    id      INTEGER NOT NULL,
    name    VARCHAR(15),
    phone   VARCHAR(12),
    type    VARCHAR(7),
    CONSTRAINT pk_owner
        PRIMARY KEY (id),
    CONSTRAINT chk_owner_type
        CHECK (type IN ('public','private'))
);

CREATE TABLE waterfall (
    id              INTEGER NOT NULL,
    name            VARCHAR(15),
    datum           VARCHAR(7),
    zone            INTEGER,
    northing        INTEGER,
    easting         INTEGER,
    lat_lon         VARCHAR(20), 
    county_id       INTEGER,
    open_to_public  VARCHAR(1),
    owner_id        INTEGER,
    description     VARCHAR(80),
    confirmed_date  DATETIME,
    CONSTRAINT pk_waterfall
        PRIMARY KEY (id),
    CONSTRAINT chk_open_to_public
        CHECK (open_to_public IN ('y','n')),
    CONSTRAINT fk_owner_id
        FOREIGN KEY (owner_id)
        REFERENCES owner (id),
    CONSTRAINT fk_county_id
        FOREIGN KEY (county_id)
        REFERENCES county (id)
);

CREATE TABLE tour (
    name        VARCHAR(10) NOT NULL,
    stop        INTEGER NOT NULL,
    parent_stop INTEGER,
    CONSTRAINT pk_tour
        PRIMARY KEY (name, stop),
    CONSTRAINT fk_parent_stop
        FOREIGN KEY (name, parent_stop)
        REFERENCES tour (name, stop),
    CONSTRAINT fk_stop
        FOREIGN KEY (stop) 
        REFERENCES waterfall (id)
);


INSERT INTO county VALUES (2,'Alger',9862);
INSERT INTO county VALUES (6,'Baraga',8746);
INSERT INTO county VALUES (7,'Ontonagon',7818);
INSERT INTO county VALUES (9,'Dickinson',27472);
INSERT INTO county VALUES (10,'Gogebic',17370);
INSERT INTO county VALUES (11,'Delta',38520);

INSERT INTO owner VALUES (1,'Pictured Rocks','906.387.2607','public');
INSERT INTO owner VALUES (2,'Michigan Nature','517.655.5655','private');
INSERT INTO owner VALUES (3,'AF LLC',null,'private');
INSERT INTO owner VALUES (4,'MI DNR','906.228.6561','public');
INSERT INTO owner VALUES (5,'Horseshoe Falls','906.387.2635','private');

INSERT INTO waterfall VALUES (1,'Munising Falls','NAD1927',16,5141184,0528971,null,2,'y',1,
                               'Munising''s namesake waterfall; the one on all the postcards',
                               '2005-12-08 19:30:00');
INSERT INTO waterfall VALUES (2,'Tannery Falls','NAD1927',16,5140000,0528808,null,2,'y',2,
                               'Like Munising Falls, but nicely undeveloped',
                               '2005-12-08 19:50:00');
INSERT INTO waterfall VALUES (3,'Alger Falls','NAD1927',16,5137795,0527046,null,2,'y',3,
                               'Nice falls at east entrance into town',
                               '2005-12-08 20:03:00');
INSERT INTO waterfall VALUES (4,'Wagner Falls','NAD1927',16,5137310,0526989,null,2,'y',4,
                               'Small, scenic falls near intersection of M-28 and M-94',
                               '2005-12-08 20:04:00');
INSERT INTO waterfall VALUES (5,'Horseshoe Falls','NAD1927',16,5138877,0527323,null,2,'y',null,
                               'Falls, garden, scenic walk, and a fish pond. Kids can feed the fish.',
                               '2005-12-08 20:07:00');
INSERT INTO waterfall VALUES (6,'Miners Falls',null,null,null,null,null,2,'y',1,
                               'Highest waterflow in the Pictured Rocks.',
                               '2005-12-08 20:10:00');
INSERT INTO waterfall VALUES (7,'Little Miners',null,null,null,null,null,2,'y',1,
                               'Scenic, must bushwhack two miles off the trail, on Little Miners River',
                               '2005-12-08 20:15:00');
INSERT INTO waterfall VALUES (8,'Scott Falls',null,null,null,null,null,2,'y',null,
                               'Scenic roadside falls near Face on the Rock',
                               '2005-12-18 21:28:00');
INSERT INTO waterfall VALUES (9,'Canyon Falls',null,null,null,null,null,6,'y',null,
                               'A few miles north of M-28 (two miles south of Alberta), but worth it',
                               '2005-12-18 21:35:00');
INSERT INTO waterfall VALUES (10,'Agate Falls',null,null,null,null,null,7,'y',null,
                               'Across road from Joseph F. Oravec Roadside Park',
                               '2005-12-18 21:35:00');
INSERT INTO waterfall VALUES (11,'Bond Falls',null,null,null,null,null,7,'y',null,
                               'Bond Falls Basin, nine miles south of Bruce Crossing',
                               '2005-12-18 21:50:00');
INSERT INTO waterfall VALUES (12,'Fumee Falls',null,null,null,null,null,9,'y',null,
                               'Start from Helen Z. Lien Roadside Park 3 1/2 miles west of Norway',
                               '2005-12-18 21:56:30');
INSERT INTO waterfall VALUES (13,'Kakabika Falls',null,null,null,null,null,10,'y',null,
                               '1/2 mile north of US-2 off of county road 527',
                               '2005-12-18 22:03:09');
INSERT INTO waterfall VALUES (14,'Rapid River Fls',null,null,null,null,null,11,'y',null,
                               'Park includes playground, barbecue pits, flowing well, picnic tables',
                               '2005-12-18 22:13:11');
INSERT INTO waterfall VALUES (30,'Twin Falls #1','NAD1927',16,5140500,0528641,null,2,'y',2,
                               'Near Twin Falls #2',
                               '2006-02-10 19:35:00');
INSERT INTO waterfall VALUES (31,'Twin Falls #2','NAD1927',16,5140500,0528663,null,2,'y',2,
                               'Near Twin Falls #1',
                               '2006-02-10 19:35:00');

INSERT INTO tour VALUES ('Munising',1,null);
INSERT INTO tour VALUES ('Munising',2,1);
INSERT INTO tour VALUES ('Munising',6,2);
INSERT INTO tour VALUES ('Munising',4,6);
INSERT INTO tour VALUES ('Munising',3,4);
INSERT INTO tour VALUES ('Munising',5,3);
INSERT INTO tour VALUES ('M-28',3,null);
INSERT INTO tour VALUES ('M-28',1,3);
INSERT INTO tour VALUES ('M-28',8,1);
INSERT INTO tour VALUES ('M-28',9,8);
INSERT INTO tour VALUES ('M-28',10,9);
INSERT INTO tour VALUES ('M-28',11,10);
INSERT INTO tour VALUES ('US-2',14,null);
INSERT INTO tour VALUES ('US-2',12,14);
INSERT INTO tour VALUES ('US-2',11,12);
INSERT INTO tour VALUES ('US-2',13,11);


SELECT * FROM county;
SELECT * FROM owner;
SELECT id, name, county_id, open_to_public, owner_id  FROM waterfall;
SELECT * FROM tour;

GO
