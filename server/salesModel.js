
const graphql = require('graphql');
const restaurantDataService = require('./dataservice');

let getRegionFields = function() {
    let fields = {};
    restaurantDataService.getRegionLookup().forEach(region => {
        fields[region] = { type: graphql.GraphQLInt, description: `Total sales in region ${region}` };
    })
    return fields;
}

let RestaurantSales = new graphql.GraphQLObjectType({
    name: 'RestaurantSales',
    fields: getRegionFields()
});

module.exports = RestaurantSales;