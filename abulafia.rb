require_relative 'state_machine'
require 'yaml'

#First, generate the name of the location where this story takes place
puts "Please give me the name of a noun."
noun = gets.chomp.capitalize

noun += " " + ['museum','plaza','center','foundation','academy'].sample.capitalize


#Most of this text came from http://www.random-generator.com/index.php?title=Film_Noir_Monologue. Attributed under CC-BY.

#All I need now is the intro and the stinger, just to add a little more variation. And then package it up.

# Reduce to 5 stories, only pull 3 passages, then random beginning and endinhg

#Er...now I have 6 stories, pulling 3 passages each. 6 stories, pull 3 ...means 6*5*4 = 120 possibilities. This should meet their critera for unique stories.

filler = YAML::load_file(File.join(__dir__, 'filler.yml'))
introduction = filler["introduction"]
conclusion = filler["conclusion"]

skyscraperdeath = StateMachine.new(:skyscraperdeath, "I stopped off at the #{noun} and ordered the best burger the city has to offer, when in walks Investigator Blake—looking for me, as usual. Turned out George Cobb managed to get himself wasted. Looks like our late lamented unfortunate soul got worked over by a lead pipe. Autopsy results showed up late yesterday. “Dammit,” I growled.",{
  :date_gone_wrong => "Miss Kitty Baker just smiled at me and left my office. She said that I would receive her message at the #{noun}. Confused, I decided to walk into the tiger's maw...to the cursed skyscraper itself. If it was a trap, I would be ready for it.",
  :origin_story => "Before his untimely death, Bobby Jackson met with George Cobb at the skyscraper. I decided to walk over to the #{noun} myself, to see if I can maybe interrogate George and learn more information about Bobby's murderers.",
  :babysitting => "But, as much as I hate to admit it, Simpson may have had a point. So I walked over to the #{noun}, hoping to see any suspicious behavior by the staff that could suggest shady activities.",
  :major_breakthrough => "The G-Men supposedly hang out at the #{noun} itself, monitoring any suspicious people that they wish to kill. I took this as a cue to go to the cursed skyscraper myself, to hopefully catch a glimpse of these vigilantes in action.",
  :george_message => "I need to meet George Cobb in person to learn more. I knew George had always loved seeing the #{noun}, so I decided to visit the cursed building myself."
  })

date_gone_wrong = StateMachine.new(:date_gone_wrong, "Miss Kitty Rider prowled through my door like a tigress slinks into a Burmese orphanage—a pinup blonde with legs as far as you could want ’em. No dame her age could afford a coat like that, my money was right where my mind was: the gutter. She was to bad news what apple pie is to America. The dame was all business—before I could even close the office door, she told me she wants Investigator Blake dead. Turns out Blake is masterminding the gang violence, and wants to seize the #{noun} for himself by killing off all his rivals. I laughed at her; Blake may be a devil, but he's a devil I can work with. I wasn't going to sell him out.",
{
  :skyscraperdeath => "George Cobb's best friend was a police informant named Miss Kitty Rider. I invited her into  my office, to see if she could explain what has just happened.",
  :george_message => "Daniel Santiago's closest 'friend' was a police  informant named Miss Kitty Rider. I invited her into my office, to see if she could explain what has just happened.",
  :major_breakthrough => "I knew that the rogue G-Men answered to a dame named Miss Kitty Rider. So I called her up and asked her to come to my office for a little 'meeting of the minds'. I arrived to my office, and made sure my gun was ready.",
  :babysitting => "I needed a new partner. Someone who actually had a brain. George Cobb had personally vouched for Miss Kitty Rider in the past, as a police informant with connections to the underworld. I invited her over to my office, for an impromptu 'job interview'.",
  :origin_story => "Before his death, Bobby Jackson met with the police informant Miss Kitty Rider. I called her up for a 'friendly chat', but we both knew it would be a hostile interrogation."
  })

george_message = StateMachine.new(:george_message, "I strolled into the house. As soon as I got in the door, I saw this handwritten note from George Cobb. Turns out Daniel Santiago had been exterminated. The departed’s flask stopped the first bullet—but not the second, or third. Attached to the handwritten note was a torn newspaper article fromt he morning paper. Its headline: '#{noun} To Close Down Due To Gang Violence.' Was there any connection? I dusted off my jacket, lit up my last cigar, grabbed my hat and walked out. “I need a promotion,” I snarled, grabbing my piece.",
{
  :skyscraperdeath => "Since George Cobb was strangled at his house, I decided to pay that house a visit. I wanted to find any clues that would lead me to Cobb's killer.",
  :date_gone_wrong => "Miss Kitty Rider shook her head sadly and walked out of my office, saying only that I will meet the same fate as George Cobb. Suspecting that this was a veiled threat, but curious as to what that threat actually meant, I decided to pay a visit to Cobb's house.",
  :babysitting => "If I was to solve this case on my own, I needed to get a lot of data quickly. I knew that George Cobb had kept numerous records about every murder in the city connected to the #{noun}. George would probably not even notice if I decided to 'borrow' some of his notes.",
  :origin_story => "Bobby Jackson had previously hired George Cobb for certain 'services', so I decided to pay Cobb's house a visit, to see if I can find any records that would explain what those 'services' were.",
  :major_breakthrough => "It seemed that these rogue G-Men had a relationship with George Cobb, and gave Cobb numerous records about every murder in the city connected to the #{noun}. George would probably not even notice if I decided to 'borrow' some of his notes."
  })

