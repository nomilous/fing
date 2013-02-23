module.exports = Stack = 

    trace: (object) -> 

        #
        # generate an error and marshal its stack
        #

        stack = []

        #
        # first two calls in the stack are
        # Object.error and this.trace()
        #
        skip  = 2
        count = 0

        for line in Error.apply(this).stack.split('\n')

            continue if line == 'Error'
            continue unless ++count > skip

            console.log line

            parts = line.match /^.*at (.*)\((.*)\)/

            stack.push 

                call: parts[1].trim()

        return stack
