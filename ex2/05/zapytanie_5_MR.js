printjson(
    db.people.mapReduce(
		function() {
			this.credit.forEach(c => emit(c.currency, {balance: parseFloat(c.balance), sum: 0, avg: 0}))
		},
		function(keys, values) {
			let balances = values.map(v => v.balance);
			
			return {
				avg: balances.reduce((x, y) => x + y) / balances.length,
                sum: balances.reduce((x, y) => x + y),
				balance: 0
            };
		},
		{
			out: {inline: 1},
			query: {nationality: "Poland", sex: "Female"},
			finalize: function(k, vals) {
				return {
					currency: k,
					avg: vals.avg,
					sum: vals.sum
				}
			}
		}
	)
)