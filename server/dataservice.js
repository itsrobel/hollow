const lookupJson = require("./regions.json")
const salesJson = require("./sales.json")


let DataService = {

    getRegionLookup: function() {
        return lookupJson.regions;
    },

    getSales: function(name) {
        return salesJson[name];
    }
};

module.exports = DataService;