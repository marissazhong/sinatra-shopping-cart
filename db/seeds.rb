
items_database = [
    {category: 'Fats and Oils', items: 
        [{name: 'Olive Oil', size: '32oz', price: '8.99'}, 
        {name: 'Vegetable Oil', size: '32oz', price: '2.99'},
        {name: 'Butter', size: '1lb', price: '2.99'}]},

    {category: 'Meat', items: 
        [{name: 'Eggs', size: '12ct', price: '1.69'}, 
        {name: 'Beef', size: '2lbs', price: '7.99'},
        {name: 'Chicken', size: '2lbs', price: '8.99'},
        {name: 'Pork', size: '1lb', price: '5.99'}]},

    {category: 'Fish', items: 
        [{name: 'Salmon', size: '1lb', price: '9.99'},
        {name: 'Cod', size: '1lb', price: '13.99'},
        {name: 'Tilapia', size: '1lb', price: '11.99'},
        {name: 'Catfish', size: '1lb', price: '11.99'},
        {name: 'Shrimp', size: '1lb', price: '9.99'},
        {name: 'Sea Scallops', size: '1lb', price: '17.99'}]},

    {category: 'Beans', items: [
        {name: 'Garbanzo Beans', size: '16oz', price: '2.99'},
        {name: 'Green Lentils', size: '16oz', price: '2.99'}, 
        {name: 'Red Lentils', size: '16oz', price: '2.99'}]},

    {category: 'Nuts', items: [
        {name: 'Pecans', size: '16oz', price: '12.99'},
        {name: 'Almonds', size: '16oz', price: '9.99'},
        {name: 'Walnuts', size: '16oz', price: '8.99'},
        {name: 'Pistachios', size: '16oz', price: '7.99'},
        {name: 'Peanuts', size: '16oz', price: '4.99'},
        {name: 'Cashews', size: '16oz', price: '11.99'},
        {name: 'Pine Nuts', size: '8oz', price: '7.99'}]},

    {category: 'Dairy', items: [
        {name: 'Milk', size: '1gal', price: '3.99'},
        {name: 'Cheese', size: '1lb', price: '6.99'},
        {name: 'Yogurt', size: '32.99', price: '4.99'}]},

    {category: 'Grains', items: [
        {name: 'Whole Wheat Bread', size: '1lb', price: '4.99'},
        {name: 'Quinoa', size: '16oz', price: '5.99'},
        {name: 'Oats', size: '18oz', price: '2.99'},
        {name: 'Rice', size: '5lbs', price: '5.99'},
        {name: 'Barley', size: '16oz', price: '2.99'}]},

    {category: 'Vegetables', items: [
        {name: 'Arugula', size: '8oz', price: '3.49'},
        {name: 'Asparagus', size: '1lb', price: '3.99'},
        {name: 'Bell Pepper', size: '1lb', price: '1.29'},
        {name: 'Broccoli', size: '1lb', price: '2.99'},
        {name: 'Brussel Sprouts', size: '1lb', price: '2.99'},
        {name: 'Cabbage', size: '1ct', price: '2.99'},
        {name: 'Celery', size: '1lb', price: '1.99'},
        {name: 'Collard Greens', size: '1lb', price: '3.99'},
        {name: 'Cucumber', size: '1ct', price: '1.29'},
        {name: 'Corn', size: '4ct', price: '0.99'},
        {name: 'Eggplant', size: '2lbs', price: '1.99'},
        {name: 'Green Peas', size: '1lb', price: '1.99'},
        {name: 'Lettuce', size: '1ct', price: '1.99'},
        {name: 'Mushroom', size: '8oz', price: '1.99'},
        {name: 'Spinach', size: '1lb', price: '4.99'},
        {name: 'Tomato', size: '1lb', price: '2.99'},
        {name: 'Zucchini', size: '1lb', price: '1.49'}]},

    {category: 'Fruits', items: [
        {name: 'Apple', size: '1lb', price: '2.99'},
        {name: 'Avocado', size: '5ct', price: '4.99'},
        {name: 'Banana', size: '5ct', price: '0.99'},
        {name: 'Blackberry', size: '8oz', price: '4.99'},
        {name: 'Blueberry', size: '16oz', price: '7.99'},
        {name: 'Cantaloupe', size: '1ct', price: '3.99'},
        {name: 'Cherries', size: '1lb', price: '3.99'},
        {name: 'Grapes', size: '2lbs', price: '4.99'},
        {name: 'Honeydew', size: '1ct', price: '3.99'},
        {name: 'Kiwifruit', size: '2lb', price: '4.99'},
        {name: 'Lemon', size: '1ea', price: '0.50'},
        {name: 'Lime', size: '1ea', price: '0.40'},
        {name: 'Mango', size: '1ea', price: '0.99'},
        {name: 'Orange', size: '5lbs', price: '6.99'},
        {name: 'Peach', size: '1lb', price: '2.99'},
        {name: 'Pear', size: '1lb', price: '2.49'},
        {name: 'Plum', size: '1lb', price: '2.99'},
        {name: 'Raspberry', size: '8oz', price: '4.99'},
        {name: 'Strawberry', size: '1lb', price: '1.99'},
        {name: 'Watermelon', size: '10lbs', price: '4.99'}]}
]

items_database.each do |items_type|
    items_type[:items].each do |item|
        Item.create(name: item[:name], size: item[:size], price: item[:price], category: items_type[:category])
    end
end