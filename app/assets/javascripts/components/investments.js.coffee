  @Investments = React.createClass
    getInitialState: ->
      investments: @props.data
    getDefaultProps: ->
      investments: []
    addInvestment: (investment) ->
      investments = @state.investments.slice()
      investments.push investment
      @setState investments: investments
    render: ->
      React.DOM.div
        className: 'investments'
        React.DOM.h1
          className: 'title'
          'Investments'
        React.createElement InvestmentForm, handleNewInvestment: @addInvestment
        React.DOM.table
          className: 'table table-bordered'
          React.DOM.thead null
              React.DOM.th null, 'Date'
              React.DOM.th null, 'Purpose'
              React.DOM.th null, 'Amount'
              React.DOM.th null, 'Income-Outcome'
              React.DOM.th null, 'Asset-Liability'
            React.DOM.tbody null,
              for investment in @state.investments
                React.createElement Investment, key: investment.id, investment: investment
