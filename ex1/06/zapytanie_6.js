printjson(
    db.people.insertOne(
        {
            "sex" : "Male",
            "first_name" : "Tomasz",
            "last_name" : "Kasprzak",
            "job" : "ITOM Consultant",
            "email" : "s15568@pjwstk.edu.pl",
            "location" : {
                "city" : "Warsaw",
                "address" : {
                    "streetname" : "Some street",
                    "streetnumber" : "123"
                }
            },
            "description" : "Some Description",
            "height" : "173",
            "weight" : "75",
            "birth_date" : "1916-01-10T21:20:00Z",
            "nationality" : "Polish",
            "credit" : [
                {
                    "type" : "pes",
                    "number" : "69302851652046920",
                    "currency" : "PLN",
                    "balance" : "80000"
                }
            ]
        }
    )
)