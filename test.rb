class Slot
    
    def initialize
        @coin = 100
        @point = 0
        
    end
    
    def display
        puts "---------------"
        puts "残りは　#{@coin}コイン　です"
        puts "ポイントは　#{@point}ポイント　です"
        puts "何コイン入れますか(＊＊＊半角で打ちましょう＊＊＊)"
        puts "１（１０コイン）,２（３０コイン）,３（５０コイン）,４（やめとく）"
        @bet_coin = gets.to_i
    end
    
    def coin_check
        case
            when @bet_coin == 1
                puts "bet coin is 10"
                @bet_coin = 10
                
            when @bet_coin == 2
                puts "bet coin is 30"
                @bet_coin = 30
                
            when @bet_coin == 3
                puts "bet coin is 50"
                @bet_coin = 50
                
            else
                puts "やめ時も肝心"
                exit
        end
    end
    
    def spin
        
        puts "enterキーを押してスロットを止めよう"
        if @coin < @bet_coin
            puts "--------------------"
            puts "コインが足りないよ"
            puts "また遊んでね"
            exit
        end
        
        require 'io/console'
        @coin = @coin - @bet_coin
        
        @left1,@center1,@right1 = nil
        @left2,@center2,@right2 = nil
        @left3,@center3,@right3 = nil
        
        enter_pushed = 0
        while enter_pushed <= 2
            (key = STDIN.getch) 
            enter_pushed += 1
            puts "--------------------------"
            if enter_pushed == 1
                @left1 = rand(1..9)
                @left2 = rand(1..9)
                @left3 = rand(1..9)
                puts "|#{@left1}|#{@center1}|#{@right1}|"
                puts "|#{@left2}|#{@center2}|#{@right2}|"
                puts "|#{@left3}|#{@center3}|#{@right3}|"
                
            elsif enter_pushed == 2
                @center1 = rand(1..9)
                @center2 = rand(1..9)
                @center3 = rand(1..9)
                puts "|#{@left1}|#{@center1}|#{@right1}|"
                puts "|#{@left2}|#{@center2}|#{@right2}|"
                puts "|#{@left3}|#{@center3}|#{@right3}|"
                
            elsif enter_pushed == 3
                @right1 = rand(1..9)
                @right2 = rand(1..9)
                @right3 = rand(1..9)
                puts "|#{@left1}|#{@center1}|#{@right1}|"
                puts "|#{@left2}|#{@center2}|#{@right2}|"
                puts "|#{@left3}|#{@center3}|#{@right3}|"
            else
                puts "もうスピンしません"
            end
            
        end
    end
            
    def spin_check
        case
            when @left1 == @center1 && @center1 == @right1
                puts "----------------------"
                puts "上のラインで#{@left1}が揃いました"
                spin_result()
        end
         
        case 
            when @left2 == @center2 && @center2 == @right2
                puts "----------------------"
                puts "中央のラインで#{@left2}が揃いました"
                spin_result()
        end
        
        case 
            when @left3 == @center3 && @center3 == @right3
                puts "----------------------"
                puts "下のラインで#{@left3}が揃いました"
                spin_result()
        end
    end
    
    def spin_result
        @point = @point + 500
        @result_coin = @bet_coin * 10
        puts "#{@result_coin}コイン獲得です"
        @coin = @coin +  @result_coin
        @result = 0
        puts "500ポイント獲得です"
    end
end

slot_machine = Slot.new

while
slot_machine.display
slot_machine.coin_check
slot_machine.spin
slot_machine.spin_check
end
