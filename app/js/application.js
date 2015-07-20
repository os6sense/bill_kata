/*global $:false, jQuery:false, window: false, Backbone: false, _: false*/
var BillingApp = {
    Models: {},
    Collections: {},
    Views: {},
    Templates: {}
};

function toMoney(price) { 
   return parseFloat(price).toFixed(2);
}
