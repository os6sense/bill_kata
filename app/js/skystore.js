/*global $:false, jQuery:false, window: false, Backbone: false, _: false*/
BillingApp.Models.SkyStore = Backbone.Model.extend({
  initialize: function () {
  },
  url: 'sky_store/',
  defaults: {
    rentals: { 
      title: '',
      cost: '0.00'
    },
    buyAndKeep: {
      title: '',
      cost: '0.00'
    },
    total: '0.00'
  }
});

var SkyStoreView = Backbone.View.extend({
  el: $("#container-skystore"),
  template: _.template($("#template-skystore").html()),
  type: "SkyStoreView",
  initialize: function() {
    this.model.on("change", this.render, this);
    this.render();
  },
  render: function() {
    this.$el.html(this.template({
      rentals: this.model.toJSON().rentals, //["rentals"],
      buyandkeep: this.model.toJSON().buyAndKeep, //["buyAndKeep"],
      total: this.model.toJSON()["total"]
    }));
    return this;
  }
});
 
var skyStore = new BillingApp.Models.SkyStore();
var skyStoreView = new SkyStoreView({ model: skyStore });

skyStore.fetch({
    success: function() { ; },
    error: function() {
        console.log('Failed to fetch skystore!');
    }
});
