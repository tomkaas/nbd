1.
MATCH (movies:Movie) RETURN movies

2.
MATCH (hugo:Person {name: "Hugo Weaving"})-[:ACTED_IN]->(movies)
RETURN hugo,movies

3.
MATCH (hugo:Person {name: "Hugo Weaving"})-[:ACTED_IN]->(movies)<-[:DIRECTED]-(directors)
RETURN movies, directors

4.
MATCH (hugo:Person {name: "Hugo Weaving"})-[:ACTED_IN]->(movies)<-[:ACTED_IN]-(actorsInTheSameMovie)
RETURN actorsInTheSameMovie, movies

5.
MATCH (movie:Movie)<-[:ACTED_IN]-(person) WHERE (person)-[:ACTED_IN]->(:Movie {title: "The Matrix"})
RETURN movie, person

6.
MATCH (actor:Person)-[acted:ACTED_IN]-(:Movie)
RETURN actor, count(acted.roles) as `Amount of movies`

7.
MATCH (director:Person)-[:DIRECTED]->(movie:Movie)<-[:WROTE]-(writer:Person) WHERE writer = director
RETURN director, movie

8.
MATCH (hugo:Person {name: "Hugo Weaving"})-[:ACTED_IN]->(movies)<-[:ACTED_IN]-(keanu:Person {name: "Keanu Reeves"})
RETURN hugo, keanu, movies

9.
CREATE (captainAmerica:Movie {tagline: "The First Avenger", title: "Captain America", released: 2011})
CREATE (chris:Person {name: "Chris Evans", born: 1981})
CREATE (hugo:Person {name: "Hugo Weaving", born: 1960})
CREATE (hayley:Person {name: "Hayley Atwell", born: 1982})
CREATE (sebastian:Person {name: "Sebastian Stan", born: 1982})
CREATE (tommy:Person {name: "Tommy Lee Jones", born: 1946})
CREATE (stanley:Person {name: "Stanley Tucci", born: 1960})
CREATE (samuel:Person {name: "Samuel L. Jackson", born: 1948})
CREATE (joe:Person {name: "Joe Johnston", born: 1950})
CREATE (christopher:Person {name: "Christopher Markus", born: 1970})
CREATE (stephen:Person {name: "Stephen McFeely", born: 1970})
CREATE
   (chris)-[:ACTED_IN {roles: ["Steve Rogers", "Captain America"]}]->(captainAmerica),
   (hugo)-[:ACTED_IN {roles:["Johann Schmidt", "Red Skull"]}]->(captainAmerica),
   (hayley)-[:ACTED_IN {roles:["Peggy Carter"]}]->(captainAmerica),
   (sebastian)-[:ACTED_IN {roles:["James Buchanan Bucky Barnes"]}]->(captainAmerica),
   (tommy)-[:ACTED_IN {roles:["Colonel Chester Phillips"]}]->(captainAmerica),
   (stanley)-[:ACTED_IN {roles:["Dr. Abraham Erskine"]}]->(captainAmerica),
   (samuel)-[:ACTED_IN {roles:["Nick Fury"]}]->(captainAmerica),
   (joe)-[:DIRECTED]->(captainAmerica),
   (christopher)-[:WROTE]->(captainAmerica),
   (stephen)-[:WROTE]->(captainAmerica)
   
MATCH (people:Person)-[played]-(captainAmerica:Movie {title: "Captain America"})
RETURN people, played, captainAmerica