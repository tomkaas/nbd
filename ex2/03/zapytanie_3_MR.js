printjson(
    db.people.mapReduce(
        function () {
            emit(this.job, this.job)
        },
        function (keys, values) {
            return ''
        },
        {
            out: {inline: 1}
        }
    )
)