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


    it 'provides access to the made call', (done) ->

        #
        # mocha made the call
        #
        Stack.trace()[0].call.should.equal 'Context.<anonymous>'
        done()

    