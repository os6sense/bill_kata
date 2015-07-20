/*global $:false, jQuery:false, window: false, Backbone: false, _: false*/
BillingApp.Models.SubsPackage = Backbone.Model.extend({
  initialize: function () {
  },
  url: 'package/',
  defaults: {
    subscriptions: { 
      type: '',
      name: '',
      cost: 0.00
    },
    total: 0.00
  }
});

var SubsPackageView = Backbone.View.extend({
  el: $("#container-package"),
  template: _.template($("#template-package").html()),
  type: "PackageView",
  initialize: function() {
    this.model.on("change", this.render, this);
    this.render();
  },
  render: function() {
    this.$el.html(this.template({
      collection: this.model.toJSON()["subscriptions"],
      total: this.model.toJSON()["total"]
    }));

    return this;
  }
});
 
var subsPackage = new BillingApp.Models.SubsPackage();
var subsPackageView = new SubsPackageView({ model: subsPackage });

subsPackage.fetch({
    success: function() { ; },
    error: function() {
        console.log('Failed to fetch subsPackage!');
    }
});
