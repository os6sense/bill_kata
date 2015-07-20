/*global $:false, jQuery:false, window: false, Backbone: false, _: false*/
BillingApp.Models.CallCharges = Backbone.Model.extend({
  initialize: function () {
  },
  url: 'call_charges/',
  defaults: {
    calls: {},
    total: '0.00'
  }
});

var CallChargesView = Backbone.View.extend({
  el: $("#container-callcharges"),
  template: _.template($("#template-callcharges").html()),
  type: "CallChargesView",
  initialize: function() {
    this.model.on("change", this.render, this);
    this.render();
  },
  render: function() {
    this.$el.html(this.template({
      collection: this.model.toJSON()["calls"],
      total: this.model.toJSON()["total"]
    }));

    return this;
  }
});
 
var callCharges = new BillingApp.Models.CallCharges();
var callChargesView = new CallChargesView({ model: callCharges });

callCharges.fetch({
    success: function() { ; },
    error: function() {
        console.log('Failed to fetch CallCharges!');
    }
});

/* Button Handlers */
$(document).ready(function() {
  $("#cc_button").click(function(){
    $("#cc_table").toggleClass('hidden');
  }); 
});
