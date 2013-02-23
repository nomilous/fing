should = require 'should'
Stack  = require '../lib/stack'
require '../lib/fing'

describe 'Stack', -> 

    it 'provides optional access to the process stack', (done) ->

        Stack.trace.should.be.an.instanceof Function
        done()


    it 'generates a stack array when called', (done) ->

        Stack.trace().should.be.an.instanceof Array
        done()

