const express = require('express');
const mongoose = require('mongoose');




const { graphqlHTTP } = require('express-graphql');


const app = express();


const uri = "mongodb://localhost:27017/testData";
mongoose
    .connect(uri, {
      useCreateIndex: true,
      useNewUrlParser: true,
      useUnifiedTopology: true,
      useFindAndModify: false,
    })
    .then(
      () => {
        console.log("Connected to Mongo");
      },
      (err) => {
        console.log("error connecting to Mongo: ");
        console.log(err)
      }
);


let schema = require('./schema');

app.use('/graphql', graphqlHTTP({
  schema: schema,
  graphiql: true,
}));



app.listen(4000);
console.log('Running a GraphQL API server at http://localhost:4000/graphql');
