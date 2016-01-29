class StateMachine
	attr_reader :state, :sentence, :hash

	def initialize(state, sentence, hash)
		@state = state
		@sentence = sentence
		@hash = hash
	end

	def transition_from(previous_state)
		@hash[previous_state]
	end
end