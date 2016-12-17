@Investment = React.createClass
  render: ->
    React.DOM.tr null,
      React.DOM.td null, @props.investment.date
      React.DOM.td null, @props.investment.purpose
      React.DOM.td null, @props.investment.amount
      React.DOM.td null, @props.investment.incomeOutcome
      React.DOM.td null, @props.investment.assetLiability
