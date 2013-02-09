should    = require 'should'
fing      = require '../src/fing'
including = it

describe 'fing provides function meta data', ->

    including 'arg details', (done) -> 

        (->).fing.args.length.should.equal 0
        done()

    including 'each arg name', (done) -> 

        ((one,two,three)->).fing.args[2].name.should.equal 'three'
        done()


describe 'fing provides object / instance meta data', ->

    including 'an identity that is unique for each instance of an object', (done) ->

        class Thing
            constructor: (a,b) ->
        
        thing1 = new Thing
        thing2 = new Thing


        thing1.fing.should.eql 

            type: 'instance'  # <---------------------------------- instance of a thing
            name: 'Thing'
            args: [{name:'a'},{name:'b'}]
            id: 3
            ref: 'instance:Thing:3'

        thing2.fing.should.eql 

            type: 'instance'
            name: 'Thing'
            args: [{name:'a'},{name:'b'}]
            id: 5
            ref: 'instance:Thing:5'


        thing2.fing.ref.should.equal 'instance:Thing:5'

        done()



    including 'an identity that is unique for each \'class\' / prototype definition', (done) ->


        class Whatsit
            constructor: (a,b) ->

        Whatsit.fing.should.eql 

            type: 'prototype' # <------------------------------- a class or function
            name: 'Whatsit'
            args: [{name:'a'},{name:'b'}]
            id: 6
            ref: 'prototype:Whatsit:6'

        #
        # redefined
        #

        class Whatsit
            constructor: (a,b) ->

        Whatsit.fing.should.eql 

            type: 'prototype'
            name: 'Whatsit'
            args: [{name:'a'},{name:'b'}]
            id: 7           # <-------------------------- new definition, new id
            ref: 'prototype:Whatsit:7'


        done()

    including 'shared function identity across class instances', (done) ->


        class Doodad
            func: ->

        thing1 = new Doodad()
        thing2 = new Doodad()

        thing1.func.fing.id.should.equal thing2.func.fing.id

        done()








