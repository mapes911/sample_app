###
Test specs for Backbone model - User
###

describe 'Suite101.Models.User', ->

  beforeEach ->
    this.user = new Suite101.Models.User()


  it 'should be defined', ->
    expect(Suite101.Models.User).toBeDefined()


  describe 'new instance default values', ->

    it 'has default value for the .email attribute', ->
      expect(this.user.get('email')).toEqual ''

    it 'has default value for the .name attribute', ->
      expect(this.user.get('name')).toEqual ''      