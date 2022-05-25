printjson(
    db.people.mapReduce(
		function() {
			this.credit.forEach(c => emit(c.currency, parseFloat(c.balance)))
		},
		function(keys, values) {
			return values.reduce((x, y) => x + y)
		},
		{
			out: { inline: 1 }
		}
	)
)