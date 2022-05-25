printjson(
    db.people.aggregate([
        {
            $unwind: "$credit"
        },
        {
            $group: {
                _id: "$credit.currency",
                "Total balance": {$sum: {$toDouble: "$credit.balance"}}
            }
        },
        {
            $project: {
                _id: 0,
                "Currency": "$_id",
                "Total balance": 1
            }
        },
		{
            $sort: {
                "currency": 1
            }
        }
    ]).toArray()
)