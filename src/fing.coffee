idSequence = 0

Object.defineProperty Function.prototype, 'fing',

    #
    # Responds for the case of functions and 'Classes'
    #

    set: (value) ->

    get: -> 

        @__id ||= ++idSequence

        args = []

        #
        # it contains the function arg details
        # as follows:
        # 
        # <function>.fing.args = [{name:'arg1'},{name:'arg2'},...]
        #

        for name in this.toString().match(

            /\((.*)\)\s{/

        )[1].split(', ')    # 
                            # would be nice to also 
                            # do the split in the
                            # regex expression
                            #  

            args.push name: name if name

        return {

            type: 'prototype'
            name: @name
            args: args # contains constructor arg signature if a class
                       # or the function arg signature
            id: @__id
            ref: "prototype:#{@name}:#{@__id}"

        }


Object.defineProperty Object.prototype, 'fing',

    #
    # Responds for the case 'Class' instances
    #

    get: ->

        @__id ||= ++idSequence

        return {

            type: 'instance'
            name: @constructor.name
            args: @constructor.fing.args # contains constructor arg signature
            id: @__id
            ref: "instance:#{@constructor.name}:#{@__id}"

        }


module.exports = {}
