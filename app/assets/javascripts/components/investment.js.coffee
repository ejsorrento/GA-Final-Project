@Investment = React.createClass
  handleDelete: (e) ->
    e.preventDefault()
    $.ajax
      method: 'DELETE'
      url: "/investments/#{ @props.investment.id }"
      dataType: 'JSON'
      success: () =>
        @props.handleDeleteInvestment @props.investment
  render: ->
    React.DOM.tr null,
      React.DOM.td null, @props.investment.date
      React.DOM.td null, @props.investment.purpose
      React.DOM.td null, @props.investment.amount
      React.DOM.td null, @props.investment.incomeOutcome
      React.DOM.td null, @props.investment.assetLiability
      React.DOM.td null,
        React.DOM.a
          className: 'btn btn-danger'
          onClick: @handleDelete
          'Delete'
