#coding: utf-8

DATABASE = {
    name: {
        name1: 'Gabe',
        name2: 'Joao',
        name3: 'Daniel',
        name4: 'Andre',
        name5: 'Gabriele',
        name6: 'Gold',
        name7: Faker::Name.name
    },
    salary: {
        salary1: 151550,
        salary2: 489710,
        salary3: 9465110,
        salary4: 546944,
        salary5: 9764120,
        salary6: 5981011,
        salary7: Faker::Number.number
    },
    age: {
        age1: 31,
        age2: 29,
        age3: 30,
        age4: 45,
        age5: 56,
        age6: 20,
        age7: Faker::Number.number(digits: 2)
    }
}

