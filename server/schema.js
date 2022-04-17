const graphql = require('graphql');
const restaurantDataService = require('./dataservice');
const salesModel = require('./salesModel');

const schema = new graphql.GraphQLSchema({
    query: new graphql.GraphQLObjectType({
        name: 'Query',
        fields: {
            restaurant: {
                type: salesModel,
                args: {
                    name: { type: graphql.GraphQLString },
                },
                resolve: (_, {name}) => restaurantDataService.getSales(name),
                // resolve: (_, {name}) => `Hello ${name}`,
            },
        },
    }),
});
module.exports = schema;