@InvestmentForm = React.createClass
  getInitialState: ->
    date: ''
    purpose: ''
    amount: ''
    incomeOutcome: ''
    assetLiability: ''
  handleValueChange: (e) ->
    valueName = e.target.name
    @setState "#{ valueName }": e.target.value
  valid: ->
    @state.date && @state.purpose && @state.amount && @state.incomeOutcome && @state.assetLiability
  handleSubmit: (e) ->
    e.preventDefault()
    $.post '', { investment: @state }, (data) =>
      @props.handleNewInvestment data
      @setState @getInitialState()
    , 'JSON'
  render: ->
    React.DOM.form
      className: 'form-inline'
      onSubmit: @handleSubmit
      React.DOM.div
        className: 'form.group'
        React.DOM.input
          type: 'date'
          className: 'form-control'
          placeholder: 'date'
          name: 'date'
          value: @state.date
          onChange: @handleValueChange
        React.DOM.input
          type: 'text'
          className: 'form-control'
          placeholder: 'purpose'
          name: 'purpose'
          value: @state.purpose
          onChange: @handleValueChange
        React.DOM.input
          type: 'integer'
          className: 'form-control'
          placeholder: 'amount'
          name: 'amount'
          value: @state.amount
          onChange: @handleValueChange
        React.DOM.input
          type: 'boolean'
          className: 'form-control'
          placeholder: 'Income-Outcome'
          name: 'incomeOutcome'
          value: @state.incomeOutcome
          onChange: @handleValueChange
        React.DOM.input
          type: 'boolean'
          className: 'form-control'
          placeholder: 'Asset-Liability'
          name: 'assetLiability'
          value: @state.assetLiability
          onChange: @handleValueChange
        React.DOM.button
          type: 'submit'
          className: 'btn btn-primary'
          disabled: !@valid()
          'Track Expense'
