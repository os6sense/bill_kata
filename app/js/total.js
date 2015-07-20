/*global $:false, jQuery:false, window: false, Backbone: false, _: false*/
BillingApp.Models.Total = Backbone.Model.extend({
  initialize: function () {
  },
  url: 'total/',
  defaults: {
    total: '0.00'
  }
});

var TotalView = Backbone.View.extend({
  el: $("#container-total"),
  template: _.template($("#template-total").html()),
  type: "TotalView",
  initialize: function() {
    this.model.on("change", this.render, this);
    this.render();
  },
  render: function() {
    this.$el.html(this.template(this.model.toJSON()));
    return this;
  }
});
 
var total = new BillingApp.Models.Total();
var totalView = new TotalView({ model: total });

total.fetch({
    success: function() { ; },
    error: function() {
        console.log('Failed to fetch Total!');
    }
});
