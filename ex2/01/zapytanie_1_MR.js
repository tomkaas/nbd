printjson(
    db.people.mapReduce(
        function() {
            emit(this.sex, {
				weight: parseFloat(this.weight),
				height: parseFloat(this.height)
			})
        },
        function(keys, values) {
            var r_weight = values.map(val => val.weight);
            var r_height = values.map(val => val.height);
            var avg = arr => arr.reduce((x, y) => x + y) / arr.length;

            return {
                weight: avg(r_weight),
                height: avg(r_height)
            }
        },
		{
            out: { inline: 1 }
        }
    )
)