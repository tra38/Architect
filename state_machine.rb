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

battle = StateMachine.new(:battle, "Bob and Tom fought with each other. Bob won.",{
	:wedding => "Tom was jealous at Bob's marriage and tried to kidnap the Significant Other.",
	:quest => "Bob found the Holy Grail, but it was being guarded by the evil Tom.",
	})
wedding = StateMachine.new(:wedding, "Bob got married to the Significant Other.",{
	:quest => "Halfway through his journey, Bob falls in love with a Significant Other and realized that the Holy Grail was meaningless.",
	:battle => "By defeating Tom, Bob was able to impress a Significant Other."
	})
quest = StateMachine.new(:quest,"Bob went on a quest to find the Holy Grail.",{
	:battle => "Looking through Tom's corpse, Bob finds a book that talks about the 'Holy Grail' and how much money it is worth.",
	:wedding => "But the Significant Other soon fell under the 'Sleeping Sickness'. A rich merchant told Bob that the only cure is the Holy Grail."
	})

array = [battle,wedding,quest]
array.shuffle!

previous_state = nil

array.each do |element|
	puts element.transition_from(previous_state) if previous_state
	puts element.sentence
	previous_state = element.state
end