babysitting = StateMachine.new(:babysitting, "“An inside job…?” Simpson gasped timidly. “Well … No… not an inside job,” I growled. I could barely contain myself with this new guy. “Here’s the deal,” I muttered, “Why don’t I handle this case, while you make like a magnet … and flux off?” ",{
  :skyscraperdeath => "I pleaded Investigator Blake for assistance; this conspiracy is way too much for one man to tackle. Investigator Blake heard my pleas...and told me that I would get a fresh recruit from the police academy who is 'on the ball'. Mr. Simpson.",
  :date_gone_wrong => "I asked Miss Kitty Rider if there was another way to end the gang violence, without having to take out Investigator Blake. Miss Kitty Rider responded me that if I wanted to bring an end to the violence, then I needed someone who is outside of the system. She recommended a fresh recruit from the police academy who was 'on the ball'. Mr. Simpson. I foolishly took her advice.",
  :george_message => "I continued reading the note. George Cobb mentioned that he knew of a fresh recruit who was 'on the ball'. Supposedly, he found out who killed Daniel Santiago. I decided to meet up with Mr. Simpson, foolishly thinking that he could be a valuable partner.",
  :origin_story => "Before his death, Bobby Jackson had hired Mr. Simpson, a fresh recruit from the police academy who was 'on the ball'. Bobby wanted to use this recruit to wage his own private war over the #{noun}. I decided to pay a visit to Mr. Simpson's house, foolishly thinking that he could be a valuable partner for me.",
  :major_breakthrough => "Desiring to get in the 'good graces' with the office and receive more of their expert advice, I scheduled a meeting with the boss, Mr. Simpson. Mr. Simpson had an excellent reputation for being 'on-the-ball'. As soon as Mr. Simpson opened his mouth though, I realized that his reputation was thoroughly undeserved."
  })

origin_story = StateMachine.new(:origin_story,"This case was a real tough one: the #{noun}, towering over the downtown skyline, an attractive tourist attraction for the elite and powerful. Every vulture capitalist wanted to own a piece of nostalgia, and all of them were willing to pay the ultimate price. The latest victim? Bobby Jackson. Seems there was a struggle … and our late lamented poor slob was strangled to death. Allegedly, the deed was done within the past 24 hours. “Just my luck”, I mumbled to no one in particular.", {
  :skyscraperdeath => "Investigator Blake told me that his only lead was a snitch named Bobby Jackson. He lived on the third floor of this skyscraper. My brief glimmer of hope disappeared when I found Bobby's dead body on the second floor.",
  :date_gone_wrong => "Miss Kitty Rider then gave a sob story about how her brother, Bobby Jackson, was murdered as part of the gang wars over the #{noun}. I told her that I might 'consider' her request to kill Investigator Blake if she led me to Bobby's dead body. She agreed to my request.",
  :george_message => "I continued reading the note. George Cobb mentioned that he interviewed Bobby Jackson, a wealthy investor with direct ties to the #{noun}, to find out more information about the death of Daniel Santiago. I decided to pay a visit to Bobby's house...but only found Bobby's dead body instead. Just my luck.",
  :babysitting => "I needed a new partner. Someone who actually had a brain. In the past, George Cobb recommended Bobby Jackson, a wealthy investor with direct ties to the #{noun}, as a possible resource for me to use. I decided to pay a visit to Bobby's house...but only found Bobby's dead body instead. Just my luck.",
  :major_breakthrough => "Desiring to get in the 'good graces' with the office and receive more of their expert advice, I scheduled a meeting with the boss, Bobby Jackson. But when I arrived at Bobby Jackson's house, all I found was his dead body. Just my luck."
  }

  )
major_breakthrough = StateMachine.new(:major_breakthrough,"I had little to go on this time … but the office did manage to dig something up. G-Men, fighting crime and resisting corruption, deciding that the best way to fight crime and resist corruption is to kill everyone who might be a criminal and might be corrupt. Their current goal is to 'purify' the #{noun} before moving onto other tourist attractions. I always knew that G-Men were a little 'special'.",
{
  :skyscraperdeath => "Investigator Blake gave me the phone number of the office, suggesting that they may have more information.  Desperate for any clues that could solve this case, I decided to contact the office. I spoke to the receptionist for an hour, and jotted down everything she said.",
  :date_gone_wrong => "Miss Kitty Rider giggled. She said that I could be persuaded to kill Investigator Blake once I talked to the office. I was curious, so I asked Miss Kitty Rider for a phone number. I spoke to the receptionist for an hour, and jotted down everything she said.",
  :george_message => "I continued reading the note. George Cobb wrote down the phone number of the office. I called up that number, desperate for any leads. I spoke to the receptionist for an hour, and jotted down everything she said.",
  :babysitting => "Before I left, Mr. Simpson offered me the phone number to the office. He claimed that the office had helped him greatly and that it can help me too. Desperate for any clues, I took Mr. Simpson's advice. I spoke to the receptionist for an hour, and jotted down everything she said.",
  :origin_story => "Bobby Jackson's dead body carried a letter addressed to the office. I called up that number, and said that I am working on an investigation and that they better cooperate if they want to avenge Bobby's death. The office agreed to my humble request. I spoke to the receptionist for an hour, and jotted down everything she said."
  })

array = [skyscraperdeath,date_gone_wrong,george_message,babysitting,origin_story,major_breakthrough]
array = array.shuffle.take(3)
previous_state = nil

puts introduction.sample

array.each do |element|
  puts element.transition_from(previous_state) if previous_state
  puts element.sentence
  previous_state = element.state
end

puts conclusion.sample
