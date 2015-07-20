/*global $:false, jQuery:false, window: false, Backbone: false, _: false*/
BillingApp.Models.Statement = Backbone.Model.extend({
  initialize: function () {
  },
  url: 'statement/',
  defaults: {
    generated: '01-01-1971',
    due: '01-01-1970',
    period: { 
      from: '01-01-1970',
      to: '01-01-1970',
    }
  }
});

var StatementView = Backbone.View.extend({
  el: $("#container-statement"),
  template: _.template($("#template-statement").html()),
  type: "StatementView",
  initialize: function() {
    this.model.on("change", this.render, this);
    this.render();
  },
  render: function() {
    this.$el.html(this.template(this.model.toJSON()));
    return this;
  }
});
 
var statement = new BillingApp.Models.Statement();
var statementView = new StatementView({ model: statement });

statement.fetch({
    success: function() { ; },
    error: function() {
        console.log('Failed to fetch Statement!');
    }
});
