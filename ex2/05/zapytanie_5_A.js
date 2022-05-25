printjson(
    db.people.aggregate([
        {
            $match: {nationality: "Poland", sex: "Female"}
        },
        {
            $unwind: "$credit"
        },
        {
            $group: {
                _id: "$credit.currency",
                "Average balance": {$sum: {$toDouble: "$credit.balance"}},
                "SUM balance": {$avg: {$toDouble: "$credit.balance"}},
            }
        },
        {
            $project: {
                _id: 0,
                "currency": "$_id",
                "Average balance": 1,
                "SUM balance": 1
            }
        },
    ])
    .toArray()
)