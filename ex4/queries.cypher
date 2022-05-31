wycieczki górskie

1.
MATCH shortest_path=shortestPath((darjeeling:town {name: "Darjeeling"})-[*]-(sandakphu:peak {name: "Sandakphu"}))
RETURN shortest_path

2.
MATCH shortest_path=shortestPath((darjeeling:town {name: "Darjeeling"})-[*]-(sandakphu:peak {name: "Sandakphu"}))
WHERE ALL (season IN relationships(shortest_path) WHERE season.winter = "true")
RETURN shortest_path

3.
MATCH path=(darjeeling:town {name: "Darjeeling"})-[*]->(sandakphu:peak {name: "Sandakphu"})
RETURN path, reduce(distance = 0, r in relationships(path) | distance + r.distance) AS distanceSum
ORDER BY distanceSum ASC

połączenia lotnicze

5.
MATCH (airport:Airport)<-[:ORIGIN]-(flight:Flight)
WITH airport, count(flight) as flights
RETURN airport, flights
ORDER BY flights ASC

6.
MATCH p = (lax:Airport {name: "LAX"})<-[r1:ORIGIN]-(:Flight)-[r2:ORIGIN|DESTINATION*..10]->(destination:Airport)
WHERE REDUCE(a = 0, n IN [x IN NODES(p) WHERE 'Flight' IN LABELS(x)] |
	a + [(n)<-[:ASSIGN]-(ticket) | ticket.price][0]
	) < 3000
RETURN p

7.
MATCH p = (lax:Airport {name:"LAX"})<-[relation:ORIGIN|DESTINATION*..10]->(dayton:Airport {name: "DAY"})
WITH p, REDUCE(a = 0, n IN [x IN NODES(p) WHERE 'Flight' IN LABELS(x)] |
	a + [(n)<-[:ASSIGN]-(ticket) | ticket.price][0]
	) as price
RETURN p, price
ORDER BY price ASC LIMIT 1


8.
MATCH p = (lax:Airport {name:"LAX"})<-[relation:ORIGIN|DESTINATION*..10]->(dayton:Airport {name: "DAY"})
WITH p, REDUCE(a = 0, n IN [x IN NODES(p) WHERE 'Flight' IN LABELS(x)] |
	a + [(n)<-[:ASSIGN]-(ticket {class: "business"}) | ticket.price][0]
	) as price
RETURN p, price
ORDER BY price ASC LIMIT 1
