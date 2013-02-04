Object.defineProperty Function.prototype, 'fing',

    set: (value) -> # nothing to set

    get: -> 

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

            args: args

        }


module.exports = {}
