require 'open-uri'

class GamesController < ApplicationController
    def news
    @letters = []
    chars = ("A".."Z").to_a
    10.times do
      @letters << chars[rand(chars.length-1)]
    end
        
    end
    def score
        @w=params[:word].upcase.split('') 
        @l=params[:tag]
        @w.each do |wletra|
           @teste = 1 if wletra.in?(@l) == false
        end
        @message = "sorry but #{@w.join} can´t be built out of #{@l}" if @teste
        
        url = "https://wagon-dictionary.herokuapp.com/#{@w.join.downcase!}"
        word_serialized = open(url)
        word = JSON.parse(word_serialized.read)
        @message2 = " Sorry but #{@w.join} does not seen to be a valid English Word " if word['found'] == false && @message == nil
   
        @message3 = "Congratulations! #{@w.join} is a valid English word!" if @message == nil && @message2 == nil

    end
    
end
