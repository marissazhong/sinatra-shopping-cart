
items_database = [
    {type: 'Fats and Oils', items: 
        [{name: 'Olive Oil', size: '32oz', price: '8.99'}, 
        {name: 'Vegetable Oil', size: '32oz', price: '2.99'},
        {name: 'Butter', size: '1lb', price: '2.99'}]},

    {type: 'Meat', items: 
        [{name: 'Eggs', size: '12ct', price: '1.69'}, 
        {name: 'Beef', size: '2lbs', price: '7.99'},
        {name: 'Chicken', size: '2lbs', price: '8.99'},
        {name: 'Pork', size: '1lb', price: '5.99'}]},

    {type: 'Fish', items: [{name: '', size: '', price: ''}, ]},

    {type: 'Beans', items: [{name: '', size: '', price: ''}, ]},

    {type: 'Nuts', items: [{name: '', size: '', price: ''}, ]},

    {type: 'Dairy', items: [{name: '', size: '', price: ''}, ]},

    {type: 'Grains', items: [{name: '', size: '', price: ''}, ]},

    {type: 'Vegetables', items: [{name: '', size: '', price: ''}, ]},

    {type: 'Fruits', items: [{name: '', size: '', price: ''}, ]}
]

items_database.each do |items_type|
    items_type.items.each do |item|
        Item.create(name: item.name, size: item.size, price: item.price, type: items_type.type)
    end
end