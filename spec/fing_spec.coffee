should    = require 'should'
fing      = require '../src/fing'
including = it

describe 'fing provides function meta data', ->

    including 'arg details', (done) -> 

        (->).fing.args.length.should.equal 0
        done()

